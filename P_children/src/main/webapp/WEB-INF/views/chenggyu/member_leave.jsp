
<!-- member_leave -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_leave</title>
</head>
<body>

	<div align="center">

		<br>
		<h1>회원 탈퇴</h1>
		<br>
		<form action="">
		<table>
			<tr>
				<th>아이디  <input type="text" name="id" readonly="readonly"></th>
			</tr>
			<tr>
				<th>비밀번호 <input type="text" name="pwd"> </th>
			</tr>
		</table>
			<br><br>
			<input type="submit" value="확인">
		</form>

		<br><br> 
		<a href="/root/member/member_information ">개인 정보</a>

	</div>


</body>
</html>