
<!-- header -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/header.css" rel="stylesheet" type="text/css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> 
<script src="${contextPath}/resources/yoonhee/js/memberLoginScript.js?v=1"></script>
</head>
<body>

	<div class="container"></div>
	<header class="header" >
		<a href="${contextPath }/index" class="logo"><i class='bx bx-globe'></i><span>index </span></a>
		<nav class="navbar">
			<a href="${contextPath }/index" class="active">메인</a>
			<a href="${contextPath }/board/notice/noticeBoardAllList">공지 사항</a>
			<a href="${contextPath }/board/boardAllList">게시판</a>
			<a href="${contextPath }/programBoard/writeFormForProgram">프로그램</a>
			<a href="#">고객센터</a>
		<c:choose>
			<c:when test="${loginUser == null && kakaoId == null}">
				<a href="${contextPath }/member/memberLoginForm">로그인</a>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${info.grade == 'gold' || grade =='gold'}">
						<a href="${contextPath }/member/manager_information">관리자 정보</a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath }/member/member_information">회원 정보</a>
					</c:otherwise>
				</c:choose>
					<c:if test="${kakaoId != null }">
						<a href="${contextPath }/member/kakaoCode?kakaoLogout=true">로그아웃</a>
					</c:if>
					<c:if test="${loginUser != null }">
						<a href="${contextPath }/member/memberLogout" onclick="memberLogoutMessage()">로그아웃</a>
					</c:if>
			</c:otherwise>
		</c:choose>
		</nav>
	</header>

</body>
</html>