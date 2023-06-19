
<!-- programBoard/programBoardContent.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
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
<title>Mate With 프로그램 게시판 글보기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	// 삭제 확인
	function confirmDelete() {
		if(!confirm('삭제하시겠습니까?')){
			return false;
		} else {
			location.href="${contextPath}/programBoard/deleteProgram?write_no="+${programBoardDTO.write_no};
		}
	}
	
	// 결재화면 이동 확인
	function confirmToPay() {
		if(!confirm('결제 화면으로 이동하시겠습니까?')){
			return false;
		} else {
			$("#programPayForm").submit();
		}
	}
	
	// 찜하기 관련 기능 시작 ------------------------------------------------------------------------------------------------------
	function toggleDibs() {
		let form = {}
		let arr = $("#dibs_info").serializeArray();
		for( i = 0; i <arr.length ; i++) {
			form[arr[i].name] = arr[i].value;
		}
		console.log(arr[1].value);
		$.ajax({
			url: "toggleDibs/"+$("#write_no").val(),
			type: "POST", 
			data: JSON.stringify(form),
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				/* alert("토글 성공이요~!");
				alert("결과값(1빨강,0하양) " + data.result);
				alert("찜한사람숫자 :" + data.changedDibsNum); */
				if(data.result == 1) { // (처음으로 누른 경우) insert 결과가 1 이거나,(처음이 아닌 경우) dibs_state 가 1 일 때 
					$("#dibs_image").attr("src", "https://cdn-icons-png.flaticon.com/512/138/138533.png?w=826&t=st=1686704293~exp=1686704893~hmac=6f355d28e7dbaf3380f00e77d046efe85cf73ab4f5d2adcf464457a3b814b714");
				}
				if(data.result == 0) { // dibs_state가 0일 때
					$("#dibs_image").attr("src", "https://cdn-icons-png.flaticon.com/512/1222/1222392.png?w=826&t=st=1686704242~exp=1686704842~hmac=c1303f6f53b624870cb23578a1d29c709520f8bab476386e8427893ab06117fb");
				}
				$("#dibsNumPoint").html(data.changedDibsNum + "명이 찜했습니다!");
			},
			error: function() {
				alert("찜하기 실패...")
			}
			
		})

	}
	
	// 찜하기 관련 기능 끝 ------------------------------------------------------------------------------------------------------
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
    th{ 
    padding-left:8px;
    padding-right: 8px;
    text-align:center;
    }  
    td{ 
    padding-left:8px;
    padding-right: 8px;
    text-align:left;
    }  
 th { background-color: #A996DB; 
 width: auto;}
  tbody tr     { 
  height:40px; 
  border-bottom:1px solid #E3F1D5 ;
    &:last-child  { border:0; }
  }
  a{
	text-decoration-line: none;
}
</style>
</head>
<body>

   <c:import url="../default/header.jsp"/>
   
		<section ><!-- body -->
			<div class="form-box-list"> <!--  container  -->
			<div class="title" >프로그램 확인</div>
			<table>
				<tr>
					<th>제목</th>
						<td>${noticeBoardDTO.title }</td>
					<th>분류</th>
						<td>				
							<c:if test="${noticeBoardDTO.category == 'noticeGeneral' }"> 일반 </c:if>
							<c:if test="${noticeBoardDTO.category == 'noticeEvent' }"> 이벤트 </c:if>
							<c:if test="${noticeBoardDTO.category == 'noticeProduct' }"> 상품 </c:if>
							<c:if test="${noticeBoardDTO.category == 'noticeDeliveryDelay' }"> 배송지연 </c:if>
						</td>
				</tr>
				<tr>
					<th>글번호</th>
						<td>${noticeBoardDTO.write_no }</td>				
					<th>작성일</th>
						<td>${noticeBoardDTO.savedate }</td>
			   </tr>
			   	<tr>
					<th>작성자</th>
					<td colspan="3">${noticeBoardDTO.id }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3" >${noticeBoardDTO.content }</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td colspan="3">
						<c:if test="${noticeBoardDTO.file_name == 'nan'}">
							<p>이미지가 없습니다...</p>
						</c:if>
						<c:if test="${noticeBoardDTO.file_name != 'nan'}">
							<img src="${contextPath }/board/notice/noticeBoardDownload?file_name=${noticeBoardDTO.file_name}" width="200px" height="200px">
						</c:if>						
					</td>
				</tr>
			</table>
				<c:if test="${info.grade != admin }">
				<ul class="menu">
			      <li>
			        <a href="#">메뉴</a>
			        <ul class="submenu_">
			         <hr>
			         <c:choose>
				         <c:when test="${notice_category != null}">
				          	<li><a href="${contextPath }/board/notice/noticeSearchForm?num=${num}&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}">목록</a></li>
						 </c:when>
						<c:otherwise>			          
			          	<li><a href="${contextPath }/board/notice/noticeBoardAllList?num=${num}">목록</a></li>
			          	</c:otherwise>
			          </c:choose>	
			        </ul>
			      	</li>
			    </ul> 
				</c:if>	
				<c:if test="${info.grade == admin }">
				<ul class="menu">
			      <li>
			        <a href="#">메뉴</a>
			        <hr>
			        <ul class="submenu">
				         <c:choose>
					         <c:when test="${notice_category != null}">
					          	<li><a href="${contextPath }/board/notice/noticeSearchForm?num=${num}&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}">목록</a></li>
							 </c:when>
							<c:otherwise>			          
				          	<li><a href="${contextPath }/board/notice/noticeBoardAllList?num=${num}">목록</a></li>
				          	</c:otherwise>
				          </c:choose>	
				          <hr>
				          <li><a href="${contextPath }/board/notice/noticeBoardModifyForm?write_no=${noticeBoardDTO.write_no }">수정</a></li>
				          <hr>
				          <li><a href="${contextPath }/board/notice/noticeBoardDelete?write_no=${noticeBoardDTO.write_no }&file_name=${noticeBoardDTO.file_name }">삭제</a></li>
				        </ul>
				      </li>
			    	</ul> 
				</c:if>	
		</div>
	</section>   
	
   <c:import url="../default/footer.jsp"/>
   
</body>
</html>