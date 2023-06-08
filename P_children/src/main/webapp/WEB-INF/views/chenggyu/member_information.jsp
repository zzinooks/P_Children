
<!-- member_information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_information</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
</script>
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
	
		<c:import url="../default/header.jsp"/>
		
		<section>
		<br>
		<h1>개인 정보</h1>
		<br>
		<table >
			<tr>
				<th>아이디</th>
				<th>${dto.id }</th>
			</tr>
			<tr>
				<th>등급</th>
				<th>${dto.grade }</th>
			</tr>
			<tr>
				<th>닉네임</th>
				<th>${dto.nickname }</th>
			</tr>
			<tr>
				<th>이메일</th>
				<th>${dto.email }</th>
			</tr>
			<tr>
				<th>휴대전화</th>
				<th>${dto.phone }</th>
			</tr>
			<tr>
				<th>주소</th>
				<th>${dto.addr }</th>
			</tr>
		</table>
		
		<br><br>
		<a href="/root/index">index</a>
		<br>
		<a href="/root/member/member_information ">개인 정보</a>
		<br>
		<a href="/root/member/member_modify">개인정보 수정</a>
		<br>
		<a href="/root/member/member_board">나의 게시글</a>
		<br>
		<a href="/root/member/member_qna ">1:1 문의</a>
		<br>
		<a href="/root/member/member_leave ">회원 탈퇴</a>
	
	</section>
	
	<c:import url="../default/footer.jsp"/>

	
</body>
</html>