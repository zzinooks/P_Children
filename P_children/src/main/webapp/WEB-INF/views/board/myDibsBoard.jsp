
<!-- board/myDibsBoard.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 내가 찜한 게시글</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=1" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/page.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous">
<script type="text/javascript">
	function chooseBoard2() {
		
		if($("#selectBoard").val() =='내가찜한게시글') {
			location.href="${contextPath}/board/myDibsBoard?num=1"
		}
		if($("#selectBoard").val() =='내가찜한프로그램게시글') {
			location.href = "${contextPath}/board/myDibsProgramBoard?num=1";
		}
		
	}

</script>
<style type="text/css">
table             { 
  border-spacing: 1; 
  border-collapse: collapse; 
  background:white;
  border-radius:6px;
  overflow:hidden;
  width:100%;
  margin:0 auto;
  position:relative;
  }
    td,th{ 
    padding-left:8px;
    padding-right: 8px;
    text-align:center;
    }

  thead tr  { 
    height:40px;
    background:#C19681;
    font-size:16px;
  }
  
  tbody tr     { 
  height:40px; 
  border-bottom:1px solid #C19681;
    &:last-child  { border:0; }
  }
  .select{
  	border-radius: 10px;
  	text-align: right;
  	margin: 5px;
  }
</style>
</head>
<body>

	<c:import url="../default/header.jsp"/>
	
	<section>
	<div class="form-box-list"> 
		<div class="title" >찜한 게시글</div>
		<div class="select">
			<select name="selectBoard" id="selectBoard" onchange="chooseBoard2()">
				<option value="내가찜한게시글" checked>내가찜한게시글</option>
				<option value="내가찜한프로그램게시글">내가찜한프로그램게시글</option>
			</select>
		</div>
		<div class="wrap board_table myDibsBoard">
			<table class="table table-striped">
				<thead>
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
				</thead>
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
							<!-- 검색 클릭시 페이징  
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
							-->
					</td>
				</tr>
				<%-- <tr>
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
				</tr> --%>
			</table>
					<!-- 페이징 -->
					<div class="page_wrap">
					   <div class="page_nation">
							<c:if test="${board_category == null}">
								<c:if test="${startPage > block }">
									<a href="${contextPath }/board/myDibsBoard?num=${startPage-1 }" class="arrow prev"> 이전 </a>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
									<c:if test="${i == num}">
										<a href="${contextPath }/board/myDibsBoard?num=${i }" class="active"> ${i } </a>
									</c:if>
									<c:if test="${i != num}">
										<a href="${contextPath }/board/myDibsBoard?num=${i }" class="active"> ${i } </a>
									</c:if>
								</c:forEach>
								<c:if test="${endPage < totalPage }">
									<a href="${contextPath }/board/myDibsBoard?num=${endPage+1 }" class="arrow next"> 다음 </a>
								</c:if>
							</c:if>
						</div>
					</div>
			
			<!-- 검색 버튼 
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
		-->
			</div>
			<ul class="menu">
				<li><a href="">메뉴</a>
					<ul class="submenu_">
						<hr>
						<li><a href="${contextPath }/member/member_information">이전</a></li>
					</ul>
				</li>
			</ul>
		</div>
			
		</div>
	</section>
	
	<c:import url="../default/footer.jsp"/>
	
</body>
</html>