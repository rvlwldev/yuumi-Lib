<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>" rel="stylesheet">
<head>
 <%@include file="/inc/common_header.jsp" %>
<title>클럽목록</title>
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
		<h1>클럽 목록</h1>
	</div>
	<div class="page-header">
		<div class="panel panel-default">
			<!-- 검색폼 -->
		</div>
	</div>
	<div class="col-sm-2 col-sm-offset-7 text-right"
		style="margin-bottom: 5px">
		<c:if test="${not empty sessionScope.USER_INFO}">
			<i class="fa fa-plus"></i>
			<a href="clubForm.lol" class="btn btn-primary btn-sm">클럽등록</a>
		</c:if>
	</div>
	<table class="grid table table-striped table-bordered table-hover">
		<colgroup>
			<col width="5%" />
			<col width="20%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="5%" />
		</colgroup>
		<tr>
			<th>번호</th>
			<th>클럽명</th>
			<th>지역</th>
			<th>연령</th>
			<th>회원수</th>
		</tr>
		<c:forEach items="${list}" var="cb" varStatus="st">
			<tr>
				<%-- <td>${st.count}</td> --%>				
				<td>${cb.bkNum}</td>
				<td><a href="clubView.lol?bkClubName=${cb.bkClubName}">${cb.bkClubName}</a></td>
				<td>${cb.bkLocation}</td>
				<td>${cb.bkAge}</td>
				<td>${cb.bkMemCnt} / ${cb.bkLimit}</td>
			</tr>
		</c:forEach>
	</table>
	<nav class="text-center">
		<ul class="pagination">
    	<!-- 이전 페이지  -->
    	<c:if test="${searchVO.firstPage > 1}">
		<li class="disabled">
      		<a href="clubList.lol?curPage=${searchVO.firstPage - 1}" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
      		</a>
	    </li>
	    </c:if>
	    <!-- 페이징  -->
		<c:forEach var="i" begin="${searchVO.firstPage}" end="${searchVO.lastPage}">
		<c:if test="${searchVO.curPage eq i}">
			<li class="active"><a href="#">${i}</a>
		</c:if>
		<c:if test="${searchVO.curPage ne i}">
			<li>
				<a href="clubList.lol?curPage=${i}" data-page="${i}">${i}</a>
		</c:if>
		</c:forEach>
    	<!-- 다음 페이지  -->
		<c:if test="${searchVO.lastPage < searchVO.totalPageCount}">
			<li>
      			<a href="clubList.lol?curPage=${searchVO.lastPage + 1}" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
		</c:if>
		</ul>
	</nav>
	
</div>
<%@include file="/inc/footer.jsp" %>
<script src="<c:url value='/js/top_menu.js'/>"></script>
</body>
</html>
