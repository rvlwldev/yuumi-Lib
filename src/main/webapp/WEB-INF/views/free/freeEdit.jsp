\<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/inc/common_header.jsp" %>
 <link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>" rel="stylesheet">   
<title>게시글 수정</title>
<style type="text/css">
	table.grid th {text-align:center;}
</style>
</head>

<body>
<%@include file="/inc/top_menu.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>글 수정</h1>
	</div>
	<!-- <div class="row"> -->
		<form action="freeModify.lol" method="post" onsubmit="editform()" name='myform'>
		<input type="hidden" name="boNum" value="${free.boNum}" class="form-control" >
		<input type="hidden" name="boNotice" value="${free.boNotice}" class="form-control" >
			<table class="table table-striped table-bordered">
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
					<td><input type="text" name="boTitle" value="${free.boTitle}" class="form-control" required="required"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="boMemId" value="${free.boMemId}" class="form-control" required="required" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="boMemPass" value="" class="form-control" required="required">
						<span>수정 또는 삭제시에 필요합니다.</span>
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
					<c:if test="${sessionScope.USER_INFO.userRole eq '관리자'}">
						<c:choose>
							<c:when test="${free.boCategory eq 'BC01'}">
								<select name="boCategory" class="form-control" required="required" >
									<c:forEach items="${catList}" var="vo">
										<option value="${vo.commCd}" ${vo.commCd eq free.boCategory ? 'selected="selected"' : 'disabled'}>${vo.commNm}</option>
									</c:forEach>
								</select>
							</c:when>
							<c:otherwise>
								<select name="boCategory" class="form-control" required="required" >
									<option value="">-- 선택하세요 --</option>
										<c:forEach items="${catList}" var="vo">
											<c:choose>
												<c:when test="${vo.commCd eq 'BC01'}">
												</c:when>		
												<c:otherwise>
													<option value="${vo.commCd}" ${vo.commCd eq free.boCategory ? 'selected="selected"' : ''}>${vo.commNm}</option>								
												</c:otherwise>					
											</c:choose>
										</c:forEach>		
								</select>
							</c:otherwise>	
						</c:choose>
					</c:if>
					<c:if test="${sessionScope.USER_INFO.userRole eq '회원'}">
					<select name="boCategory" class="form-control" required="required" >
						<option value="">-- 선택하세요 --</option>
						<c:forEach items="${catList}" var="vo">
							<c:choose>
								<c:when test="${vo.commCd eq 'BC01'}">
								</c:when>		
								<c:otherwise>
									<option value="${vo.commCd}" ${vo.commCd eq free.boCategory ? 'selected="selected"' : ''}>${vo.commNm}</option>								
								</c:otherwise>					
							</c:choose>
						</c:forEach>
						</select>
					</c:if>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="3" id="idContent" name="boContent" class="form-control">${free.boContent}</textarea>
					</td>
				</tr>
				<tr>
					<th>첨부 파일</th>
						<td>
							<c:forEach var="f" items="${free.attaches}" varStatus="st">
								<div class="form-check">
									<div>
										# 파일 ${st.count} ${f.ATCH_ORIGINAL_NAME}
										Size : ${f.ATCH_FILE_SIZE}
									  <span style="color: #e44b4b;"><i class="fas fa-trash"></i></span>&nbsp;<input class="form-check-input" type="checkbox" value="${f.ATCH_NO}" name="delAtchNos" id="delAtchNos">
									</div>
								</div>
							</c:forEach>
						</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-left">
							<a href="freeList.lol" class="btn btn-sm btn-default">목록으로</a>
						</div>
						<div class="pull-right">
						<button type="submit" class="btn btn-sm btn-primary" onclick="javascript: form.action='freeModify.lol';">수정하기</button>
						<button type="submit" class="btn btn-sm btn-warning" onclick="javascript: form.action='freeDelete.lol';">삭제하기</button>
					</div>
					</td>
				</tr>
			</table>
		</form>
	<!-- </div> -->
			
</div>
 <%@include file="/inc/footer.jsp" %> 
<script src="<c:url value='/js/top_menu.js'/>"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript">
function editform() {
	var my_form_action = $('form[name="myform"]').attr('action')
	if(my_form_action == 'freeDelete.lol'){
		$('input:checkbox[name="delAtchNos"]').attr("checked", true);
		console.log(my_form_action);
	}
}


</script>
</body>
</html>
