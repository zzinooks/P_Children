<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 작성한 게시글 보기</title>
<style type="text/css">
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
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
		<h1>프로그램 작성 게시글</h1>
		<div class="valueHiddenView">${programBoardNum}</div>
	 	<!-- 프로그램 테이블 시작 -->
		<table>
			<!-- 제목 칼럼 -->
			<tr>
				<th>글번호</th>
				<th>제 목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>예약현황</th>
				<th>조회수</th>
				<th>프로그램 참여 인원</th>	
			</tr>
			<!-- // 제목 칼럼 끝 -->
			<!-- 내용 시작 -->
			<c:choose>
				<c:when test="${empty mypageBoardProgramList}">
					<tr>
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="mypageBoardProgramList" items="${mypageBoardProgramList}">
						<tr>
							<td class="valueHiddenView" id="file_name">${mypageBoardProgramList.mateImage}</td> <!-- 숨기는 값 -->
							<td>${mypageBoardProgramList.write_no}</td>
							<td><a href="${contextPath}/programBoard/programContentView?write_no=${mypageBoardProgramList.write_no}&num=${num}&programBoardNum=${programBoardCheckNum }">${mypageBoardProgramList.title }</a></td>
							<td>${mypageBoardProgramList.id}</td>
							<td>${mypageBoardProgramList.savedate}</td>
							<td>${mypageBoardProgramList.state}</td>
							<td>${mypageBoardProgramList.hit}</td>
							<td>${mypageBoardProgramList.currentRegisterCount} / ${mypageBoardProgramList.totalRegisterCount}</td>
						</tr>
						<tr>
							<th> id </th>
							<th colspan="5"> 결재 상황 </th>
							<th>취소 승인 버튼</th>
						</tr>
							<c:forEach var="paidProgramInfoDTO" items="${mypageBoardProgramList.paidProgramInfoDTO }">
								<tr>
									<td>${paidProgramInfoDTO.id }</td>
									<c:if test="${paidProgramInfoDTO.cancel_request == 'Y'}">
			      						<td colspan="5">취소 요청</td>
			      					</c:if>
			      					<c:if test="${paidProgramInfoDTO.cancel_request == 'N'}">
			      						<td>결재 완료</td>
			      					</c:if>
			      					<td><button>취소 승인(구현중)</button></td>
								</tr>
							</c:forEach>
						
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<!-- 내용 끝 -->
			
			<!-- 페이징 시작 -->
			<tr>
				<td colspan="7" align="center">
					<div>
						<c:if test="${startPage > block }">
							[ <a href="${contextPath }/mypageBoard/write/mypageBoardProgramWriteList?num=${startPage-1 }" id="paging"> 이전 </a> ]
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<c:if test="${i == num}">
								[ <a href="${contextPath }/mypageBoard/write/mypageBoardProgramWriteList?num=${i }" id="currentPaging"> ${i } </a> ]
							</c:if>
							<c:if test="${i != num}">
								[ <a href="${contextPath }/mypageBoard/write/mypageBoardProgramWriteList?num=${i }" id="paging"> ${i } </a> ]
							</c:if>
						</c:forEach>
						<c:if test="${endPage < totalPage }">
							[ <a href="${contextPath }/mypageBoard/write/mypageBoardProgramWriteList?num=${endPage+1 }" id="paging"> 다음 </a> ]
						</c:if>
					</div>
				</td>
			</tr>
			<!-- 페이징 끝 -->
	
		</table>	
		<!-- 프로그램 테이블 끝 -->

		<!-- 커뮤니티 게시글 모아져있는 링크입니다. -->
		<a href="${contextPath }/mypageBoard/write/mypageBoardWriteList">커뮤니티 작성글</a>
		
		<a href="${contextPath }/index">메인으로</a>
</body>
</html>