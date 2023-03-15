<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/inc/common_header.jsp" %>
 <link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>" rel="stylesheet">   
<title>게시글 상세보기</title>
<style type="text/css">
  	table.grid th {text-align:center;}
 </style>
</head>

<body>
<%@include file="/inc/top_menu.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>상세보기</h1>
	</div>

<table class="grid table table-striped table-bordered table-hover">
	<colgroup>
		<col width="20%" />
		<col />
	</colgroup>
	<tr>
		<th>글번호</th>
		<td>${free.boNum}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${free.boTitle}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${free.boMemId}</td>
	</tr>
	<tr>
		<th>분류</th>
		<td>${free.boCategoryNm}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${free.boHit}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td class="ck-content"><p>${free.boContent}</p></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<c:forEach var="f" items="${free.attaches}" varStatus="st">
				<div>
					# 파일 ${st.count} <a href="<c:url value='/attach/download/${f.ATCH_NO}' />"target="_blank"> 
					<i class="fas fa-file-download"></i> ${f.ATCH_ORIGINAL_NAME} </a> 
					Size : ${f.ATCH_FILE_SIZE} Down : ${f.ATCH_DOWN_CNT}
				</div>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${free.boRegDate}</td>
	</tr>
	<tr>
		<th>수정일</th>
		<td>${free.boModDate}</td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="pull-left">
				<a href="freeList.lol" class="btn btn-sm btn-default">목록</a>
			</div>
			<c:if test="${sessionScope.USER_INFO.userID eq free.boMemId && not empty sessionScope.USER_INFO.userID || sessionScope.USER_INFO.userRole eq '관리자'}">
				<div class="pull-right">
					<a href="freeEdit.lol?boNum=${free.boNum}&boNotice=${free.boNotice}" class="btn btn-sm btn-success">
					정보수정</a>
				</div>
			</c:if>
		</td>
	</tr>
</table>

</div>


<%@include file="/inc/footer.jsp" %>
<script src="<c:url value='/js/top_menu.js'/>"></script>
</body>
</html>
