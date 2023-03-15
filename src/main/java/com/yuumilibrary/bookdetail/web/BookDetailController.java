package com.yuumilibrary.bookdetail.web;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yuumilibrary.bookdetail.service.IBookService;
import com.yuumilibrary.bookdetail.vo.BookSearchVO;
import com.yuumilibrary.bookdetail.vo.BookVO;
import com.yuumilibrary.common.exception.BizRegistFailException;
import com.yuumilibrary.common.vo.ResultMessageVO;
import com.yuumilibrary.member.service.IMemberService;
import com.yuumilibrary.member.vo.MemberVO;
import com.yuumilibrary.util.OpenApiJsonParsing;

@Controller
public class BookDetailController {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final static String serviceKey = "db6ada1743d81494989b483d48d9c418f4fef4964e259503cfeaa17be955005b";

	@Autowired
	private IBookService bookService;

	@Autowired
	private IMemberService memberService;

	@RequestMapping("/book/bookList.lol")
	public void bookList(ModelMap model, BookSearchVO searchVO) {
		List<BookVO> list = bookService.getBookList(searchVO);
		System.out.println("************************" + list);
		logger.info("list size = {}", list.size());
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "book/bookView.lol", method = RequestMethod.GET, params = { "bookIsbn", "bookName" })
	public String getBook(@RequestParam("bookIsbn") String isbn, @RequestParam("bookName") String bookName,
			String bookAuthors, ModelMap model) throws Exception {

		String address = "http://data4library.kr/api/srchDtlList?authKey=" + serviceKey + "&isbn13=" + isbn
				+ "&format=json";

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookIsbn", isbn);
		map.put("bookName", bookName);
		map.put("bookAuthors", bookAuthors);

		OpenApiJsonParsing apiJsonParsing = new OpenApiJsonParsing();
		String json = apiJsonParsing.WebConnection(address);

		// API활용해서 책 소개 내용 가져오기 ^^
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);
		JSONObject resp = (JSONObject) obj.get("response");
		JSONArray info = (JSONArray) resp.get("detail");
		JSONObject arr = (JSONObject) info.get(0);
		JSONObject res = (JSONObject) arr.get("book");

		logger.info("book map============={}", map);
		BookVO book = bookService.getBook(map);

		model.addAttribute("book", book);
		model.addAttribute("apibook", res);

		return "book/bookView";
	}

	@RequestMapping(value = "/book/loanList.lol", method = RequestMethod.GET, params = "memId")
	public void loanList(BookSearchVO searchVO, @RequestParam("memId") String memId, ModelMap model) throws Exception {
		System.out.println("야***********************야야야야양*******" + memId);
		MemberVO vo = new MemberVO();
		vo.setMemId(memId);
		searchVO.setMemId(vo.getMemId());
		List<BookVO> loanList = bookService.getLoanList(searchVO);
		logger.info("list size = {}", loanList.size());
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("loanList", loanList);
	}

	@RequestMapping("/book/allLoanList.lol")
	public void allLoanList(BookSearchVO searchVO, ModelMap model) throws Exception {
		List<BookVO> loanList = bookService.getAllLoanList(searchVO);
		logger.info("list size = {}", loanList.size());
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("loanList", loanList);
	}

	////////////////////// 전체대출현황을 엑셀파일로 뽑아낸다
	@RequestMapping(value = "/book/getExcel.lol")
	public ModelAndView toExcel(HttpServletRequest req, HttpSession session, BookSearchVO searchVO, ModelMap model) {
		List<BookVO> loanList = bookService.getAllLoanList(searchVO);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("loanList", loanList);
		ModelAndView result = new ModelAndView();
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("query", req.getParameter("query")); // where에 들어갈 조건

		result.addObject(loanList);
		
		Calendar now = new GregorianCalendar();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);

		StringBuffer str = new StringBuffer();
		str.append(year).append(month).append(day).append(hour);
		req.setAttribute("filename", str);

		result.setViewName("book/getExcel");
		return result;
	}
	//////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping(value = "/book/bookLoan.lol", method = RequestMethod.POST)
	public String loanBook(BookVO book, String isbn, String bookName, ModelMap model) throws Exception {
		ResultMessageVO messageVO = null;
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookIsbn", isbn);
			map.put("bookName", bookName);
			MemberVO vo = new MemberVO();
			vo.setMemId(book.getLoaMemId());
			book = bookService.getBook(map);
			book.setLoaMemId(vo.getMemId());
			System.out.println("@@@@@@@@@@@@@@@@@@@" + book.getLoaMemId());
			bookService.loanBook(map);

			messageVO = new ResultMessageVO().setResult(true).setTitle("대출 성공하셨습니다..");
			return "common/message";
		} catch (BizRegistFailException e) {
			messageVO = new ResultMessageVO().setResult(false).setTitle("대출 실패했습니다.").setMessage(e.toString())
					.setUrl("/book/bookList.lol").setUrlTitle("목록으로");
		}
		model.addAttribute("resultMesage", messageVO);
		return "common/message";
	}

	@RequestMapping(value = "/book/returnBook.lol", method = RequestMethod.GET, params = { "bookIsbn", "bookName" })
	public String returnBook(BookVO book, @RequestParam("bookIsbn") String isbn,
			@RequestParam("bookName") String bookName, ModelMap model) throws Exception {
		System.out.println(isbn);
		ResultMessageVO messageVO = null;
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookIsbn", isbn);
			map.put("bookName", bookName);
			MemberVO vo = new MemberVO();
			vo.setMemId(book.getLoaMemId());
			book = bookService.getBook(map);
			book.setLoaMemId(vo.getMemId());
			System.out.println("@@@@@@@@@@@@@@@@@@@" + book.getLoaMemId());
			bookService.returnBook(map);

			messageVO = new ResultMessageVO().setResult(true).setTitle("도서반납 성공하셨습니다..");
			return "common/message";
		} catch (BizRegistFailException e) {
			messageVO = new ResultMessageVO().setResult(false).setTitle("도서반납 실패했습니다.").setMessage(e.toString())
					.setUrl("/book/bookList.lol").setUrlTitle("목록으로");

		}
		model.addAttribute("resultMesage", messageVO);
		return "common/message";
	}
}
