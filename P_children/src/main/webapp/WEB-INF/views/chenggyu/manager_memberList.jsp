
<!-- manager_memberList -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_memberList</title>
<style type="text/css">
table{
	border: 1px solid;
	border-collapse: collapse;
	height: 75px;
	width: 1000px;
}
th, td {
	border: 1px solid ;
	text-align: center;
}
</style>
</head>
<body>

	
	<div align="center">
	<br>
	<h1>회원 관리</h1>
	<br>
	<table>
		<tr>
			<th>아이디</th><th>비밀번호</th><th>닉네임</th><th>휴대번호</th><th>이메일</th><th>주소</th><th>등급</th><th>관리</th>
		</tr>
		<c:if test="${memberList.size() == 0 }">
				<tr>	
					<th colspan="8"> 등록된 회원 없습니다. </th>
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
					<td><input type="button" value="수정" > &nbsp; <input type="button" value="삭제"></td>
				</tr>
			</c:forEach>
	</table>
	<br><br>
			<c:forEach  var="num" begin="1" end="${repeat }">
						<a href="manager_memberList?num=${num }">[ ${num } ]</a>
			</c:forEach>
	<br><br>	
	<a href="/root/member/manager_information">관리자 정보</a>
	
	</div>


</body>
</html>