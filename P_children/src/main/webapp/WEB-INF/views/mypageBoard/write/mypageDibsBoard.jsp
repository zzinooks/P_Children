
<!-- board/myDibsBoard.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous">
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 내가 찜한 게시글</title>
<script type="text/javascript">
	function chooseBoard() {
		
		if($("#selectBoard").val() =='내가찜한게시글') {
			location.href="${contextPath}/mypageBoard/myDibsBoard?num=1"
		}
		if($("#selectBoard").val() =='내가찜한프로그램게시글') {
			location.href = "${contextPath}/mypageBoard/myDibsProgramBoard?num=1";
		}
		
	}

</script>
</head>
<body>
	<c:import url="../../default/header.jsp"/>
	<section>
		<h1> 내가 찜한 게시판 ♥ </h1>
		<select name="selectBoard" id="selectBoard" onchange="chooseBoard()">
			<option value="내가찜한게시글">내가찜한게시글</option>
			<option value="내가찜한프로그램게시글">내가찜한프로그램게시글</option>
		</select>
		<div class="wrap board_table myDibsBoard">
			<table class="table table-striped">
				<tr>
					<th width="70px"> 번 호 </th>
					<th width="150px"> 분 류 </th>
					<th width="150px"> ID </th>
					<th width="200px"> 제 목 </th>
					<th width="200px"> 날 짜 </th>
					<th width="70px"> 조회수 </th>
					<c:if test ="${info.grade == admin}">
									<th>관리자 권한</th>
					</c:if>
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
									<td>
										<c:if test="${dto.category == 'informationSharing' }">
										 정보 공유 
										</c:if>
										<c:if test="${dto.category == 'friendshipPromotion' }">
										 친목 도모 
										</c:if>
										<c:if test="${dto.category == 'petSneak' }">
										 펫 간식 
										</c:if>
										<c:if test="${dto.category == 'smallChat' }">
										 잡담 
										</c:if>
										<c:if test="${dto.category == 'lookForPetFriend' }">
										 펫프랜드 구합니다 
										</c:if>
										<c:if test="${dto.category == 'BeingPetFriend' }">
										 펫프랜드 합니다 
										</c:if>
									</td>
									<td>${dto.id }</td>
									<td><a href="${contextPath }/board/contentView?write_no=${dto.write_no}&num=<%=request.getParameter("num")%>&toMyDibsBoard=yes">${dto.title }</a></td>
									<td>${dto.savedate }</td>
									<td>${dto.hit }</td>
									<c:if test ="${info.grade == admin}">
										<td><button onclick="deleteConfirm('${dto.write_no}', '${dto.file_name }')">삭제</button></td>
									</c:if>
								</tr>
							</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
				<td 
					<c:choose>
						<c:when test="${info.grade == admin}">
							colspan="7"
						</c:when>
						<c:otherwise>
							colspan="6"
						</c:otherwise>
					</c:choose>
				 align="center">
						<!-- 페이징 -->
						<div id="paging_block">
							<!-- 자유 게시판에 들어가자마자 나오는 페이징  -->
							<c:if test="${board_category == null}">
								<c:if test="${startPage > block }">
									[ <a href="${contextPath }/mypageBoard/myDibsBoard?num=${startPage-1 }" id="paging"> 이전 </a> ]
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
									<c:if test="${i == num}">
										[ <a href="${contextPath }/mypageBoard/myDibsBoard?num=${i }" id="currentPaging"> ${i } </a> ]
									</c:if>
									<c:if test="${i != num}">
										[ <a href="${contextPath }/mypageBoard/myDibsBoard?num=${i }" id="paging"> ${i } </a> ]
									</c:if>
								</c:forEach>
								<c:if test="${endPage < totalPage }">
									[ <a href="${contextPath }/mypageBoard/myDibsBoard?num=${endPage+1 }" id="paging"> 다음 </a> ]
								</c:if>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
	</section>
	<c:import url="../../default/footer.jsp"/>
</body>
</html>