<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>"
	rel="stylesheet">
<head>
<%@include file="/inc/common_header.jsp"%>
<meta charset="UTF-8">
<title>전체 대출현황</title>
<style type="text/css">
#table-head {
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="/inc/top_menu.jsp"%>
	<div class="container">
		<div class="row page-header">
			<h1>전체 대출목록</h1>
		</div>
		<div class="panel panel-default">

			<div class="panel-body">
				<form name="frm_search" action="allLoanList.lol" method="post"
					class="form-horizontal">
					<input type="hidden" name="curPage" value="${searchVO.curPage }">
					<input type="hidden" name="rowSizePerPage"
						value="${searchVO.rowSizePerPage }">
					<div class="form-group">
						<label for="id_searchType" class="col-sm-2 control-label">검색</label>
						<div class="col-sm-2">
							<select id="id_searchType" name="searchType"
								class="form-control input-sm">
								<option value="B"
									${"B" eq searchVO.searchType ? 'selected="selected"' : ''}>도서명</option>
								<option value="U"
									${"U" == searchVO.searchType ? 'selected="selected"' : ''}>대출인</option>
							</select>
						</div>
						<div class="col-sm-2">
							<input type="text" name="searchWord"
								class="form-control input-sm" value="${searchVO.searchWord}"
								placeholder="검색어">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-5">
							<button type="submit" class="btn btn-sm btn-primary ">
								<i class="fa fa-search"></i> &nbsp;&nbsp;검 색
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>



		<form name="forNmae" action="returnBook.lol" method="post">
			<input type="hidden" name="loaMemId" id="loaMemId"
				value="${sessionScope.USER_INFO.userID}">
			<table class="grid table table-striped table-bordered table-hover">
				<colgroup>
					<col />
					<col />
					<col />
					<col />
					<col />
					<col />
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
						<td><a href="bookView.lol?bookIsbn=${vo.loaIsbn}">${vo.loaIsbn}</a></td>
						<td class="text-left">${vo.loaBookName}</td>
						<td class="text-left">${vo.loaMemId}</td>
						<td>${vo.loaLoanDate}</td>
						<td>${vo.loaReturnDate}</td>
						<c:if test="${vo.loaReturnYN.equals('N')}">
							<td><a href="returnBook.lol?bookIsbn=${vo.loaIsbn}"><i
									class="fas fa-user-edit"></i>&nbsp;미반납</a></td>
						</c:if>
						<c:if test="${vo.loaReturnYN.equals('Y')}">
							<td><i class="fas fa-user-edit"></i>&nbsp;반납완료</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</form>
		
		<a href="getExcel.lol">엑셀로 가져오기</a>
		
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 페이지  -->
				<c:if test="${searchVO.firstPage > 1}">
					<li class="disabled"><a
						href="loanList.lol?curPage=${searchVO.firstPage - 1}"
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
						<li><a href="loanList.lol?curPage=${i}" data-page="${i}">${i}</a>
					</c:if>
				</c:forEach>
				<!-- 다음 페이지  -->
				<c:if test="${searchVO.lastPage < searchVO.totalPageCount}">
					<li><a href="loanList.lol?curPage=${searchVO.lastPage + 1}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>


	<%@include file="/inc/footer.jsp"%>
</body>
<script type="text/javascript">
function fn_goPage(e) {
	e.preventDefault();
	console.log("fn_goPage Call", this.dataset.page );

	var f = document.forms["frm_search"];
	f.curPage.value = this.dataset.page;
	f.submit();
}

function fn_frm_search_submit() {
	var f = document.forms["frm_search"];
	f.curPage.value = 1;
	console.log("fn_frm_search_submit Call", f.curPage.value);
	f.submit();
}

function fn_rowSizePerPage_change() {
	var f = document.forms["frm_search"];
	f.curPage.value = 1;
	f.rowSizePerPage.value = this.value;
	console.log("fn_rowSizePerPage_change Call","curPage", f.curPage.value, "rowSizePerPage", f.rowSizePerPage.value);
	f.submit();
}

window.onload = function() {
	document.forms["frm_search"].addEventListener("submit",fn_frm_search_submit);
	document.getElementById("id_rowSizePerPage").addEventListener("change", fn_rowSizePerPage_change);
	document.querySelectorAll(".pagination li a[data-page]").forEach(obj => { obj.addEventListener("click", fn_goPage) } );
}

</script>
</html>