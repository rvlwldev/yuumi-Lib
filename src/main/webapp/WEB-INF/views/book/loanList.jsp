<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/inc/common_header.jsp"%>
<meta charset="UTF-8">
<title>대출현황</title>
<style type="text/css">
#table-head{
text-align: center;
}
</style>
</head>
<body>
<%@include file="/inc/top_menu.jsp" %>
<div class="container">
	<div class="row page-header">
		<h1>대출목록</h1>
	</div>
<form name="forNmae" action="returnBook.lol" method="post"> 
	<input type="hidden" name="loaMemId" id="loaMemId" value="${sessionScope.USER_INFO.userID}">
	<table class="grid table table-striped table-bordered table-hover">
	<colgroup>
		<col/>
		<col/>
		<col/>
		<col/>
		<col/>
		<col/>
	</colgroup>
	<tr id="table-head">
		<th>도서번호</th>
		<th>도서명</th>
		<th>대출인</th>
		<th>대출일</th>
		<th>반납일</th>
		<th>반납여부</th>
	</tr>
	
	<c:forEach items="${loanList}" var="vo">
	<tr class="text-center">
		<td><a href="bookView.lol?bookIsbn=${vo.loaIsbn}&bookName=${vo.bookName}&bookAuthors=${vo.bookAuthors}">${vo.loaIsbn}</a></td>
		<td class="text-left">${vo.loaBookName}</td>
		<td class="text-left">${vo.loaMemId}</td>
		<td>${vo.loaLoanDate}</td>
		<td>${vo.loaReturnDate}</td>
		<c:if test="${vo.loaReturnYN.equals('N')}">
		<td><a href="returnBook.lol?bookIsbn=${vo.loaIsbn}&bookName=${vo.loaBookName}&bookAuthors=${vo.loaBookAuthors}"><i class="fas fa-user-edit"></i>&nbsp;미반납</a></td>
		</c:if>
		<c:if test="${vo.loaReturnYN.equals('Y')}">
		<td><i class="fas fa-user-edit"></i>&nbsp;반납완료</td>
		</c:if>
	</tr>
	</c:forEach>
	</table>
</form>
</div>

	<%@include file="/inc/footer.jsp"%>
</body>
</html>