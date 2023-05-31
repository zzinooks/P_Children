
<!-- member_board -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_board</title>
<style type="text/css">
table{
	border: 1px solid;
	border-collapse: collapse;
	height: 50px;
	width: 500px;
}
th, td {
	border: 1px solid ;
}
</style>
</head>
<body>

	<c:import url="../default/header.jsp"/>
		
		<div align="center">
		<br>
		<h1>나의 게시글</h1>
		<br>
		<table>
			<tr>
				<th>글 번호</th><th>제목</th><th>조회수</th><th>작성일</th>
			</tr>
		</table>
		
		<br><br>
		<a href="/root/member/member_information ">개인 정보</a>
		
		</div>
	
	<c:import url="../default/footer.jsp"/>
	
	

</body>
</html>