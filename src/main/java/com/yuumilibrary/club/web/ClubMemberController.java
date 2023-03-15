package com.yuumilibrary.club.web;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yuumilibrary.club.service.IClubMemberService;
import com.yuumilibrary.club.vo.ClubSearchVO;
import com.yuumilibrary.club.vo.ClubVO;
import com.yuumilibrary.common.exception.BizDuplicateException;
import com.yuumilibrary.common.exception.BizException;
import com.yuumilibrary.common.vo.ResultMessageVO;
import com.yuumilibrary.login.vo.UserVO;

@Controller
public class ClubMemberController {
	
	@Autowired
	private IClubMemberService clubMemberService;
	
	@RequestMapping("/club/clubList.lol")
	public void clubMemberList(ClubVO clubVO, ClubSearchVO searchVO, ModelMap model) throws Exception {
		List<ClubVO> list = clubMemberService.getClubList(searchVO);
		model.addAttribute("list", list);
		model.addAttribute("searchVO", searchVO);
	}
	
	@RequestMapping(value = "/club/clubView.lol", method = RequestMethod.GET, params = "bkClubName")
	public String clubMemberView(ModelMap model, @RequestParam("bkClubName")String clubName) throws Exception {
		ClubVO clubVO = clubMemberService.getClub(clubName);
		model.addAttribute("clubVO", clubVO);
		
		return "club/clubView";
	}
	
	@RequestMapping(value = "/club/clubForm.lol")
	public String clubMemberForm(ModelMap model) throws Exception {
		
		return "club/clubForm";
	}
	
	@RequestMapping(value = "/club/clubRegist.lol")
	public String clubMemberRegist(ClubVO clubVO, ModelMap model) throws Exception {
		try {
			clubMemberService.registClub(clubVO);
			return "redirect:/club/clubList.lol?msg=" + URLDecoder.decode("success", "utf-8");
		} catch (BizDuplicateException e) {
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false)
				   .setTitle("클럽 등록 실패")
				   .setMessage(e.toString())
				   .setUrl("/club/clubForm")
				   .setUrlTitle("목록으로");
			model.addAttribute("resultMessage", message);
			return "common/message";
		}
	}
	
	@RequestMapping(value = "/club/clubEdit.lol", method = RequestMethod.GET, params = "bkClubName")
	public String clubMemberEdit(@RequestParam("bkClubName") String cbName, ClubVO clubVO, ModelMap model, HttpSession session) throws Exception {
		ClubVO vo = clubMemberService.getClub(cbName);
		model.addAttribute("vo", vo);
		ResultMessageVO message = null;
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		if (vo != null) {
			if (vo.getBkMemId().equals(user.getUserID()) || user.getUserRole().equals("관리자")) {
				return "club/clubEdit";
			} else {
				message = new ResultMessageVO()
						.setResult(false)
						.setTitle("권한없음")
						.setMessage("클럽 회장만 클럽 내용 수정 및 삭제가 가능합니다.");
			}
		}
		model.addAttribute("resultMessage", message);
		return "common/message";
	}
	
	@RequestMapping(value = "/club/clubModify.lol", method = RequestMethod.POST)
	public String clubMemberModify(ClubVO clubVO, ModelMap model) throws Exception {
		ResultMessageVO message = null;
		try {
			clubMemberService.modifyClub(clubVO);
			return "redirect:/club/clubList.lol?msg" + URLDecoder.decode("success", "utf-8");
		} catch (BizException e) {
			message = new ResultMessageVO()
						.setResult(false)
						.setTitle("수정 실패")
						.setMessage("클럽이 존재하지 않습니다")
						.setUrl("redirect:/")
						.setUrlTitle("메인화면");
		}
		model.addAttribute("resultMessage", message);
		return "common/message";
	}
	
	@RequestMapping(value = "/club/clubDelete.lol", method = RequestMethod.POST)
	public String clubMemberDelete(ClubVO clubVO, ModelMap model) throws Exception {
		ResultMessageVO message = null;
		try {
			clubMemberService.removeClub(clubVO);
			return "redirect:/club/clubList.lol?msg" + URLDecoder.decode("success", "utf-8");
		} catch (BizException e) {
			message = new ResultMessageVO()
					.setResult(false)
					.setTitle("삭제 실패")
					.setMessage("클럽 삭제 실패했습니다.")
					.setUrl("redirect:/")
					.setUrlTitle("메인화면");
		}
		model.addAttribute("resultMessage", message);
		return "common/message";
	}
	
	
	

}
