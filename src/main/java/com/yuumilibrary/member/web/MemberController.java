package com.yuumilibrary.member.web;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yuumilibrary.common.dao.ICommonCodeDao;
import com.yuumilibrary.common.exception.BizDuplicateException;
import com.yuumilibrary.common.exception.BizNotFoundException;
import com.yuumilibrary.common.exception.BizRegistFailException;
import com.yuumilibrary.common.service.ICommonCodeService;
import com.yuumilibrary.common.vo.CodeVO;
import com.yuumilibrary.common.vo.ResultMessageVO;
import com.yuumilibrary.login.vo.UserVO;
import com.yuumilibrary.member.service.IMemberService;
import com.yuumilibrary.member.vo.MemberSearchVO;
import com.yuumilibrary.member.vo.MemberVO;

// @Componemt, @Service, @controller, @mapper

@Controller
public class MemberController {

	@Autowired
	private ICommonCodeDao codeService;

	@Autowired
	private IMemberService memberService;

	@RequestMapping(value = "/member/memberList.lol")
	public void memberList(ModelMap model, MemberSearchVO searchVO) throws Exception {

		List<MemberVO> list = memberService.getMemberList(searchVO);
		List<CodeVO> codes = codeService.getCodeListByParent("CN00");
		List<CodeVO> rank = codeService.getCodeListByParent("RA00");
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("list", list);
		model.addAttribute("pref", codes);
		model.addAttribute("rank", rank);

	}

	// 회원목록을 엑셀로 뽑아낸다.
	@RequestMapping("/member/getExcelMemberList.lol")
	public ModelAndView toExcel(HttpServletRequest req, HttpSession session, MemberSearchVO searchVO, ModelMap model) {
		List<MemberVO> list = memberService.getMemberListForExcel();
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("list", list);
		ModelAndView result = new ModelAndView();
		result.addObject(list);
		Calendar now = new GregorianCalendar();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);

		StringBuffer str = new StringBuffer();
		str.append(year).append(month).append(day).append(hour);
		req.setAttribute("filename", str);
		result.setViewName("member/getExcelMemberList");
		return result;
	}

	@RequestMapping(value = "/member/memberView.lol", method = RequestMethod.GET, params = "memId")
	public String memberView(HttpServletRequest req, HttpServletResponse resp, @RequestParam("memId") String id)
			throws Exception {

		MemberVO member = memberService.getMember(id);
		System.out.println(member);
		req.setAttribute("mem", member);
		// memberView.jsp
		// ${mem.memId}<sdsdf?>
		// ${mem.memId}
		// Find : <input.+?name="(\w+)".+?>
		// Repl : \${mem.$1}

		return "member/memberView";
	}

	@RequestMapping(value = "/chat/chating.lol")
	public String chatFrom(ModelMap model) throws Exception {

		return "chat/lastchat";
	}

	@RequestMapping(value = "/member/memberForm.lol")
	public String memberForm(ModelMap model) throws Exception {
		List<CodeVO> codes = codeService.getCodeListByParent("CN00");
		model.addAttribute("pref", codes);
		return "member/memberForm";
	}

	@RequestMapping(value = "/member/memberRegist.lol")
	public String memberRegist(MemberVO member, ModelMap model) throws Exception {
		try {
			memberService.registMember(member);
			return "redirect:/";
		} catch (BizDuplicateException e) {
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false).setTitle("회원 가입 실패").setMessage(e.toString()).setUrl("/member/memberForm.lol")
					.setUrlTitle("목록으로");
			model.addAttribute("resultMessage", message);
			return "common/message";

		}

	}

	@RequestMapping(value = "/member/memberEdit.lol")
	public String memberEdit(@RequestParam("memId") String memId, MemberVO member, ModelMap model, HttpSession session)
			throws Exception {

		MemberVO mem = memberService.getMember(memId);
		model.addAttribute("mem", mem);

		ResultMessageVO messageVO = null;
		UserVO user = (UserVO) session.getAttribute("USER_INFO");

		List<CodeVO> codes = codeService.getCodeListByParent("CN00");
		model.addAttribute("pref", codes);
		if (mem != null) {
			// 넘어오는 memId와 로그인 되어있는 session id 비교
			if (memId.equals(user.getUserID())) {

				return "member/memberEdit";
			} else {
				// alert 띄우기
				messageVO = new ResultMessageVO().setResult(false).setTitle("다른사람").setMessage("본인 확인해 주세요");
			}
		}
		model.addAttribute("resultMessage", messageVO);
		return "common/message";
	}

	@RequestMapping(value = "/member/memberModify.lol", method = RequestMethod.POST)
	public String memberModify(MemberVO member, ModelMap model) throws Exception {
		ResultMessageVO messageVO = null;
		try {
			List<CodeVO> codes = codeService.getCodeListByParent("CN00");
			model.addAttribute("pref", codes);

			memberService.modifyMember(member);
			messageVO = new ResultMessageVO().setResult(true).setTitle("내 정보수정 성공");

		} catch (BizNotFoundException e) {
			messageVO = new ResultMessageVO().setResult(false).setTitle("내 정보수정 실패").setMessage("해당 회원이 존재하지 않습니다.")
					.setUrl("redirect:/").setUrlTitle("메인화면");
		} catch (BizRegistFailException e) {
			messageVO = new ResultMessageVO().setResult(false).setTitle("내 정보수정 실패").setMessage("해당 회원이 존재하지 않습니다.")
					.setUrl("redirect:/").setUrlTitle("메인화면");
		}

		model.addAttribute("resultMessage", messageVO);
		return "common/message";
	}

	@RequestMapping(value = "/member/memberDelete.lol", method = RequestMethod.POST)
	public String memberDelete(MemberVO member, HttpSession session, ModelMap model) throws Exception {
		ResultMessageVO message = new ResultMessageVO();
		try {
			memberService.removeMember(member);
			session.invalidate();
			message.setResult(true).setTitle("회원 삭제 성공").setMessage("삭제에 성공했습니다.").setUrl("redirect:/")
					.setUrlTitle("메인화면");
			model.addAttribute("resultMessage", message);
			return "common/message";
		} catch (BizRegistFailException e) {
			message.setResult(false).setTitle("회원 삭제 실패").setMessage("삭제에 실패했습니다.").setUrl("redirect:/")
					.setUrlTitle("메인화면");
			model.addAttribute("resultMessage", message);
			return "common/message";
		}

	}

}
