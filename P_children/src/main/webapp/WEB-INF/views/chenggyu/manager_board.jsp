
<!-- manager_board -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_board</title>
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

	<c:import url="../default/header.jsp"/>
	
	<div align="center">
	<br>
	<h1>게시물 관리</h1>
	<br>
	<table>
		<tr>
			<th>글 번호</th><th>아이디</th><th>제목</th><th>작성일</th><th>조회수</th><th>파일이름</th><th>관리</th>
		</tr>
		<c:if test="${boardList.size() == 0 }">
				<tr>	
					<th colspan="7"> 등록된 글이 없습니다. </th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${boardList }">
				<tr>	
					<th> ${dto.write_no }</th>
					<th> ${dto.id }</th>
					<th> ${dto.title }</th>
					<th> ${dto.savedate }</th>
					<th> ${dto.hit }</th>
					<th> ${dto.file_name }</th>
					<th> <input type="button" value="삭제"></th>
				</tr>
			</c:forEach>
	</table>
				<br><br>
				<c:forEach  var="num" begin="1" end="${repeat }">
						<a href="manager_board?num=${num }">[ ${num } ]</a>
			</c:forEach>
	<br><br>
	<a href="/root/member/manager_information">관리자 정보</a>
	
	</div>

	<c:import url="../default/footer.jsp"/>

</body>
</html>