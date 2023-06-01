<!-- member/memberLoginForm -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P_children: 로그인</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/yoonhee/memberLoginScript.js?v=1"></script>
</head>
<body>

	<h1>로그인</h1>
	<form name="memberLoginForm" action="${contextPath}/yoonhee/userCheck" method="post">
		<input type="text" name="id" value="${cookie.id.value}" placeholder="아이디"><br> <!-- 쿠키 아이디 값이 있을 경우 value 저장 -->
		<br>
		<input type="password" name="pwd" placeholder="비밀번호"><br>
		<br>
		<input type="button" value="로그인" onclick="checkLogin()"> 
		<br>
		<!-- 체크박스 생성 -->
		<input type="checkbox" id="checkbox" name="rememberId" ${empty cookie.id.value ? "":"checked"}/>
		<label for="checkbox">아이디 기억하기</label>
	</form>
		
	<span><a href="findUserIdForm">아이디 찾기</a></span>
	<span><a href="findUserPwdForm">비밀번호 찾기</a></span>
	<span><a href="">회원가입</a></span>
	
	
	
	
</body>
</html>











