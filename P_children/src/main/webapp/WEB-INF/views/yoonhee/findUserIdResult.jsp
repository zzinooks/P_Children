<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I Run it : 아이디 찾기 결과</title>
</head>
<body>
	<h3>고객님의 정보와 일치하는 아이디입니다.</h3>
	<c:if test="${findUserId != null }">
		<p>아이디 : ${findUserId.id }</p>
	</c:if>
	<c:if test="${findUserId == null }">
		<p>회원 정보가 없습니다.</p>
	</c:if>
	
	<a href="${contextPath }/member/memberLoginForm">로그인하기</a>
	<a href="${contextPath }/member/findUserPwdForm">비밀번호 찾기</a>
	
</body>
</html>