<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath }/resources/yoonhee/js/noticeBoardScript.js?v=2"></script>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
	// 게시글 삭제 문구 알림창
	function noticeBoardDeleteConfirm(write_no, file_name) {
		
		if(!confirm('삭제하시겠습니까?')){
			return false;
		} else {
			location.href='${contextPath }/board/notice/noticeBoardDelete?write_no='+write_no +'&file_name='+file_name;
		}
		
	}
	
	// 게시글 수정 문구 알림
	function noticeBoardModifyConfirm(write_no) {
		
		if(!confirm('수정하시겠습니까?')){
			return false;
		} else {
			location.href='${contextPath }/board/notice/noticeBoardModifyForm?write_no='+write_no;
		}
		
	}
	
	
	// 카테고리 값 전달
	function noticeCategoryChange(){
		document.categorySelect.submit();
	}

	
</script>
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

body {
	z-index: 
}

/* 숨기기 */
.valueHiddenView {
	display: none;
}

/* 검색 버튼 */
.search_area {
	text-align: center;
}
</style>

</head>
<body>

<c:import url="../../default/header.jsp"/>
		
	<h1>공지사항</h1>
	<div class="wrap board_table">
		<table class="table table-striped">
			<tr>
				<th width="150px"> 구 분 </th>
				<th width="200px"> 제 목 </th>
				<th width="150px"> 작성자 </th>
				<th width="200px"> 작성일 </th>
				<th width="70px"> 조회수 </th>
				<c:if test ="${info.grade == admin}"> <!-- info.grade(gold) == admin(관리자) 일 때 -->
					<th>관리자 권한</th>
				</c:if>
			</tr>
			
			
			<c:choose>
				<c:when test="${empty noticeBoardList}"> <!-- ${boardList.size() == 0} -->
					<tr>
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>	
				</c:when>
				<c:otherwise>
					<c:forEach var="noticeBoardDTO" items="${noticeBoardList }">
						<tr>
							<td class="valueHiddenView" id="write_no">${noticeBoardDTO.write_no}</td><!-- 값만 받아오기 위해 숨김 -->
							<td class="valueHiddenView" id="file_name">${noticeBoardDTO.file_name }</td><!-- 값만 받아오기 위해 숨김 -->
							<!-- 카테고리 구분 -->
							<td>
								<c:if test="${noticeBoardDTO.category == 'noticeGeneral' }">
								 일반 
								</c:if>
								<c:if test="${noticeBoardDTO.category == 'noticeEvent' }">
								 이벤트 
								</c:if>
								<c:if test="${noticeBoardDTO.category == 'noticeProduct' }">
								 상품 
								</c:if>
								<c:if test="${noticeBoardDTO.category == 'noticeDeliveryDelay' }">
								 배송지연 
								</c:if>
							</td>
							<c:choose>
								<c:when test="${notice_category == null}">
									<td><a href="${contextPath }/board/notice/noticeBoardContentView?write_no=${noticeBoardDTO.write_no}&num=${num}">${noticeBoardDTO.title }</a></td>
								</c:when>
								<c:otherwise>
									<td><a href="${contextPath }/board/notice/noticeBoardContentView?write_no=${noticeBoardDTO.write_no}&num=${num}&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}">${noticeBoardDTO.title }</a></td>
								</c:otherwise>
							</c:choose>
							<td>${noticeBoardDTO.id }</td>
							<td>${noticeBoardDTO.savedate }</td>
							<td>${noticeBoardDTO.hit }</td>
							<c:if test ="${info.grade == admin}">
								<td>
									<button onclick="noticeBoardDeleteConfirm('${noticeBoardDTO.write_no}','${noticeBoardDTO.file_name }')">삭제</button>
									<button onclick="noticeBoardModifyConfirm('${noticeBoardDTO.write_no }')">수정</button>
								</td>
							</c:if>
						<tr>	
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			<tr>
				<c:choose>
					<c:when test="${info.grade == admin}"> <!-- 관리자이면 -->
						<td colspan="6" align="center">
					</c:when>
					<c:otherwise>
						<td colspan="5" align="center">
					</c:otherwise>
				</c:choose>
		
				<!-- 페이징 -->
				<div id="paging_block">
					<%-- 공지 게시판 들어가자마자 나오는 페이징 --%>
					<c:if test="${notice_category == null}">
						<c:if test="${startPage > block }">
							[ <a href="${contextPath }/board/notice/noticeBoardAllList?num=${startPage-1 }" id="paging"> 이전 </a> ]
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<c:if test="${i == num}">
								[ <a href="${contextPath }/board/notice/noticeBoardAllList?num=${i }" id="currentPaging"> ${i } </a> ]
							</c:if>
							<c:if test="${i != num}">
								[ <a href="${contextPath }/board/notice/noticeBoardAllList?num=${i }" id="paging"> ${i } </a> ]
							</c:if>
						</c:forEach>
						<c:if test="${endPage < totalPage }">
							[ <a href="${contextPath }/board/notice/noticeBoardAllList?num=${endPage+1 }" id="paging"> 다음 </a> ]
						</c:if>
					</c:if> 
					<%-- 검색 클릭시 페이징 --%>
					<c:if test="${notice_category != null }">
						<c:if test="${startPage > block }">
							[ <a href="${contextPath }/board/notice/noticeSearchForm?num=${startPage-1 }&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}" id="paging"> 이전 </a> ]
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<c:if test="${i == num}">
								[ <a href="${contextPath }/board/notice/noticeSearchForm?num=${i }&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}" id="currentPaging"> ${i } </a> ]
							</c:if>
							<c:if test="${i != num}">
								[ <a href="${contextPath }/board/notice/noticeSearchForm?num=${i }&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}" id="paging"> ${i } </a> ]
							</c:if>
						</c:forEach>
						<c:if test="${endPage < totalPage }">
							[ <a href="${contextPath }/board/notice/noticeSearchForm?num=${endPage+1 }&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}" id="paging"> 다음 </a> ]
						</c:if>
					</c:if>
				</div>
				</td>
			</tr>
			
			<tr>
				<c:choose>
					<c:when test="${info.grade == admin}">
						<td colspan="7" align="center">	
						<a href="${contextPath }/board/notice/noticeBoardWriteForm">글작성</a> <!-- 관리자만 글 작성 가능 -->
					</c:when>
					<c:otherwise>
						<td colspan="6" align="center">
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		
		<!-- 검색 -->
		<form name="noticeSearchForm" action="${contextPath }/board/notice/noticeSearchForm" method="get">
			<select name="notice_category" id="notice_category">
				<option value="noticeAll" <c:if test="${notice_category == 'noticeAll' }">selected</c:if>>전체</option>
				<option value="noticeGeneral" <c:if test="${notice_category == 'noticeGeneral' }">selected</c:if>>일반</option>
				<option value="noticeEvent" <c:if test="${notice_category == 'noticeEvent' }">selected</c:if>>이벤트</option>
				<option value="noticeProduct" <c:if test="${notice_category == 'noticeProduct' }">selected</c:if>>상품</option>
				<option value="noticeDeliveryDelay" <c:if test="${notice_category == 'noticeDeliveryDelay' }">selected</c:if>>배송지연</option>
			</select>
			<select name="notice_searchCategory" id="notice_searchCategory">
				<option value="title" <c:if test="${notice_searchCategory == 'title' }">selected</c:if>>제목</option>
				<option value="content" <c:if test="${notice_searchCategory == 'content' }">selected</c:if>>내용</option>
				<option value="id" <c:if test="${notice_searchCategory == 'id' }">selected</c:if>>작성자</option>
				<option value="titleContent" <c:if test="${notice_searchCategory == 'titleContent' }">selected</c:if>>제목+내용</option><!-- 제목+내용 아직 구현 안됐습니다. -->
			</select>
			<input type="text" id="notice_searchKeyword" name="notice_searchKeyword" value="${notice_searchKeyword }">
			<input type="submit" id="search_btn" value="검색">
		</form>

		
		<a href="${contextPath }/index">메인으로</a>
	</div>

<c:import url="../../default/footer.jsp"/>
</body>
</html>