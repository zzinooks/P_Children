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
<title>Mate With 프로그램 게시판</title>
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
			<button id="programMap" onclick="location.href='kakaoMapLatLng_json'">지도에서 프로그램 찾기</button>
			<table class="table table-striped">
				<tr>
					<th width="70px"> 번 호 </th>
					<th width="100px"> ID </th>
					<th width="200px"> 제 목 </th>
					<th width="200px"> 날 짜 </th>
					<th width="200px"> 예약현황 <br>(현재 신청인원 / 총원) </th>
					<th width="70px"> 조회수 </th>
					<th width="70px"> <img width="30px" height="30px" src="https://cdn-icons-png.flaticon.com/512/138/138533.png?w=826&t=st=1686704293~exp=1686704893~hmac=6f355d28e7dbaf3380f00e77d046efe85cf73ab4f5d2adcf464457a3b814b714"> </th>
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
								<td>${dto.state } &nbsp; ${dto.currentRegisterCount } / ${dto.totalRegisterCount }</td>
								<td>${dto.hit }</td>
								<td>${dto.dibsCount }</td>
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
						<c:if test="${programBoard_state == null}">
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
						</c:if>
						<!--  페이징 끝 -->
						<!-- 검색 페이징 -->
						<c:if test="${programBoard_state != null }">
							<div  class="page_wrap">
								<div class="page_nation">
										<c:if test="${startPage > block }">
											 <a href="${contextPath }/programBoard/programBoardSearchForm?num=${startPage-1 }&programBoard_state=${programBoard_state }&programBoard_searchCategory=${programBoard_searchCategory}&programBoard_searchKeyword=${programBoard_searchKeyword}" class="arrow prev"> 이전 </a> 
										</c:if>
										<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
											<c:if test="${i == num}">
												 <a href="${contextPath }/programBoard/programBoardSearchForm?num=${i }&programBoard_state=${programBoard_state }&programBoard_searchCategory=${programBoard_searchCategory}&programBoard_searchKeyword=${programBoard_searchKeyword}" class="active"> ${i } </a> 
											</c:if>
											<c:if test="${i != num}">
												 <a href="${contextPath }/programBoard/programBoardSearchForm?num=${i }&programBoard_state=${programBoard_state }&programBoard_searchCategory=${programBoard_searchCategory}&programBoard_searchKeyword=${programBoard_searchKeyword}" class="active"> ${i } </a> 
											</c:if>
										</c:forEach>
										<c:if test="${endPage < totalPage }">
											 <a href="${contextPath }/programBoard/programBoardSearchForm?num=${endPage+1 }&programBoard_state=${programBoard_category }&programBoard_searchCategory=${programBoard_searchCategory}&programBoard_searchKeyword=${programBoard_searchKeyword}" class="arrow next"> 다음 </a> 
										</c:if>
								</div>
							</div>	
						</c:if>
						<!-- 검색 페이징 끝 -->				
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
						<c:if test="${info.userSelect == 'host' }">
						<a href="${contextPath }/programBoard/writeFormForProgram">글작성</a>
						</c:if>
					</td>
				</tr>
			</table>
			<!-- 검색 -->
			<div class="page_wrap">
				<form name="programBoardSearchForm" action="${contextPath }/programBoard/programBoardSearchForm" method="get">
					<select name="programBoard_state" id="programBoard_state">
						<option value="total" <c:if test="${programBoard_state == 'total' }">selected</c:if>>전체</option>
	               		<option value="예약가능" <c:if test="${programBoard_state == '예약가능' }">selected</c:if>>예약 가능</option> <!-- 초기값 -->
	               		<option value="승인대기" <c:if test="${programBoard_state == '승인대기' }">selected</c:if>>승인 대기</option> <!-- 승인대기는 필요없을 것 같습니다..? -->
	               		<option value="결재완료" <c:if test="${programBoard_state == '결재완료' }">selected</c:if>>결재 완료</option> <!-- 자신이 결재 했을 때 받는 것은 결재 완료 -->
	               		<option value="예약완료" <c:if test="${programBoard_state == '예약완료' }">selected</c:if>>예약 완료</option> <!-- 참여 인원이 꽈 차면 예약 완료 --> 
					</select>
					<select name="programBoard_searchCategory" id="programBoard_searchCategory">
						<option value="title" <c:if test="${programBoard_searchCategory == 'title' }">selected</c:if>>제목</option>
						<option value="content" <c:if test="${programBoard_searchCategory == 'content' }">selected</c:if>>내용</option>
						<option value="mateName" <c:if test="${programBoard_searchCategory == 'mateName' }">selected</c:if>>강아지 이름</option>
						<option value="id" <c:if test="${programBoard_searchCategory == 'id' }">selected</c:if>>작성자</option>
					</select>
					<input type="text" id="programBoardSearchForm_searchKeyword" name="programBoard_searchKeyword" value="${programBoard_searchKeyword }">
					<input type="submit" id="search_btn" value="검색">
				</form>
			</div>
			<!-- 검색창 끝 -->		
		</div>
	</section>
<c:import url="../default/footer.jsp"/>
</body>
</html>