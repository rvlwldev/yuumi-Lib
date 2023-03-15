<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<link href="<c:url value='/bootstrap3/css/bootstrap.min.css'/>" rel="stylesheet">
<head>
 <%@include file="/inc/common_header.jsp" %>

<title>해당클럽 멤버목록</title>
</head>

<body>
<%@include file="/inc/top_menu.jsp" %>
<div class="container">
	<div class="row">
		<h3>클럽 멤버목록</h3>
	</div>
</div>
<%@include file="/inc/footer.jsp" %>
<script src="<c:url value='/js/top_menu.js'/>"></script>
</body>
</html>
