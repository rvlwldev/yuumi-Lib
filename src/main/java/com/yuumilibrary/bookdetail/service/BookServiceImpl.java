package com.yuumilibrary.bookdetail.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.yuumilibrary.bookdetail.dao.IBookDao;
import com.yuumilibrary.bookdetail.vo.BookSearchVO;
import com.yuumilibrary.bookdetail.vo.BookVO;
import com.yuumilibrary.common.exception.BizDuplicateException;
import com.yuumilibrary.common.exception.BizException;
import com.yuumilibrary.common.exception.BizNotFoundException;
import com.yuumilibrary.common.exception.BizRegistFailException;
import com.yuumilibrary.common.vo.ResultMessageVO;
import com.yuumilibrary.login.vo.UserVO;
import com.yuumilibrary.member.dao.IMemberDao;
import com.yuumilibrary.member.vo.MemberSearchVO;
import com.yuumilibrary.member.vo.MemberVO;
import com.yuumilibrary.rsa.RSAsss;
import com.yuumilibrary.rsa.SHA256Util;

@Service
public class BookServiceImpl implements IBookService {

	@Autowired
	private IBookDao bookDao;

	@Autowired
	private IMemberDao memberDao;

	@Override
	public List<BookVO> getBookList(BookSearchVO searchVO) throws BizException {
		try {
			int rowCount = bookDao.getBookCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			searchVO.setting();
			System.out.println(bookDao.getBookList(searchVO));
			return bookDao.getBookList(searchVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public BookVO getBook(HashMap<String, Object> map) throws BizException {
		try {
			BookVO getB = bookDao.getBook(map);
			System.out.println("getbgetbgetb**********************************" + getB);
			
			return getB;
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}
	@Override
	public List<BookVO> getLoanList(BookSearchVO searchVO) throws BizException {
		try {
			int rowCount = bookDao.getBookCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			searchVO.setting();
			System.out.println(bookDao.getLoanList(searchVO));
			
			return bookDao.getLoanList(searchVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}
	
	@Override
	public List<BookVO> getAllLoanList(BookSearchVO searchVO) throws BizException {
		try {
			int rowCount = bookDao.getLoanBookCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			searchVO.setting();
			
			return bookDao.getAllLoanList(searchVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}
	
	@Override
	public void loanBook(HashMap<String, Object> map) throws BizException {
		try {

			
			BookVO loanB = bookDao.getBook(map);
			System.out.println(loanB);
			int a = Integer.parseInt(loanB.getBookCount());
			int b = Integer.parseInt(loanB.getBookLoanCnt());
			if (a==0 || a < b) {
				System.out.println("--------------------대출 실패---------------------------");
				throw new BizRegistFailException("도서[" + map + "]대출할 수 없습니다.");
			} else {
				if (a > 0 && a >b) {
					b+=1;
					String result = Integer.toString(b);
					map.put("bookLoanCnt", result);
					bookDao.updateBook(map); // book_loan_cnt +1
					bookDao.updateLoanBook(map);
				}
				//System.out.println("************************************" + book);
			}
		} catch (SQLException e) {
			
		}
	}

	@Override
	public void returnBook(HashMap<String, Object> map) throws BizException {
		try {
			BookVO returnB = bookDao.getBook(map);
			int a = Integer.parseInt(returnB.getBookCount());
			int b = Integer.parseInt(returnB.getBookLoanCnt());
			if (b ==0 || a < b ) {
				System.out.println("--------------------대출반납 실패---------------------------");
				throw new BizRegistFailException("도서[" + map + "]대출반납 할 수 없습니다.");
			} else {
				if (a >= b) {
					b-=1;
					String result = Integer.toString(b);
					map.put("bookLoanCnt", result);

					bookDao.updateBook(map); // book_loan_cnt -1
					bookDao.updateReturnBook(map);
				}
				//System.out.println("************************************" + book);
			}
		} catch (SQLException e) {
			
		}
	}




}
