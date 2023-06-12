<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>programBoard/programBoardAllList.jsp</title>
<style type="text/css">

h1 {
	text-align: center;
}


.wrap {
	margin: 0 auto;
}

.table {
	display: block;
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

<script type="text/javascript">
function deleteConfirm(write_no, file_name){
	
	if(!confirm('삭제하시겠습니까?')){
		return false;
	} else {
		location.href='${contextPath}/programBoard/deleteProgram?write_no=' + write_no + '&file_name=' + file_name;
	}
	
}

</script>

</head>
<body>
	<c:import url="../default/header.jsp"/>
	<section>
		<h1> 프로그램 게시판 </h1>
		<div class="wrap board_table">
			<table class="table table-striped">
				<tr>
					<th width="70px"> 번 호 </th>
					<th width="100px"> ID </th>
					<th width="200px"> 제 목 </th>
					<th width="200px"> 날 짜 </th>
					<th width="100px"> 예약현황 </th>
					<th width="70px"> 조회수 </th>
					<c:if test ="${info.grade == admin}">
									<th>관리자 권한</th>
					</c:if>
				</tr>
				<c:choose>
					<c:when test="${empty programBoardList}"> <!-- ${programBoardList.size() == 0} -->
						<tr>
							<td colspan="7">등록된 글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${programBoardList }">
							<tr>
								<td>${dto.write_no }</td>
								<td>${dto.id }</td>
								<td><a href="${contextPath }/programBoard/programContentView?write_no=${dto.write_no}&num=<%=request.getParameter("num")%>">${dto.title }</a></td>
								<td>${dto.savedate }</td>
								<td>${dto.state }</td>
								<td>${dto.hit }</td>
								<c:if test ="${info.grade == admin}">
									<td><button onclick="deleteConfirm('${dto.write_no}', '${dto.mateImage }')">삭제</button></td>
								</c:if>
							<tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<c:choose>
						<c:when test="${info.grade == admin}">
							<td colspan="8" align="center">
						</c:when>
						<c:otherwise>
							<td colspan="7" align="center">
						</c:otherwise>
					</c:choose>
						<!-- 페이징 -->
						<div id="paging_block">
							<c:if test="${startPage > block }">
								[ <a href="programBoardAllList?num=${startPage-1 }" id="paging"> 이전 </a> ]
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
								<c:if test="${i == num}">
									[ <a href="programBoardAllList?num=${i }" id="currentPaging"> ${i } </a> ]
								</c:if>
								<c:if test="${i != num}">
									[ <a href="programBoardAllList?num=${i }" id="paging"> ${i } </a> ]
								</c:if>
							</c:forEach>
							<c:if test="${endPage < totalPage }">
								[ <a href="programBoardAllList?num=${endPage+1 }" id="paging"> 다음 </a> ]
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${info.grade == admin}">
							<td colspan="8" align="center">
						</c:when>
						<c:otherwise>
							<td colspan="7" align="center">
						</c:otherwise>
					</c:choose>
						<c:if test="${loginUser != 'noLogin' }">
						<a href="${contextPath }/programBoard/writeFormForProgram">글작성</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</section>
<c:import url="../default/footer.jsp"/>
</body>
</html>