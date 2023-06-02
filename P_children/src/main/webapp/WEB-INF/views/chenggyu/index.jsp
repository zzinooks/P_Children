
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
<link href="${pageContext.request.contextPath}/resources/chenggyu/index.css" rel="stylesheet" type="text/css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> 
</head>
<body>

	<div class="container"></div>
	<header class="header" >
		<a href="/root/index" class="logo"><i class='bx bx-globe'></i><span>index </span></a>
		<nav class="navbar">
			<a href="/root/index" class="active">메인</a>
			<a href="#">공지 사항</a>
			<a href="/root/board/boardAllList">게시판</a>
			<a href="#">프로그램</a>
			<a href="#">고객센터</a>
		<c:choose>
			<c:when test="${loginUser == null }">
				<a href="/root/member/memberLoginForm">로그인</a>
			</c:when>
			<c:otherwise>
			<c:choose>
			<c:when test="${info.grade == 'gold' }">
				<a href="/root/member/manager_information">관리자 정보</a>
			</c:when>
			<c:otherwise>
				<a href="/root/member/member_information">회원 정보</a>
			</c:otherwise>
		</c:choose>
				<a href="${contextPath }/member/memberLogout">로그아웃</a>
			</c:otherwise>
		</c:choose>
		</nav>
	</header>
	<section class="home-landing">
		<div class="image-section" >
			<img src="${pageContext.request.contextPath}/resources/chenggyu/pet_new.png" alt="">
		</div>
		<div class="text-section">
			<h2>환영합니다</h2>
			<p>밝아오는 새해에는 더욱 건강하시고 모든 소망이 이루어지는 한 해가 되시길 기원합니다. 새해 복 많이 받으세요. 좋은 사람들과 함께 인생을 살아간다는 것은 참 좋은 행복한 일인 거 같습니다. 당신과 함께한 올 한 해 참 고맙고, 행복했습니다.</p>
		<button class="btn">바로 가기</button>
			<div class="social-media">
				<a href="#"><i class='bx bxl-facebook-circle'></i></a>
				<a href="#"><i class='bx bxl-instagram' ></i></a>
				<a href="#"><i class='bx bxl-twitter' ></i></a>
				<a href="#"><i class='bx bxl-reddit' ></i></a>
			</div>
		</div>
			<ul>
				<li></li>
				<li></li>
			</ul>
	<div class="footer">
		<a>Copyright &copy; P_children</a> 
	</div>
	</section>
	
</body>
</html>