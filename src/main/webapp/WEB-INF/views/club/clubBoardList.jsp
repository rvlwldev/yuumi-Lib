<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/inc/common_header.jsp"%>
<link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/freeList.css'/>" rel="stylesheet">

<meta charset="UTF-8">
<title>클럽게시판</title>
</head>
<body>
	<%@include file="/inc/top_menu.jsp"%>
	<div class="container">
		<div class="row page-header">
			<h2>클럽 게시판</h2>

			<div class="text-right">
				<c:if test="${sessionScope.USER_INFO ne null}">
					<form action="clubBoardForm.lol" method="post">
						<input type="hidden" name="cbBoClubNum" value="${clubNum}">
						<button type="submit" class="btn btn-sm btn-primary">
							<i class="fa fa-search"></i> &nbsp;&nbsp;글쓰기
						</button>
					</form>
				</c:if>
			</div>
		</div>


		<!-- 검색폼 -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form name="frm_search" action="clubBoardList.lol" method="post"
					class="form-horizontal">
					<input type="hidden" name="curPage" value="${searchVO.curPage}">
					<input type="hidden" name="cbBoClubNum"
						value="${searchVO.cbBoClubNum}"> <input type="hidden"
						name="rowSizePerPage" value="${searchVO.rowSizePerPage}">
					<div class="form-group text-left">
						<label for="id_searchType" class="col-sm-2 control-label">검색</label>

						<div class="col-sm-2">
							<select id="id_searchType" name="searchType"
								class="form-control input-sm">
								<option value="titleSearch"
									${"titleSearch" eq searchVO.searchType ? 'selected="selected"' : ''}>제목</option>
								<option value="writerSearch"
									${"writerSearch" eq searchVO.searchType ? 'selected="selected"' : ''}>글쓴이</option>
							</select>
						</div>
						<div class="col-sm-2">
							<input type="text" name="searchWord"
								class="form-control input-sm" value="${searchVO.searchWord}"
								placeholder="검색어">
						</div>
						<div class="form-group">
							<div class="col-sm-2 col-sm-offset-10">
								<button type="submit" class="btn btn-sm btn-primary ">
									<i class="fa fa-search"></i> &nbsp;&nbsp;검 색
								</button>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
		<!-- 검색폼끝 -->


		<table class="grid table table-striped table-bordered table-hover">
			<colgroup>
				<col width="10%" />
				<col />
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<tr class="text-center">
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="vo" varStatus="st">
				<tr class="text-center">
					<c:if test="${searchVO.totalRowCount ne 0}">
						<td>${vo.cbBoNum}</td>
						<td class="text-center"><a
							href="clubBoardView.lol?cbBoClubNum=${vo.cbBoClubNum}&cbBoNum=${vo.cbBoNum}&notice=${vo.cbBoNotice}">
								${vo.cbBoTitle} </a></td>
						<td>${vo.cbBoWriter}</td>
						<td>${vo.cbBoRegDate}</td>
						<td>${vo.cbBoHit}</td>
					</c:if>
					
					<c:if test="${searchVO.totalRowCount == 0}">
						<td colspan="5">글이 없습니다.. ${searchVO.totalRowCount}</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>



		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 페이지  -->
				<c:if test="${searchVO.firstPage > 1}">
					<li class="disabled"><a
						href="clubBoardList.lol?curPage=${searchVO.firstPage - 1}&cbBoClubNum=${clubNum.cbBoClubNum}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<!-- 페이징  -->
				<c:forEach var="i" begin="${searchVO.firstPage}"
					end="${searchVO.lastPage}">
					<c:if test="${searchVO.curPage eq i}">
						<li class="active"><a href="#">${i}</a>
					</c:if>
					<c:if test="${searchVO.curPage ne i}">
						<li><a
							href="clubBoardList.lol?curPage=${i}&cbBoClubNum=${clubNum}"
							data-page="${i}">${i}</a>
					</c:if>
				</c:forEach>
				<!-- 다음 페이지  -->
				<c:if test="${searchVO.lastPage < searchVO.totalPageCount}">
					<li><a
						href="clubBoardList.lol?curPage=${searchVO.lastPage + 1}&cbBoClubNum=${clubNum}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<%@include file="/inc/footer.jsp"%>
</body>
</html>