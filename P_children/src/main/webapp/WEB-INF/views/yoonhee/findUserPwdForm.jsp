<!-- findUserPwdForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I Run it : 비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/js/yoonhee/memberLoginScript.js?v=2"></script>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form name="findUserPwdForm" action="${contextPath}/member/findUserPwd" method="post">
		<input type="text" name="findUserId" placeholder="아이디"><br>
		<br>
		<input type="text" name="findUserEmail" placeholder="이메일"><br>
		<br>
		<input type="button" value="비밀번호 찾기" onclick="findUserPwdCheck()">
	</form>
</body>
</html>






