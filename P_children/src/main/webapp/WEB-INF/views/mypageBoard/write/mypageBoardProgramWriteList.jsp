<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>  
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 작성한 게시글 보기</title>
<script type="text/javascript">

	function confirmToCancel(tid){
		
		if(!confirm('취송승인하시겠습니까?')){
			return false;
		} else {
			alert('tid : ' + tid + ' 취소되었습니다~!');
			
			$.ajax({
				url: "paidCancelRequest/"+tid,
				type: "post",
				contentType: "application/json; charset=utf-8",
				success: function(data){
					alert("반환값은 " + data);
				}, // success end
				error: function() {
					alert("Error!!")
				}
				
			}) // ajax end
			return true;
		}
	}
</script>
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
									<td colspan="5" id=" ${paidProgramInfoDTO.tid}">
									<c:if test="${paidProgramInfoDTO.cancel_request == 'Y'}">
			      						취소 요청
			      					</c:if>
			      					<c:if test="${paidProgramInfoDTO.cancel_request == 'N'}">
			      						결재 완료
			      					</c:if>
			      					<c:if test="${paidProgramInfoDTO.cancel_request == 'P'}">
			      						관리자 취소 승인 대기
			      					</c:if>
			      					</td>
			      					<td>
			      						<button onclick="confirmToCancel('${paidProgramInfoDTO.tid}')">취소 승인</button>
			      					</td>
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