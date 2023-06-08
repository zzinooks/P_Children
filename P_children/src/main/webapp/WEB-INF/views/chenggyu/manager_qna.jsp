
<!-- manager_qna -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_qna</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css" rel="stylesheet" type="text/css">
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
			<h2>1대 1문의</h2>
			<p>관리자 정보 > 1대 1문의 </p>
		</div>		
		<div class="table-member">
			<table class="member">
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
		</div>
		
		<div class="under-section">
			<c:forEach  var="num" begin="1" end="${repeat }">
						<a href="manager_qna?num=${num }">[ ${num } ]</a>
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