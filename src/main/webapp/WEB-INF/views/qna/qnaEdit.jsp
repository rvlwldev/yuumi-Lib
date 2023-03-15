<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="qnaModify.lol" commandName="qna" name="formName">
		<form:hidden path="qbWriter" />
		
		<form:input path="qbNum" />
		<form:errors path="qbNum" />

		<form:input path="qbTitle" />

		<form:textarea path="qbContent" />

		<input type="submit" value="수정하기">
		<input type="submit"
			onclick="del()" value="삭제하기">
		
	${qna.qbTitle}
	content = ${qna.qbContent}
	</form:form>
	<script type="text/javascript">
	function del() {
		formName.action = 'qnaDelete.lol';
		alert("삭제되었습니다");
	}
	</script>

</body>
</html>