
<!-- index -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>

	<div align="center">
		<br>
		<h1>index</h1>
		<br>
		
		<h3>로그인 결과</h3>
		<c:if test="${loginUser != null }">
			<h4>${loginUser } 님 로그인 성공</h4>
		</c:if>
		<c:if test="${loginUser == null }">
			<h4>로그인 실패</h4>
		</c:if>
		
		<a href="${contextPath }/member/memberLoginForm">로그인</a>
		<a href="${contextPath }/member/memberLogout">로그아웃</a>
		<a href="${contextPath }/board/boardAllList">게시판</a>
		<a href="${contextPath }/member/emailCheck">회원가입</a>
	
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