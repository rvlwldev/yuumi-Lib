<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>"
	rel="stylesheet">
<head>
<%@include file="/inc/common_header.jsp"%>

<title>문의게시판</title>
</head>
<body>
	<%@include file="/inc/top_menu.jsp"%>
	<div class="container">
		<div class="page-header">
			<div class="row">
				<h3>문의게시판h3 ${sessionScope.USER_INFO}</h3>
			</div>
			<div class="panel panel-default"></div>
		</div>



		<div class="col-sm-2 col-sm-offset-10 text-right"
			style="margin-bottom: 5px">
			<c:if test="${not empty sessionScope.USER_INFO}">
				<i class="fa fa-plus"></i>
				<a href="qnaForm.lol" class="btn btn-primary btn-primary btn-lg">문의하기
				</a>
			</c:if>
			<c:if test="${empty sessionScope.USER_INFO}">
				<a href="<%=request.getContextPath()%>/login/login.lol">로그인</a>하면 문의할 수 있습니다.
			</c:if>
		</div>

		<table class="table table-bordered">
			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="20%" />
				<col width="5%" />
				<%-- 		<col width="5%" /> --%>
				<col width="5%" />
			</colgroup>
			<tr>
				<th>문의번호</th>
				<th>ID</th>
				<th>회원명</th>
				<th>제목</th>
				<th>등록일</th>
				<th>조회수</th>

			</tr>

			<!-- 			<tr> -->
			<%-- 				<td>${st.count}</td>
				<!-- 이프문으로 감싸서 관리자일때 a태그사용 -->
				<td><a href="memberView.lol?memId=${vo.QbMemId}">${vo.QbmemId}</a></td>
				<td>${vo.QbWriter}</td>
				<td>${vo.QbTitle}</td>
				<td>${vo.QbRegDate}</td>
				<td>${vo.QbHit}</td>
			</tr> --%>




			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="vo" varStatus="st">
					<tr>
						<td>${vo.qbNum}</td>
						<!-- 이프문으로 감싸서 관리자일때 a태그사용 -->
						<td><a href="memberView.lol?QbmemId=${vo.qbMemId}">${vo.qbMemId}</a></td>
						<td>${vo.qbWriter}</td>

						<td><a href="qnaView.lol?qbNum=${vo.qbNum}">${vo.qbTitle}</a></td>

						<td>${vo.qbRegDate}</td>
						<td>${vo.qbHit}</td>
					</tr>
				</c:forEach>
			</c:if>




			<c:if test="${empty list}">
				<tr>
					<td colspan="6" style="text-align: center;">아직 등록된 글이 없습니다..</td>
				</tr>
			</c:if>
		</table>
		<div style="text-align: center;">
			<div class="text-center" style="align-items: center;">
				<ul class="pagination text-center">

					<c:if test="${searchVO.curPage > searchVO.pageSize}">
						<li><a class="page-link"
							href="qnaList.lol?curPage=${searchVO.lastPage - searchVO.pageSize}">
								&lt; </a>
					</c:if>
					<!-- 페이지 단위 뒤로가기 -->

					<c:forEach var="i" begin="${searchVO.firstPage}"
						end="${searchVO.lastPage}">
						
						<c:if test="${searchVO.curPage eq i}">
							<li class="page-item active"><a class="page-link"> ${i}</a>
						</c:if>
						
						<c:if test="${searchVO.curPage ne i}">
						<li class="page-item"><a class="page-link" href="qnaList.lol?curPage=${i}" data-page="${i}">${i}</a></li>
						</c:if>
						
					</c:forEach>

					<c:if test="${searchVO.lastPage != searchVO.totalPageCount}">
						<li class="page-item"><a class="page-link"
							href="qnaList.lol?curPage=${searchVO.lastPage+1}"> &gt; </a>
					</c:if>
					<!-- 페이지 단위 앞으로가기 -->

				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>






