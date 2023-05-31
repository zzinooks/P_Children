
<!-- manager_information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_information</title>
</head>
<body>

	<c:import url="../default/header.jsp"/>
	
		<div align="center">
		<br>
		<h1>관리자 정보</h1>
		<br>
		<table >
			<tr>
				<th>아이디</th>
				<th>null</th>
			</tr>
			<tr>
				<th>등급</th>
				<th>null</th>
			</tr>
			<tr>
				<th>닉네임</th>
				<th>null</th>
			</tr>
			<tr>
				<th>이메일</th>
				<th>null</th>
			</tr>
			<tr>
				<th>휴대전화</th>
				<th>null</th>
			</tr>
			<tr>
				<th>주소</th>
				<th>null</th>
			</tr>
		</table>
		
		<br><br>
		<a href="/root/index">index</a>
		<br>
		<a href="/root/member/manager_memberList">회원 목록 관리</a>
		<br>
		<a href="/root/member/manager_board">게시물 관리</a>
		<br>
		<a href="/root/member/manager_qna">1대1문의 관리</a>
		
		</div>
	
	<c:import url="../default/footer.jsp"/>

</body>
</html>