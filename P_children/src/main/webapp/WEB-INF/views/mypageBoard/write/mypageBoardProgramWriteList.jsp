<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 작성한 게시글 보기</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=3" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/page.css" rel="stylesheet" type="text/css">
<style type="text/css">
table             { 
  border-spacing: 1; 
  border-collapse: collapse; 
  background:white;
  border-radius:6px;
  overflow:hidden;
  max-width:800px; 
  width:100%;
  margin:0 auto;
  position:relative;
  }
    td,th           { 
    padding-left:8px;
    text-align: center;
    }

  thead tr  { 
    height:50px;
    background:#C19681;
    font-size:16px;
  }
  
  tbody tr     { 
  height:48px; 
  border-bottom:1px solid #C19681;
    &:last-child  { border:0; }
  }
 #file_name{
 	display: none;
 }
</style>
</head>
<body>

	<c:import url="../../default/header.jsp"/>

	<section><!-- body -->
		<div class="form-box"> <!--  container  -->
		<div class="title" >프로그램 게시글</div>
		<div class="valueHiddenView">${programBoardNum}</div>
	 	<!-- 프로그램 테이블 시작 -->
		<table>
			<!-- 제목 칼럼 -->
		<thead>			
			<tr>
				<th>글번호</th>
				<th>제 목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>예약현황</th>
				<th>조회수</th>		
			</tr>
		</thead>
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
							<td class="valueHiddenView" id="file_name" >${mypageBoardProgramList.mateImage}</td> <!-- 숨기는 값 -->
							<td>${mypageBoardProgramList.write_no}</td>
							<td><a href="${contextPath}/programBoard/programContentView?write_no=${mypageBoardProgramList.write_no}&num=${num}&programBoardNum=${programBoardCheckNum }">${mypageBoardProgramList.title }</a></td>
							<td>${mypageBoardProgramList.id}</td>
							<td>${mypageBoardProgramList.savedate}</td>
							<td>${mypageBoardProgramList.state}</td>
							<td>${mypageBoardProgramList.hit}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>	
			<div class="page_wrap">
				 <div class="page_nation">
					<c:if test="${startPage > block }">
						<a href="${contextPath }/mypageBoard/write/mypageBoardProgramWriteList?num=${startPage-1 }"  class="arrow prev"> 이전 </a>
							</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
									<c:if test="${i == num}">
										<a href="${contextPath }/mypageBoard/write/mypageBoardProgramWriteList?num=${i }" class="active"> ${i } </a>
									</c:if>
									<c:if test="${i != num}">
										<a href="${contextPath }/mypageBoard/write/mypageBoardProgramWriteList?num=${i }" class="active"> ${i } </a>
									</c:if>
								</c:forEach>
							<c:if test="${endPage < totalPage }">
						<a href="${contextPath }/mypageBoard/write/mypageBoardProgramWriteList?num=${endPage+1 }" class="arrow next" > 다음 </a>
					</c:if>
				</div>
			</div>
			<input type="button" value="게시판 게시글"onclick="location.href='${contextPath }/mypageBoard/write/mypageBoardWriteList'" class="but_1">			
			<ul class="menu">
				<li><a href="">메뉴</a>
					<ul class="submenu_">
						<hr>
						<li><a href="${contextPath }/member/member_information">이전</a></li>
					</ul>
				</li>
			</ul>
			</div>
		</section>
		
		<c:import url="../../default/footer.jsp"/>
		
</body>
</html>