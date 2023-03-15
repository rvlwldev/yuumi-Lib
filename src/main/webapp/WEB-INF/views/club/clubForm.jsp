<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
.popover.primary {
    border-color:#337ab7;
}
.popover.primary>.arrow {
    border-top-color:#337ab7;
}
.popover.primary>.popover-title {
    color:#fff;
    background-color:#337ab7;
    border-color:#337ab7;
}
.popover.success {
    border-color:#d6e9c6;
}
.popover.success>.arrow {
    border-top-color:#d6e9c6;
}
.popover.success>.popover-title {
    color:#3c763d;
    background-color:#dff0d8;
    border-color:#d6e9c6;
}
.popover.info {
    border-color:#bce8f1;
}
.popover.info>.arrow {
    border-top-color:#bce8f1;
}
.popover.info>.popover-title {
    color:#31708f;
    background-color:#d9edf7;
    border-color:#bce8f1;
}
.popover.warning {
    border-color:#faebcc;
}
.popover.warning>.arrow {
    border-top-color:#faebcc;
}
.popover.warning>.popover-title {
    color:#8a6d3b;
    background-color:#fcf8e3;
    border-color:#faebcc;
}
.popover.danger {
    border-color:#ebccd1;
}
.popover.danger>.arrow {
    border-top-color:#ebccd1;
}
.popover.danger>.popover-title {
    color:#a94442;
    background-color:#f2dede;
    border-color:#ebccd1;
}

</style>
<meta charset="UTF-8">
 <%@include file="/inc/common_header.jsp" %>
 <link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>" rel="stylesheet">
<title>클럽등록</title>
</head>

<body>
<%@include file="/inc/top_menu.jsp" %>
<div class="container">
	<div class="col-md-12">
	<div class="page-header">
		<h1>클럽등록</h1>
	</div>
	<form action="clubRegist.lol" method="post" class="form-horizontal" id="myform" onsubmit="return signup();">
		<!-- <div class="form-group">
			<label class="col-sm-3 control-label" for="memRank">회원 타입 선택</label>
				<div class="col-sm-6">
					<select class="form-control" id="memRank" name="memRank">
						<option value="">-- 선택하세요--</option>
						<option value="회원">회원</option>
						<option value="관리자">관리자</option>
					</select>
				</div>
		</div> -->
		<div class="form-group">
			<label class="col-sm-3 control-label" for="bkClubName">클럽명</label>
				<div class="col-sm-6">
					<input class="form-control" id="bkClubName" type="text" value="" placeholder="클럽명" name="bkClubName">
					<p class="help-block">필수항목입니다.<span class="text-danger" id="idhelp"></span></p>
				</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label" for="bkMemId">클럽장 ID</label>
				<div class="col-sm-6">
					<input class="form-control" id="bkMemId" type="text" value="${sessionScope.USER_INFO.userID}" readonly="readonly" name="bkMemId">
					<p class="help-block"><span class="text-danger" id="idhelp"></span></p>
				</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label" for="bkLocation">지역</label>
				<div class="col-sm-6">
					<input class="form-control" id="bkLocation" type="text" value="" placeholder="모임희망지역" name="bkLocation">
					<p class="help-block"></p>
				</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label" for="bkAge">연령</label>
				<div class="col-sm-6">
					<input class="form-control" id="bkAge" type="text" value="" placeholder="클럽연령" name="bkAge">
					<p class="help-block"></p>
				</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label" for="bkLimit">회원수</label>
				<div class="col-sm-6">
					<input class="form-control" id="bkLimit" type="text" value="" placeholder="클럽회원수" name="bkLimit">
					<p class="help-block">숫자만 입력 가능합니다.</p>
				</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label" for="bkTime">모임시간</label>
				<div class="col-sm-6">
					<input class="form-control" id="bkTime" type="text" value="" placeholder="클럽모임시간" name="bkTime">
					<p class="help-block"></p>
				</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label" for="bkTheme">클럽설명</label>
				<div class="col-sm-6">
					<input class="form-control" id="bkTheme" type="text" value="" placeholder="클럽설명" name="bkTheme">
					<p class="help-block">필수항목입니다.</p>
				</div>
		</div>
		<div class="form-group">
			 <div class="col-sm-12 text-center">
				<input type="submit" class="btn btn-success" value="클럽등록">
			  </div>
		</div>
	</form>
	</div>
</div>

<%-- <script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/bootstrap3/js/bootstrap.min.js'/>"></script> --%>
<%@include file="/inc/footer.jsp"%>
<script src="<c:url value='/js/top_menu.js'/>"></script>
</body>
</html>
