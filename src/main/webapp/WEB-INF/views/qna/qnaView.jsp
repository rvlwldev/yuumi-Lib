<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/inc/common_header.jsp"%>
<link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>"
	rel="stylesheet">
<title>게시글 상세보기</title>
</head>

<body>
	<%@include file="/inc/top_menu.jsp"%>
	<div class="container">
		<h1>상세 보기</h1>
	</div>

	<table class="table table-striped table-bordered">
		<colgroup>
			<col width="20%" />
			<col />
		</colgroup>
		<tr>
			<th>글번호</th>
			<td>${qna.qbNum}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${qna.qbTitle}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td></td>
		</tr>
		<tr>
			<th>분류</th>
			<td></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td></td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="ck-content">${qna.qbContent}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td></td>
		</tr>
		<tr>
			<th>수정일</th>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="pull-left">
					<a href="qnaList.lol" class="btn btn-sm btn-default">목록</a>
				</div> 
				<c:if test="${sessionScope.USER_INFO.userID eq qna.qbMemId}">
					<div class="pull-right">
						<a href="qnaEdit.lol?qbNum=${qna.qbNum}"
							class="btn btn-sm btn-success"> 정보수정</a>
					</div>
				</c:if> <%-- 				<div class="pull-right">
					<a href="qnaDelete.lol?qbNum=${qna.qbNum}"
						class="btn btn-sm btn-success"> 내가쓴글삭제 ^^</a>
				</div> --%>
			</td>
		</tr>
	</table>




	<%@include file="/inc/footer.jsp"%>
	<script src="<c:url value='/js/top_menu.js'/>"></script>
</body>
</html>
