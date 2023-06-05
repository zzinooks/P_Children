
<!-- manager_information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_information</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<c:import url="../default/header.jsp"/>
	
	<section class="information_main">
	<div class="box">
		<div class="title">
			<h1>나의 정보</h1>
			<h5>관리자 정보 > 나의 정보</h5>
			<h3>아이디</h3>
				<a>${info.id }</a>
			<h3>등급</h3>
				<a>${info.grade }</a>
			<h3>닉네임</h3>
				<a>${info.nickname }</a>
			<h3>이메일</h3>
				<a>${info.email }</a>
			<h3>휴대번호</h3>
				<a>${info.phone }</a>
			<h3>주소</h3>
				<a>${info.addr }</a>
		</div>
	</div>
		<a href="/root/member/manager_memberList">회원 목록 관리</a>
		<a href="/root/member/manager_board">게시물 관리</a>
		<a href="/root/member/manager_qna">1대1문의</a>
	</section>
	
	<c:import url="../default/footer.jsp"/>

</body>
</html>