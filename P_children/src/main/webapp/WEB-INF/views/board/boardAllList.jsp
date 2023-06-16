
<!-- board/boardAllList.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 자유게시판</title>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/page.css?v=1" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	//게시글 삭제 문구 알림창
	function deleteConfirm(write_no, file_name){
		
		if(!confirm('삭제하시겠습니까?')){
			return false;
		} else {
			location.href='${contextPath}/board/delete?write_no='+  write_no + '&file_name=' + file_name;
		}
		
	}
	
	/*function colorConfirm() {
		let h = $("#paging").css("color");
		$("#paging").css("color", "rgb(222, 000, 000)");
		alert(h);
		
	}*/
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
    background:#A996DB;
    font-size:16px;
  }
  
  tbody tr     { 
  height:40px; 
  border-bottom:1px solid #E3F1D5 ;
    &:last-child  { border:0; }
  }
  .valueHiddenView {
	display: none;
}
#right{
	text-align: right;
}
</style>
</head>
<body onload="colorConfirm()">
		<c:import url="../default/header.jsp"/>
		
		<section ><!-- body -->
			<div class="form-box-list"> <!--  container  -->
				<div class="title" > 게시판 </div>
				<table>
				<thead>
					<tr>
							<th> 분 류</th>
							<th> 제 목 </th>
							<th>작성자</th>
							<th> 작성일 </th>
							<th> 조회수 </th>
							<th> 좋아요 </th>
							<c:if test ="${info.grade == admin}">
							<th>관리자 권한</th>
							</c:if>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty boardList}">
						<tr>
							<td colspan="7">등록된 글이 없습니다.</td>
						</tr>	
					</c:when>
					<c:otherwise>
							<c:forEach var="dto" items="${boardList }">
								<tr>
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
									<c:choose>
										<c:when test="${board_category == null}">
											<td><a href="${contextPath }/board/contentView?write_no=${dto.write_no}&num=<%=request.getParameter("num")%>">${dto.title }</a></td>
										</c:when>
										<c:otherwise>
											<td><a href="${contextPath }/board/contentView?write_no=${dto.write_no}&num=<%=request.getParameter("num")%>&board_category=${board_category }&board_searchCategory=${board_searchCategory}&board_searchKeyword=${board_searchKeyword}">${dto.title }</a></td>
										</c:otherwise>
									</c:choose>
									<td>${dto.savedate }</td>
									<td>${dto.hit }</td>
									<td>${dto.dibsCount }</td>
									<c:if test ="${info.grade == admin}">
										<td><button onclick="deleteConfirm('${dto.write_no}', '${dto.file_name }')">삭제</button></td>
									</c:if>
								</tr>
							</c:forEach>
					</c:otherwise>
				</c:choose>
				</table>
				<div class="button">
					<c:if test="${loginUser != null || kakaoId != null}">
							<input type="button" value="글작성" onclick="location.href='${contextPath }/board/writeForm'" class="but_2">
					</c:if>
				</div>
			<!-- 검색 --> <!-- 수정 -->
			<div  class="page_wrap">
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
			</div>				
			<!-- 페이징 -->
			<div  class="page_wrap">
					<div class="page_nation">
							<!-- 메인 페이징  -->
							<c:if test="${board_category == null}">
								<c:if test="${startPage > block }">
									<a href="${contextPath }/board/boardAllList?num=${startPage-1 }" class="arrow prev"> 이전 </a>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
									<c:if test="${i == num}">
										<a href="${contextPath }/board/boardAllList?num=${i }" class="active"> ${i } </a>
									</c:if>
									<c:if test="${i != num}">
										<a href="${contextPath }/board/boardAllList?num=${i }" class="active" > ${i } </a>
									</c:if>
								</c:forEach>
								<c:if test="${endPage < totalPage }">
									<a href="${contextPath }/board/boardAllList?num=${endPage+1 }" class="arrow next" > 다음 </a>
								</c:if>
							</c:if>	
					</div>				
				</div>
				<!-- 검색 페이징 --><!-- 수정 -->
				<c:if test="${notice_category != null }">
					<div  class="page_wrap">
						<div class="page_nation">	
								<c:if test="${startPage > block }">
									<a href="${contextPath }/board/notice/noticeSearchForm?num=${startPage-1 }&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}" class="arrow prev"> 이전 </a>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
									<c:if test="${i == num}">
										<a href="${contextPath }/board/notice/noticeSearchForm?num=${i }&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}" class="active"> ${i } </a>
									</c:if>
									<c:if test="${i != num}">
										<a href="${contextPath }/board/notice/noticeSearchForm?num=${i }&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}" class="active"> ${i } </a>
									</c:if>
								</c:forEach>
								<c:if test="${endPage < totalPage }">
									<a href="${contextPath }/board/notice/noticeSearchForm?num=${endPage+1 }&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}" class="arrow next" > 다음 </a>
								</c:if>
						</div>
				</c:if>
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
						<c:if test="${loginUser != null || kakaoId != null}">
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