<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I Run it : 비밀번호 찾기 결과</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/js/yoonhee/memberLoginScript.js?v=1"></script>
</head>
<body>
	<h3>비밀번호 재설정</h3>
	<c:if test="${findPwd != null }">
		<p>I Run it 아이디 : ${findPwd.id }</p>
		<form name="findUserPwdResult" action="${contextPath }/member/userRePwd" method="post">
			<input type="hidden" name="id" value="${findPwd.id }">
			<input type="password" name="newPwd" placeholder="새 비밀번호 입력"><br>
			<br>
			<input type="password" name="newRePwd" placeholder="새 비밀번호 확인"><br>
			<br>
			<input type="button" value="확인" onclick="userRePwdCheck()">
		</form>
	</c:if>
	<c:if test="${findPwd == null }">
		<p>회원 정보가 없습니다.</p>
	</c:if>
	
	<a href="${contextPath }/member/memberLoginForm">로그인하기</a>
	<a href="${contextPath }/member/findUserPwdForm">비밀번호 찾기</a>
	<a href="${contextPath }/index">메인</a>
</body>
</html>