
<!-- manager_qna -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_qna</title>
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
				<th>작성자</th><th>제목</th><th>작성일</th><th>상태</th>
			</tr>
			<c:if test="${qnaList.size() == 0 }">
				<tr>	
					<th colspan="4"> 등록된 글이 없습니다. </th>
				</tr>
			</c:if>
			<c:forEach var="dto"  items="${qnaList }">
				<tr>	
					<th> ${dto.id }</th>
					<th> ${dto.title }</th>
					<th> ${dto.savedate }</th>
					<th> ${dto.status }</th>
				</tr>
			</c:forEach>
		</table>
		<br><br>
		<c:forEach var="num" begin="1" end="${repeat }">
			<a href="manager_qna?num=${num }">[ ${num } ]</a>
		</c:forEach>

		<br><br>
		<a href="/root/member/manager_information">관리자 정보</a>
		
		<c:import url="../default/footer.jsp"/>
		
		</div>

</body>
</html>