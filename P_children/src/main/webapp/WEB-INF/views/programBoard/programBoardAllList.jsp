<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 프로그램 게시판</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=1" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/page.css?v=1" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function deleteConfirm(write_no, file_name){
		
		if(!confirm('삭제하시겠습니까?')){
			return false;
		} else {
			location.href='${contextPath}/programBoard/deleteProgram?write_no=' + write_no + '&file_name=' + file_name;
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
#notice_category {
	margin: 5px;
}
#notice_searchCategory{
	margin: 5px;
}
#notice_searchKeyword{
	margin: 5px;
}
#search_btn{
	margin: 5px;
}
</style>
</head>
<body>

	<c:import url="../default/header.jsp"/>
	
		<section ><!-- body -->
			<div class="form-box-list"> <!--  container  -->
			<div class="title" >프로그램 게시판</div>
			<table >
			<thead>
				<tr>
						<th> 번 호 </th>
						<th> 작성자</th>
						<th> 제 목</th>						
						<th>작성일</th>
						<th>예약 현황 ( 신청인원 / 총원 )</th>
						<th>조회수</th>
						<th><img width="30px" height="30px" src="https://cdn-icons-png.flaticon.com/512/138/138533.png?w=826&t=st=1686704293~exp=1686704893~hmac=6f355d28e7dbaf3380f00e77d046efe85cf73ab4f5d2adcf464457a3b814b714"></th>
						<c:if test ="${info.grade == admin}">
						<th>관리자 권한</th>
						</c:if>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${empty programBoardList}"> <!-- ${boardList.size() == 0} -->
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
								<td> 찜수나올예정</td>
								<c:if test ="${info.grade == admin}">
									<td><button onclick="deleteConfirm('${dto.write_no}', '${dto.mateImage }')">삭제</button></td>
								</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
			<!--  host 글작성 -->
			<div class="button">
				<c:if test="${info.grade == admin}">
					<input type="button" value="글작성" onclick="location.href='${contextPath }/programBoard/writeFormForProgram'" class="but_2">
				</c:if>			
			</div>		
			<!-- 검색 추가 예정 -->
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
			<c:if test="${notice_category == null}">
			<div  class="page_wrap">
					<div class="page_nation">
							<c:if test="${startPage > block }">
								<a href="programBoardAllList?num=${startPage-1 }" class="arrow prev"> 이전 </a>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
								<c:if test="${i == num}">
									<a href="programBoardAllList?num=${i }" class="active"> ${i } </a>
								</c:if>
								<c:if test="${i != num}">
									<a href="programBoardAllList?num=${i }" class="active"> ${i }  </a>
								</c:if>
							</c:forEach>
							<c:if test="${endPage < totalPage }">
								<a href="programBoardAllList?num=${endPage+1 }" class="active"> 다음 </a>
							</c:if>
					</div>
				</div>
			</c:if>
			<!-- 검색 페이징 추가 예정-->
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
					</div>	
				</c:if>			
		</div>
	</section>

	<c:import url="../default/footer.jsp"/>

</body>
</html>