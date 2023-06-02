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
<script src="${contextPath}/resources/yoonhee/js//memberLoginScript.js?v=1"></script>
</head>
<body>

	<div align="center">
	
	<h1>로그인</h1>
	<form name="memberLoginForm" action="${contextPath}/member/userCheck" method="post">
		<input type="radio" name="userSelect" value="member" id="member" checked><label for="member">일반 로그인</label>
		<input type="radio" name="userSelect" value="host" id="host"><label for="host">호스트 로그인</label>
		<br>
		<input type="text" name="id" value="${cookie.CookieId.value }" placeholder="아이디"><br>
		<br>
		<input type="password" name="pwd" placeholder="비밀번호"><br>
		<br>
		<input type="button" value="로그인" onclick="checkLogin()"> 
		<br>
		<!-- 체크박스 생성 -->
		<input type="checkbox" id="checkbox" name="check" onclick="rememberCheckId()"/>
		<input type="hidden" id="testChek" name="testChek">
		<label for="checkbox">아이디 기억하기</label>
	</form>
		
	<span><a href="${contextPath }/member/findUserIdForm">아이디 찾기</a></span>
	<span><a href="${contextPath }/member/findUserPwdForm">비밀번호 찾기</a></span>
	<span><a href="${contextPath }/member/emailCheck">회원가입</a></span>
	<span><a href="${contextPath }/index">메인</a></span>
	
	</div>
	
</body>
</html>











