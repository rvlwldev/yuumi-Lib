<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/inc/common_header.jsp"%>
<meta charset="UTF-8">
<title>도서상세정보</title>
</head>
<body>
	<%@include file="/inc/top_menu.jsp"%>
	<div class="container">
		
		<h4>정보</h4>
		<div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom:5px;">
		<form name="formName" action="bookLoan.lol" method="post">
	<input type="hidden" name="bookIsbn" id="bookIsbn" value="${apibook.isbn13}"> 
	<input type="hidden" name="bookName" id="bookName" value="${book.bookName}"> 	
	<input type="hidden" name="bookAuthors" id="bookAuthors" value="${book.bookAuthors}"> 	
	<input type="hidden" name="loaMemId" id="loaMemId" value="${sessionScope.USER_INFO.userID}"> 
<%-- 		<a href="<%=request.getContextPath()%>/book/bookLoan.lol" class="btn  btn-warning"><i class="fa fa-plus"></i>&nbsp;&nbsp;대출하기</a> --%>
		<c:if test="${not empty sessionScope.USER_INFO and book.bookCount ne book.bookLoanCnt}">
		<button type="submit" class="btn btn-sm btn-success pull-right"><i class="fas fa-user-edit"></i>&nbsp;대출하기</button>
		</c:if>
		</form>
		</div>
		ISBN13 : ${apibook.isbn13}<br>
		책이름 : ${apibook.bookname}<br>		
		<img src="${apibook.bookImageURL}"><br>
		저자명 : ${apibook.authors}<br>
		출판사 : ${apibook.publisher}<br>
		-------------------------<br>
		<h3>책 소개</h3>${apibook.description} <br>
		
	</div>
	<hr>
	<%@include file="/inc/footer.jsp"%>
</body>
</html>