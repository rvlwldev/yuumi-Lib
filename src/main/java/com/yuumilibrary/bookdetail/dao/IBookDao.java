package com.yuumilibrary.bookdetail.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yuumilibrary.bookdetail.vo.BookSearchVO;
import com.yuumilibrary.bookdetail.vo.BookVO;


@Mapper
public interface IBookDao {

	public int getBookCount(BookSearchVO searchVO)throws SQLException;
	
	public int getLoanBookCount(BookSearchVO searchVO)throws SQLException;
	
	public List<BookVO> getBookList(BookSearchVO searchVO) throws SQLException;
	
	public BookVO getBook(HashMap<String, Object> map) throws SQLException;
	
	
	
	//내가 대출한 도서 리스트
	public List<BookVO> getLoanList(BookSearchVO searchVO) throws SQLException;
	//관리자가 보는 대출현황 리스트
	public List<BookVO> getAllLoanList(BookSearchVO searchVO) throws SQLException;
	//book_detail의 book_lon_cnt +-1	
	public int updateBook(HashMap<String, Object> map) throws SQLException;
	//loan_table에 추가	
	public int updateLoanBook(HashMap<String, Object> map) throws SQLException;
	//loan_table에 삭제	
	public int updateReturnBook(HashMap<String, Object> map) throws SQLException;

	
}
