
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
	
	<section class="main-landing">
	<div class="main_box">
		<div class="text-section">
			<h2>관리자 정보</h2>
			<p>관리자 정보</p>
		</div>
		<div class="table-section">
			<h3>아이디</h3>
				<a>${dto.id }</a>
			<h3>등급</h3>
				<a>${dto.grade }</a>
			<h3>닉네임</h3>
				<a>${dto.nickname }</a>
			<h3>이메일</h3>
				<a>${dto.email }</a>
			<h3>휴대번호</h3>
				<a>${dto.phone }</a>
			<h3>주소</h3>
				<a>${dto.addr }</a>
		<br>
		</div>
		<a href="/root/member/manager_memberList">회원 목록 관리</a> &nbsp;
		<a href="/root/member/manager_board">게시물 관리</a> &nbsp;
		<a href="/root/member/manager_qna">1대1문의</a> &nbsp;
		<a href="/root/member/kakaoPaymentApproveList">카카오페이 승인 목록</a> &nbsp;
		
		</div>
	</section>
	
	<c:import url="../default/footer.jsp"/>

</body>
</html>