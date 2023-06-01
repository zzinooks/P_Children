
<!-- memberLoginSuccess -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLoginSuccess</title>
</head>
<body>

	<div align="center">
	<h1>로그인 성공</h1>
	<h3>${loginUser }님 로그인 성공</h3>
	<a href="/root/index">index</a>
	<br>
	<a href="/root/board/boardAllList">게시판</a>

	<c:choose>
		<c:when test="${info.grade == 'gold' }">
			<a href="/root/member/manager_information">관리자 정보</a>
		</c:when>
		<c:otherwise>
			<a href="/root/member/member_information">개인 정보</a>
		</c:otherwise>
	</c:choose>
	
	
	</div>
	
</body>
</html>