
<!-- index -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/index.css" rel="stylesheet" type="text/css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> 
</head>
<body>
	
	<c:import url="../default/header.jsp"/>
	
	<section class="home-landing">
		<div class="image-section" >
			<img src="${pageContext.request.contextPath}/resources/chenggyu/pet_new.png" alt="">
		</div>
		<div class="text-section">
			<h2>${loginUser } 환영합니다</h2>
			<h3>반려 메이트를 키우는 것은 어려운 시작입니다.</h3>
			<p>메이트 위드는 반려 메이트와 함께하는 행복을 많은 사람들에게 전달하는 플랫폼입니다. </p>
			<p>내가 사는 곳 근처에서, 호스트 분들의 반려 메이트와 함께하는 여러 프로그램에 참여해 보세요.</p>
			<p>- 반려 메이트에 관심이 있는데 어떻게 시작할지 몰랐던 분들!</p>
			<p>- 반려 메이트를 키우기 전에 경험을 해보고 싶으신 분들!</p>
			<p>- 반려 메이트에 대한 여러가지 정보를 알고 싶은 분들!</p>
			<p>   모든 반려 메이트들을 사랑하는 분들 모두! Mate With Us!</p>
            <h3>그 어려움을 Mate With 가 함께 나누겠습니다.</h3>		
		<button class="btn" onclick="location.href='${contextPath }/programBoard/writeFormForProgram'">바로 가기</button>
			<div class="social-media">
				<a href="#"><i class='bx bxl-facebook-circle'></i></a>
				<a href="#"><i class='bx bxl-instagram' ></i></a>
				<a href="#"><i class='bx bxl-twitter' ></i></a>
				<a href="#"><i class='bx bxl-reddit' ></i></a>
			</div>
		</div>
			<ul class="main_ul">
				<li class="main_li"></li>
				<li class="main_li"></li>
			</ul >
	</section>
	
	<c:import url="../default/footer.jsp"/>
	
</body>
</html>