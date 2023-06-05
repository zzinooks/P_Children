
<!-- manager_board -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_board</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css" rel="stylesheet" type="text/css">
</head>
<body>

	<c:import url="../default/header.jsp"/>
	
	<section class="manager_board">
	<div class="box_table">
	<h1>게시판 관리</h1>
	<h5>관리자 정보 > 게시판 관리</h5>
		<table class="tablex">
			<tr>
				<th>글 번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>파일이름</th>
				<th>관리</th>
			</tr>
			<c:if test="${boardList.size() == 0 }">
				<tr>
					<th colspan="7">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${boardList }">
				<tr>
					<th>${dto.write_no }</th>
					<th>${dto.id }</th>
					<th>${dto.title }</th>
					<th>${dto.savedate }</th>
					<th>${dto.hit }</th>
					<th>${dto.file_name }</th>
					<th><input type="button" value="삭제"></th>
				</tr>
			</c:forEach>
		</table>
		</div>
	</section>

	<div class="under_bar">
		<c:forEach var="num" begin="1" end="${repeat }">
		<a href="manager_board?num=${num }">[ ${num } ]</a>
		</c:forEach>
	</div>

	<c:import url="../default/footer.jsp"/>


</body>
</html>