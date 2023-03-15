<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>"
	rel="stylesheet">
<%@include file="/inc/common_header.jsp"%>
<meta charset="UTF-8">
<title>도서정보</title>
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
		<h1>도서목록</h1>
	</div>
		<div class="panel panel-default">
	  <div class="panel-body">
		   <form name="frm_search" action="bookList.lol" method="post" class="form-horizontal">
			   <input type="hidden" name="curPage" value="${searchVO.curPage }">
				 <input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
			  <div class="form-group">
			    <label for="id_searchType" class="col-sm-2 control-label">검색</label>
			    <div class="col-sm-2">
			    <select id="id_searchType" name="searchType" class="form-control input-sm">
			    	<option value="N" ${"N" eq searchVO.searchType ? 'selected="selected"' : ''}>도서명</option>
					<option value="A" ${"A" == searchVO.searchType ? 'selected="selected"' : ''}>작가</option>
					<option value="C" ${searchVO.searchType.equals("C") ? 'selected="selected"' : ''}>출판사</option>
			    </select>
			    </div>
			    <div class="col-sm-2">
			      <input type="text" name="searchWord" class="form-control input-sm" value="${searchVO.searchWord}" placeholder="검색어">
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
	
		<div class="row">
		<div class="col-sm-3  form-inline" style="margin-bottom: 10px">
			전체 ${searchVO.totalRowCount} 건 
			<select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control input-sm">
				<option value="10" ${10 eq searchVO.rowSizePerPage ? 'selected="selected"' : ''}>10</option>
				<option value="20" ${20 eq searchVO.rowSizePerPage ? 'selected="selected"' : ''}>20</option>
				<option value="30" ${30 eq searchVO.rowSizePerPage ? 'selected="selected"' : ''}>30</option>
				<option value="50" ${50 eq searchVO.rowSizePerPage ? 'selected="selected"' : ''}>50</option>
			</select>
		</div>
	</div>
		
	<table class="grid table table-striped table-bordered table-hover">
	<colgroup>
		<col width="10%" />
		<col width="30%" />
		<col width="5%" />
		<col width="5%" />
		<col width="5%" />
		<col width="8%" />
	</colgroup>
	<tr id="table-head">
		<th>도서번호</th>
		<th>도서명</th>
		<th>작가</th>
		<th>출판사</th>
		<th>출판연도</th>
		<th>도서대출 수</th>
	</tr>
	<c:forEach items="${list}" var="vo" varStatus="st">
	<tr class="text-center">
		<td>${vo.bookIsbn}</td>
		<td class="text-left"><a href="bookView.lol?bookIsbn=${vo.bookIsbn}&bookName=${vo.bookName}&bookAuthors=${vo.bookAuthors}">${vo.bookName}</a></td>
		<td>${vo.bookAuthors}</td>
		<td>${vo.bookPublisher}</td>
		<td>${vo.bookPublicationYear}</td>
		<td>${vo.bookLoanCnt} / ${vo.bookCount}
		<c:if test="${vo.bookLoanCnt eq vo.bookCount}">
		<a style="color: red;">대출불가</a>
		</c:if>
		<c:if test="${vo.bookLoanCnt ne vo.bookCount}">
		<a style="color: green;">대출가능</a>
		</c:if>
		</td>
		<%-- <td>${vo.bookCount}</td> --%>
	</tr>
	</c:forEach>
	</table>
	<nav class="text-center">
		<ul class="pagination">
    	<!-- 이전 페이지  -->
    	<c:if test="${searchVO.firstPage > 1}">
		<li class="disabled">
      		<a href="bookList.lol?curPage=${searchVO.firstPage - 1}" aria-label="Previous">
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
				<a href="bookList.lol?curPage=${i}" data-page="${i}">${i}</a>
		</c:if>
		</c:forEach>
    	<!-- 다음 페이지  -->
		<c:if test="${searchVO.lastPage < searchVO.totalPageCount}">
			<li>
      			<a href="bookList.lol?curPage=${searchVO.lastPage + 1}" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
		</c:if>
		</ul>
	</nav>
</div>

	<%@include file="/inc/footer.jsp"%>
<script src="<c:url value='/js/top_menu.js'/>"></script>
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