
<!-- programBoard/programBoardContent.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
	String num2 = request.getParameter("num");
	if(num2.equals("null")){
		num2 = "1";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>programBoard/programBoardContent.jsp</title>
<script type="text/javascript">
	function confirmDelete() {
		
		if(!confirm('삭제하시겠습니까?')){
			return false;
		} else {
			location.href="${contextPath}/programBoard/deleteProgram?write_no="+${programBoardDTO.write_no};
		}
		
	}
	
	function confirmToPay() {
		if(!confirm('결재 화면으로 이동하시겠습니까?')){
			return false;
		} else {
			$("#programPayForm").submit();
		}
		
	}
</script>
<style type="text/css">
h1 {
   text-align: center;
}

.write_form {
   width: 1200px;
   margin: 0 auto;
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <section>
	   <h1>펫위드-프로그램 확인</h1>
	   <div class="wrap write_form">
	      <div class="write_save">
	      <table class="table table-striped">
	         <form action="${contextPath }/programBoard/updateSaveForProgram" enctype="multipart/form-data" method="post">
	            <tr>
	               <th><b> 작성자 </b><br></th>
	               <td>${user }</td>
	               <th><b> 프로그램 이 름 </b><br></th>
	               <td>${programBoardDTO.title }</td>
	            </tr>
	            <tr>
	               <th><b> 견 종 </b><br></th>
	               <td> ${programBoardDTO.petKind} </td>
	               <th><b> 강아지 이름 </b></th>
	               <td>${programBoardDTO.mateName }</td>
	            </tr>
	            <tr>
	               <th> 강아지 사진 </th>
	               <td>
						<c:if test="${programBoardDTO.mateImage == 'nan'}">
							<b>이미지가 없습니다...</b>
						</c:if>
						<c:if test="${programBoardDTO.mateImage != 'nan'}">
							<img src="${contextPath }/board/download?file_name=${programBoardDTO.mateImage}" width="200px" height="200px">
						</c:if>
					</td>
	               <th> 위치 </th>
	               <td>
	                  ${programBoardDTO.position1 } &nbsp; ${programBoardDTO.position2 }
	               </td>
	            </tr>
	            <tr>
	               <th rowspan="3"><b> 내 용 </b></th>
	               <td rowspan="3" style="right-padding: 0"><textarea name="content" rows="10" cols="50" readonly>${programBoardDTO.content }</textarea></td>
	               <th style="left-padding: 0"> 시 작 날 짜 <br><br> 시작 시간 </th>
	               <td><input type="text" name="startDate" value="${programBoardDTO.startDate}" readonly> <br><br> <input type="time" name="startTime" id="startTime" value="${programBoardDTO.startTime}" readonly></td>
	            </tr>
	            <tr>
	               <th style="left-padding: 0"> 종 료 날 짜 <br><br> 종료 시간</th>
	               <td><input type="text" name="endDate" value="${programBoardDTO.endDate}" readonly><br><br> <input type="time" name="endTime" id="endTime" value="${programBoardDTO.endTime}" readonly></td>
	            </tr>
	            <tr>
	               <th style="left-padding: 0">프 로 그 램  비 용</th>
	               <td colspan="3">${programBoardDTO.priceForProgram } <b>원</b></td>
	               <td><b> 현황</b></td>
	               <td>${programBoardDTO.state }</td>
	            </tr>
	            <tr>
	               <td colspan="4">
					<c:if test="${user == programBoardDTO.id }">
	                  <input type="button" onclick="location.href='${contextPath}/programBoard/modifyProgramForm?write_no=${programBoardDTO.write_no }&num=<%=num2 %>'" value="수정"/> &nbsp;
	                  <input type="button" value="삭제" onclick="confirmDelete()"/> &nbsp; 
	                </c:if>
	                  <input type="button" value="글목록" onclick="location.href='${contextPath}/programBoard/programBoardAllList'"/>
	               </td>
	            </tr>
	         </form>
	         <tr>
	       		<td>
	         	<form action="${contextPath }/member/kakaoPayBtn" method="get" id="programPayForm">
	         		<input type="hidden" name="title" value="${programBoardDTO.title }"><br>
	         		<input type="hidden" name="quantity" value="1"><br>
	         		<input type="hidden" name="total_amount" value="${programBoardDTO.priceForProgram }"><br>
	         		<input type="hidden" name="write_no" value="${programBoardDTO.write_no }"><br>
	         		<input type="hidden" name="num" value="<%=num2 %>"><br>
	         			
	         		<button onclick="confirmToPay()">결재하기</button>
	         	</form>
	         	</td>
	         </tr>
	      </table>
	      </div>
	   </div>
   </section>
   <c:import url="../default/footer.jsp"/>
</body>
</html>