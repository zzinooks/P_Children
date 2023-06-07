
<!-- manager_memberList -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_memberList</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<style type="text/css">
table{
	text-align: center;
	width: 80%;
	position: absolute;
    border: 1px solid black;
    border-collapse: collapse;
}
td, th{
    border-bottom: 1px solid black;
    border-left: 1px solid black;
}
</style>
</head>
<body>

	<c:import url="../default/header.jsp"/>
	
	<section class="main-landing">
	<div class="main_box">
		<div class="text-section">
			<h2>회원 관리</h2>
			<p>관리자 정보 > 회원관리 </p>
		</div>
		<div class="table-member">
			<table class="member">
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>닉네임</th>
					<th>휴대번호</th>
					<th>이메일</th>
					<th>주소</th>
					<th>등급</th>
					<th>관리</th>
				</tr>
				<c:if test="${memberList.size() == 0 }">
					<tr>
						<th colspan="8">등록된 회원 없습니다.</th>
					</tr>
				</c:if>
				<c:forEach var="member" items="${memberList }">
					<tr>
						<td>${member.id }</td>
						<td>${member.pwd }</td>
						<td>${member.nickname }</td>
						<td>${member.phone }</td>
						<td>${member.email }</td>
						<td>${member.addr }</td>
						<td>${member.grade }</td>
						<td><input type="button" value="수정"> &nbsp; <input
							type="button" value="삭제" onclick=""></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="under-section">
			<c:forEach  var="num" begin="1" end="${repeat }">
						<a href="manager_memberList?num=${num }">[ ${num } ]</a>
			</c:forEach>
		</div>
		
		<a href="/root/member/manager_memberList">회원 목록 관리</a>
		<a href="/root/member/manager_board">게시물 관리</a>
		<a href="/root/member/manager_qna">1대1문의</a>
		</div>
	</section>

	<c:import url="../default/footer.jsp"/>

</body>
</html>