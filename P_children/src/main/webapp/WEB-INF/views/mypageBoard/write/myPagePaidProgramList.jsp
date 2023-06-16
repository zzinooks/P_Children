<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 내가 결제한 프로그램</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=1" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/page.css" rel="stylesheet" type="text/css">
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
</style>
</head>
<body>

	<c:import url="../../default/header.jsp"/>
	
		<section ><!-- body -->
		<div class="form-box-list"> <!--  container  -->
		<div class="title" >카카오페이 관리</div>
		<table >
		<thead>
			<tr>
					<th>결제한 프로그램</th>
					<th>바로가기</th>
			</tr>
		</thead>
				<c:if test="${paidProgramList.size() == 0 }">
					<tr>
						<th colspan="2">없음</th>
					</tr>
				</c:if>
			<c:forEach var="PP" items="${paidProgramList}">
					<tr>
						<td>${PP.title}</td>
						<td><button onclick="location.href='${contextPath}/programBoard/programContentView?write_no=${PP.write_no }&num=${PP.num }'">프로그램 보기</button></td>
					</tr>
				</c:forEach>
		</table>
			<div class="page_wrap">
			   <div class="page_nation">
			      <!-- <a class="arrow pprev" href="#"></a> -->
			      	<c:if test="${startPage > block }">
							<a href="paidProgramInfoList?pg_num=${startPage-1 }"   class="arrow prev"> 이전 </a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<c:if test="${i == pg_num}">
								<a href="paidProgramInfoList?pg_num=${i }"  class="active"> ${i } </a>
							</c:if>
							<c:if test="${i != pg_num}">
								<a href="paidProgramInfoList?pg_num=${i }" class="active"> ${i } </a>
							</c:if>
						</c:forEach>
						<c:if test="${endPage < totalPage }">
							<a href="paidProgramInfoList?pg_num=${endPage+1 }" class="arrow next" > 다음 </a>
						</c:if>
			      <!-- <a class="arrow nnext" href="#"></a> -->
			   </div>
			</div>			
		</div>
	</section>
		
	<c:import url="../../default/footer.jsp"/>
	
</body>
</html>