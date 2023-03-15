<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/inc/common_header.jsp"%>
<title>클럽상세정보</title>
</head>

<body>
<%@include file="/inc/top_menu.jsp"%>
<div class="container">
	<div>
		<h1>클럽상세보기</h1>
	</div>
	<table class="grid table table-striped table-bordered table-hover">
		<colgroup>
			<col width="20%" />
			<col />
		</colgroup>
		<tr>
			<th>클럽번호</th>
			<td>${clubVO.bkNum}</td>
		</tr>
		<tr>
			<th>클럽명</th>
			<td>${clubVO.bkClubName}</td>
		</tr>
		<tr>
			<th>클럽장</th>
			<td>${clubVO.bkMemId}</td>
		</tr>
		<tr>
			<th>지역</th>
			<td>${clubVO.bkLocation}</td>
		</tr>
		<tr>
			<th>연령</th>
			<td>${clubVO.bkAge}</td>
		</tr>
		<tr>
			<th>회원수</th>
			<td>${clubVO.bkMemCnt} / ${clubVO.bkLimit}</td>
		</tr>
		<tr>
			<th>모임시간</th>
			<td>${clubVO.bkTime}</td>
		</tr>
		<tr>
			<th>클럽설명</th>
			<td>${clubVO.bkTheme}</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="pull-left">
					<a href="clubList.lol" class="btn btn-sm btn-default">목록</a>
				</div>
				<c:if test="${sessionScope.USER_INFO.userID eq clubVO.bkMemId || sessionScope.USER_INFO.userRole eq '관리자'}">
					<div class="pull-right">
						<a href="clubEdit.lol?bkClubName=${clubVO.bkClubName}" class="btn btn-sm btn-success">
						정보수정</a>
					</div>
				</c:if>
				<c:if test="${not empty sessionScope.USER_INFO && sessionScope.USER_INFO.userID ne clubVO.bkMemId}">
					<div class="pull-right">
						<a href="clubEdit.lol?bkClubName=${clubVO.bkClubName}" class="btn btn-sm btn-success">
						가입하기</a>
					</div>
				</c:if>
			</td>
		</tr>
	</table>
</div>

<%@include file="/inc/footer.jsp"%>
<script src="<c:url value='/js/top_menu.js'/>"></script>
</body>
</html>
