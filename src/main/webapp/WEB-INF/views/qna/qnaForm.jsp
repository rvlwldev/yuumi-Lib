<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/inc/common_header.jsp" %>
 <link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>" rel="stylesheet">   
<title>게시글 등록</title>
<script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>
</head>

<body>
<%@include file="/inc/top_menu.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>글 등록</h1>
	</div>
	<form action="qnaRegist.lol" method="post">
	<div>
		<input type="hidden" name="dup_key" value="${dup_key}">
		<table class="table table-striped table-bordered">
			<colgroup>
				<col width="20%" />
				<col />
			</colgroup>
			<tr>
				<th>문의사항</th>
				<td><input type="text" name="QbTitle" value="" class="form-control" required="required"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="QbWriter" value="${sessionScope.USER_INFO.userName}" class="form-control" readonly="readonly" ></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" name="QbMemId" value="${sessionScope.USER_INFO.userID}" class="form-control" readonly="readonly" ></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="70" id="idContent" name="QbContent" class="form-control"></textarea>
				</td>
			</tr>
			<tr>
			
				<td colspan="2">
					<div class="pull-left">
						<a href="qnaList.lol" class="btn btn-sm btn-default">목록으로</a>
					</div>
					<div class="pull-right">
					<button type="submit" class="btn btn-sm btn-primary">저장하기</button>
				</div>
				</td>
				
			</tr>
		</table>
	</div>
	</form>
</div>
<%@include file="/inc/footer.jsp" %>
<script src="<c:url value='/js/top_menu.js'/>"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
</body>
</html>
