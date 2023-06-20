
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
	
	// 결제불가 메시지
	function impossibleToPay() {
		if(${user == null} ) {
			alert("로그인 후 사용할 수 있습니다");
		} else {
			alert("모집 인원이 모두 마감되었습니다.");
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
			url: "toggleDibs/"+${programBoardDTO.write_no},
			type: "POST", 
			data: JSON.stringify(form),
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				alert("찜하기 성공!!");
				alert("result 값은 " + data.result + "이고 이제 찜한 사람의 숫자는" +data.changedDibsNum + "입니다");
				if(data.result == 1) { // (처음으로 누른 경우) insert 결과가 1 이거나,(처음이 아닌 경우) dibs_state 가 1 일 때
					$("#dibs_image").attr("src", "https://cdn-icons-png.flaticon.com/512/138/138533.png?w=826&t=st=1686704293~exp=1686704893~hmac=6f355d28e7dbaf3380f00e77d046efe85cf73ab4f5d2adcf464457a3b814b714");
				}
				else { // dibs_state가 0일 때
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
      <div class="form-box-list"> 
            <form action="" enctype="multipart/form-data" method="post">
            <table class="table table-striped">
                  <tr>
                       <th><b> 프로그램 제 목 </b><br></th>
                     <td>${programBoardDTO.title }</td>
                     <th><b> 찜하기 </b><br></th>
                     <td colspan="4">
                            <button class="btn btn-light" id="dibsNum">
                           <div id="dibsNumPoint">${dibsNum} 명이 찜했습니다!</div>
                        </button>
                        <button class="btn btn-light"
                        onclick=
                           <c:choose>
                              <c:when test="${user == null || kakaoIdCheck != null}">"loginPlease()"</c:when>
                              <c:otherwise>"toggleDibs()"</c:otherwise>
                           </c:choose>
                           >
                           찜하기
                           <img id="dibs_image" width="20px" height="20px" alt="버튼" src=
                           <c:if test="${state == 0 || user == null}">
                           "https://cdn-icons-png.flaticon.com/512/1222/1222392.png?w=826&t=st=1686704242~exp=1686704842~hmac=c1303f6f53b624870cb23578a1d29c709520f8bab476386e8427893ab06117fb" 
                           </c:if>
                           <c:if test="${state == 1}">
                           "https://cdn-icons-png.flaticon.com/512/138/138533.png?w=826&t=st=1686704293~exp=1686704893~hmac=6f355d28e7dbaf3380f00e77d046efe85cf73ab4f5d2adcf464457a3b814b714" 
                           </c:if>
                           >
                        </button>
                     </td>                  
                  </tr>
                  <tr>
                       <th><b> 작성자 </b><br></th>
                     <td >${programBoardDTO.id }</td>
                     <th><b> 현황</b></th>
                     <td colspan="4">${programBoardDTO.state } &nbsp; ${programBoardDTO.currentRegisterCount } / ${programBoardDTO.totalRegisterCount }</td>
                  </tr>
                  <tr>
                     <th><b> 견 종 </b><br></th>
                     <td> ${programBoardDTO.petKind} </td>
                     <th><b> 강아지 이름 </b></th>
                     <td colspan="4">${programBoardDTO.mateName }</td>
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
                     <td colspan="4">
                        ${programBoardDTO.position1 } &nbsp; ${programBoardDTO.position2 }
                     </td>
                  </tr>
                  <tr>
                     <th rowspan="2"><b> 내 용 </b></th>
                     <td rowspan="2" ><textarea name="content" rows="10" cols="50" readonly>${programBoardDTO.content }</textarea></td>
                     <th > 시 작 날 짜</th>
                     <td ><input type="text" name="startDate" value="${programBoardDTO.startDate}" readonly> </td>
                 <th>시작 시간 </th>
                 <td><input type="time" name="startTime" id="startTime" value="${programBoardDTO.startTime}" readonly></td>                 
                  </tr>
                  <tr>
                     <th > 종 료 날 짜</th>
                     <td><input type="text" name="endDate" value="${programBoardDTO.endDate}" readonly></td>
                     <th> 종료 시간</th>
                     <td><input type="time" name="endTime" id="endTime" value="${programBoardDTO.endTime}" readonly></td>
                  </tr>
                  <tr>
                     <th>프 로 그 램  비 용</th>
                     <td colspan="6">${programBoardDTO.priceForProgram } <b>원</b></td>
                  </tr>
            </table>  
         </form>
         <c:choose>
         <c:when test="${programBoardDTO.currentRegisterCount < programBoardDTO.totalRegisterCount && user != null}">
         	<button onclick="confirmToPay()" class="but_1">결제하기</button>
         	<form action="${contextPath }/member/kakaoPayBtn" method="get" id="programPayForm">
               <input type="hidden" name="title" value="${programBoardDTO.title }"><br>
               <input type="hidden" name="quantity" value="1"><br>
               <input type="hidden" name="total_amount" value="${programBoardDTO.priceForProgram }"><br>
               <input type="hidden" id="write_no" name="write_no" value="${programBoardDTO.write_no }"><br>
               <input type="hidden" name="num" value="<%=num2 %>"><br>
               <c:if test="${programBoardDTO.state != '결재 완료'}">                     
               <c:if test="${user != null }"><button onclick="confirmToPay()">결제하기</button></c:if>
               </c:if>
            </form>
         	
         </c:when>
         <c:otherwise>
         	<button onclick="impossibleToPay()" class="but_1">결재 불가</button>
         </c:otherwise>
         </c:choose>
		<ul class="menu">
        	<li>
            	<a href="">메뉴</a>
                <ul class="submenu_">
                	<hr>
                     <c:choose>
	                	<c:when test="${myProgramBoardCheckNum == 1 }">
		               <%-- 0616_최윤희 추가: 마이페이지 -> 프로그램 게시글 제목 클릭 -> 다시 마이페이지 프로그램 게시글로 --%>
		               <%-- 프로그램 체크 번호가 1이면 해당 글목록 버튼 --%>
		               	  <a href="${contextPath}/mypageBoard/write/mypageBoardProgramWriteList?programBoardNum=${programBoardCheckNum }&num=${num }">글목록</a>
		               <%-- 0616_최윤희 끝 --%>
		               </c:when>
		               		<c:otherwise>
			               		<c:choose>
			               			<c:when test="${toMyDibsProgramBoard == 'yes' }">
			               				<a href="${contextPath}/mypageBoard/myDibsProgramBoard?num=<%=num2%>">글목록</a>
			               			</c:when>
			               			<c:when test="${programBoard_state != null }">
			               				<a href="${contextPath}/programBoard/programBoardSearchForm?num=<%=num2%>&programBoard_state=${programBoard_state }&programBoard_searchCategory=${programBoard_searchCategory}&programBoard_searchKeyword=${programBoard_searchKeyword}">글목록</a>
			               			</c:when>
			               			<c:otherwise>
			               				<a href="${contextPath}/programBoard/programBoardAllList?num=<%=num2 %>">글목록</a>
			               			</c:otherwise>
			               		</c:choose>
	               			</c:otherwise>
		           		</c:choose>  
                   </ul>
           		</li>
			</ul> 
      </div>
   </section>
   <!-- 좋아요 기능 담당하는 부분(삭제하지 말아주세요) -->
    <form id="dibs_info" action="" method="post" name="dibs_info">
		<input type="text" name="write_no"  value="${programBoardDTO.write_no }">
		<input type="text" name="id"  value="${user }">
	</form>

   <c:import url="../default/footer.jsp"/>
   
</body>
</html>