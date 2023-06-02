
<!-- board/boardAllList.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/boardAllList.jsp</title>

<style type="text/css">

h1 {
	text-align: center;
}


.wrap {
	margin: 0 auto;
}

.table {
	display: flex;
	justify-content: center;
}

table tr:last-child {
	text-align: right;
}

#paging {
	color: black;
	text-decoration: none;
}
#currentPaging {
	color: red;
	text-decoration: underline;
}
</style>

</head>
<body>
<%-- 	<c:import url="../default/header.jsp"/> --%>
	<h1> 게시판 </h1>
	<div class="wrap board_table">
		<table class="table table-striped">
			<tr>
				<th width="70px"> 번 호 </th>
				<th width="150px"> ID </th>
				<th width="200px"> 제 목 </th>
				<th width="200px"> 날 짜 </th>
				<th width="70px"> 조회수 </th>
				<th width="150px"> 이미지 </th>
			</tr>
			<c:choose>
				<c:when test="${empty boardList}"> <!-- ${boardList.size() == 0} -->
					<tr>
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${boardList }">
						<tr>
							<td>${dto.write_no}</td>
							<td>${dto.id }</td>
							<td><a href="${contextPath }/board/contentView?write_no=${dto.write_no}">${dto.title }</a></td>
							<td>${dto.savedate }</td>
							<td>${dto.hit }</td>
							<td>${dto.file_name }</td>
						<tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="6" align="center">
					<%-- <c:forEach var="num" begin="1" end="${repeat }">
						<a href="boardAllList?num=${num }">[ ${num }]</a>
					</c:forEach> --%>
					<!-- 페이징 -->
					<div id="paging_block">
						<c:if test="${startPage > block }">
							[ <a href="boardAllList?num=${startPage-1 }" id="paging"> 이전 </a> ]
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<c:if test="${i == num}">
								[ <a href="boardAllList?num=${i }" id="currentPaging"> ${i } </a> ]
							</c:if>
							<c:if test="${i != num}">
								[ <a href="boardAllList?num=${i }" id="paging"> ${i } </a> ]
							</c:if>
						</c:forEach>
						<c:if test="${endPage < totalPage }">
							[ <a href="boardAllList?num=${endPage+1 }" id="paging"> 다음 </a> ]
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="${contextPath }/board/writeForm">글작성</a>
				</td>
			</tr>
		</table>
	</div>
	<br><br>
	<div>
	 <a href="https://unite-db.com/pokemon/lapras"><img alt="" src="https://d275t8dp8rxb42.cloudfront.net/pokemon/thumbnail/Lapras.png" width="50" height="50"></a>
	</div>
<%-- 	<c:import url="../default/footer.jsp"/> --%>
</body>
</html>