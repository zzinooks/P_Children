
<!-- manager_information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_information</title>
<style type="text/css">
table{
	border: 1px solid;
	border-collapse: collapse;
	height: 200px;
	width: 500px;
}
th, td {
	border: 1px solid ;
}
</style>
</head>
<body>
	
		<div align="center">
		<br>
		<h1>관리자 정보</h1>
		<br>
		<table >
			<tr>
				<th>아이디</th>
				<th>${info.id }</th>
			</tr>
			<tr>
				<th>등급</th>
				<th>${info.grade }</th>
			</tr>
			<tr>
				<th>닉네임</th>
				<th>${info.nickname }</th>
			</tr>
			<tr>
				<th>이메일</th>
				<th>${info.email }</th>
			</tr>
			<tr>
				<th>휴대전화</th>
				<th>${info.phone }</th>
			</tr>
			<tr>
				<th>주소</th>
				<th>${info.addr }</th>
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
	

</body>
</html>