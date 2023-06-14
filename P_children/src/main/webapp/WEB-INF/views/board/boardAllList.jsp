
<!-- board/boardAllList.jsp -->

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
<title>board/boardAllList.jsp</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
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
	//게시글 삭제 문구 알림창
	function deleteConfirm(write_no, file_name){
		
		if(!confirm('삭제하시겠습니까?')){
			return false;
		} else {
			location.href='${contextPath}/board/delete?write_no='+  write_no + '&file_name=' + file_name;
		}
		
	}
</script>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<section>
		<h1> 게시판 </h1>
		<div class="imsi"></div>
		<div class="wrap board_table">
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
									<td><a href="${contextPath }/board/contentView?write_no=${dto.write_no}&num=<%=request.getParameter("num")%>">${dto.title }</a></td>
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
					<c:choose>
						<c:when test="${info.grade == admin}">
							<td colspan="7" align="center">
						</c:when>
						<c:otherwise>
							<td colspan="6" align="center">
						</c:otherwise>
					</c:choose>
						<!-- 페이징 -->
						<div id="paging_block">
							<!-- 자유 게시판에 들어가자마자 나오는 페이징  -->
							<c:if test="${board_category == null}">
								<c:if test="${startPage > block }">
									[ <a href="${contextPath }/board/boardAllList?num=${startPage-1 }" id="paging"> 이전 </a> ]
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
									<c:if test="${i == num}">
										[ <a href="${contextPath }/board/boardAllList?num=${i }" id="currentPaging"> ${i } </a> ]
									</c:if>
									<c:if test="${i != num}">
										[ <a href="${contextPath }/board/boardAllList?num=${i }" id="paging"> ${i } </a> ]
									</c:if>
								</c:forEach>
								<c:if test="${endPage < totalPage }">
									[ <a href="${contextPath }/board/boardAllList?num=${endPage+1 }" id="paging"> 다음 </a> ]
								</c:if>
							</c:if>
							<!-- 검색 클릭시 페이징  -->
							<c:if test="${board_category != null}">
								<c:if test="${startPage > block }">
									[ <a href="${contextPath }/board/boardSearchForm?num=${startPage-1 }&board_category=${board_category }&board_searchCategory=${board_searchCategory}&board_searchKeyword=${board_searchKeyword}" id="paging"> 이전 </a> ]
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
									<c:if test="${i == num}">
										[ <a href="${contextPath }/board/boardSearchForm?num=${i }&board_category=${board_category }&board_searchCategory=${board_searchCategory}&board_searchKeyword=${board_searchKeyword}" id="currentPaging"> ${i } </a> ]
									</c:if>
									<c:if test="${i != num}">
										[ <a href="${contextPath }/board/boardSearchForm?num=${i }&board_category=${board_category }&board_searchCategory=${board_searchCategory}&board_searchKeyword=${board_searchKeyword}" id="paging"> ${i } </a> ]
									</c:if>
								</c:forEach>
								<c:if test="${endPage < totalPage }">
									[ <a href="${contextPath }/board/boardSearchForm?num=${endPage+1 }&board_category=${board_category }&board_searchCategory=${board_searchCategory}&board_searchKeyword=${board_searchKeyword}" id="paging"> 다음 </a> ]
								</c:if>
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${info.grade == admin}">
							<td colspan="7" align="center">
						</c:when>
						<c:otherwise>
							<td colspan="6" align="center">
						</c:otherwise>
					</c:choose>
						<c:if test="${loginUser != 'noLogin' || kakaoId != null}">
						<a href="${contextPath }/board/writeForm">글작성</a>
						</c:if>
					</td>
				</tr>
			</table>
			
			<!-- 검색 버튼 -->
			<form name="boardSearchForm" action="${contextPath }/board/boardSearchForm" method="get">
				<select name="board_category" id="board_category">
					<option value="total" <c:if test="${board_category == 'total' }">selected</c:if>>전체</option>
					<option value="informationSharing" <c:if test="${board_category == 'informationSharing' }">selected</c:if>>정보 공유</option>
					<option value="friendshipPromotion" <c:if test="${board_category == 'friendshipPromotion' }">selected</c:if>>친목 도모</option>
					<option value="petSneak" <c:if test="${board_category == 'petSneak' }">selected</c:if>>펫 간식</option>
					<option value="smallChat" <c:if test="${board_category == 'smallChat' }">selected</c:if>>잡담</option>
					<option value="lookForPetFriend" <c:if test="${board_category == 'lookForPetFriend' }">selected</c:if>>펫 프랜드 구합니다</option>
					<option value="BeingPetFriend" <c:if test="${board_category == 'BeingPetFriend' }">selected</c:if>>펫 프랜드 합니다</option>
				</select>
				<select name="board_searchCategory" id="board_searchCategory">
					<option value="title" <c:if test="${board_searchCategory == 'title' }">selected</c:if>>제목</option>
					<option value="content" <c:if test="${board_searchCategory == 'content' }">selected</c:if>>내용</option>
					<option value="id" <c:if test="${board_searchCategory == 'id' }">selected</c:if>>작성자</option>
				</select>
				<input type="text" id="board_searchKeyword" name="board_searchKeyword" value="${board_searchKeyword }">
				<input type="submit" id="search_btn" value="검색">
			</form>
		</div>
	</section>
	<c:import url="../default/footer.jsp"/>
</body>
</html>