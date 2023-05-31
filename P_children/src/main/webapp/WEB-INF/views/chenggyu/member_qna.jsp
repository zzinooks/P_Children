
<!-- member_qna -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_qna</title>
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
		<h1>1대1 문의</h1>
		<br>
		<table>
			<tr>
				<th>제목</th><th>작성일</th><th>상태</th>
			</tr>
		</table>
		<br><br>
		<input type="button" value="작성">
		<br><br>
		<a href="/root/member/member_information ">개인 정보</a>
		
		</div>
		
	
	<c:import url="../default/footer.jsp"/>

</body>
</html>