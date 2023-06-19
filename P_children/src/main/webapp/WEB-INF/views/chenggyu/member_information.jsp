
<!-- member_information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 회원정보</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
<script type="text/javascript">

   //마이페이지 작성글 보러가기
   /*
   function mypageBoardWriteList() {
      $("#userSelectForm").submit();
   }
	*/
</script>
</head>
<body>
   <c:import url="../default/header.jsp"/>
      
      <section><!-- body -->
      <div class="form-box"> <!--  container  -->
      <div class="title" >회원 정보</div>
      
      <!-- 0616_최윤희 추가: 호스트 인증 버튼 : 버튼 디자인, 위치 바뀌어도 상관없습니다~ -->
      	<c:if test="${dto.certified  == 'N' }">
      		<button onclick="location.href='${contextPath }/mypageBoard/certified/hostCertificationForm'">HOST 인증 신청하기</button>
      	</c:if>
      	<c:if test="${dto.certified  == 'G' }">
      		<button>HOST 인증 심사중</button>
      	</c:if>
      <!-- 0616_최윤희 끝 --> 
      
      <form>
         <div class="user-details">
            <div class="input-box">
               <span class="details">아이디</span>
               <input type="text"  value="${dto.id }" readonly="readonly">   
            </div>
            <div class="input-box">
               <span class="details">닉네임</span>
               <input type="text" value="${dto.nickname }" readonly="readonly" >
            </div>
            <div class="input-box">
               <span class="details">휴대번호</span>
               <input type="text" value="${dto.phone }" readonly="readonly">
            </div>
            <div class="input-box">
               <span class="details">이메일</span>
               <input type="text" value="${dto.email }" readonly="readonly">
            </div>
            <div class="input-box">
               <span class="details">등급</span>
               <input type="text" value="${dto.grade }" readonly="readonly">
            </div>
            <div class="input-box_addr" >
               <span class="details_addr">주소</span>
               <input type="text" value="${dto.addr }"  readonly="readonly">
            </div>
            <c:if test="${dto.userSelect == 'host' }">
            <div class="input-box">
               <span class="details">메이트</span>
               <input type="text" id="mateName" name="mateName" oninput="deleteSpan_mateName()" value="${dto.mateName}" readonly="readonly">
               <input type="text" id="mateBreed" name="mateBreed" oninput="deleteSpan_mateBreed()" value="${dto.mateBreed}" readonly="readonly">
            </div>
            </c:if>
            <%-- 호스트 인증되면 나타나는 인증마크 이미지 --%>
            <c:if test="${dto.certified  == 'Y' && dto.grade != 'gold' }">
            	<img src="${contextPath }/resources/image/hostMark/certification.png" width="100px" height="100px">
			</c:if> 
         </div>
         <div class="button">
            <input type="button" value="개인정보 수정" onclick="location.href='member_modify'" class="but_1">
            <input type="button" value="내가 찜한 게시글" onclick="location.href='${contextPath }/mypageBoard/myDibsBoard'" class="but_1">
            <!-- 0616_최윤희 : 게시글 버튼 추가 -->
            <c:if test="${dto.userSelect == 'host'}">
            	<input type="button" value="내가 작성한 게시글" onclick="location.href='${contextPath }/mypageBoard/write/mypageBoardProgramWriteList'" class="but_1">
            </c:if>
            <c:if test="${dto.userSelect == 'member'}">
            	<input type="button" value="내가 작성한 게시글" onclick="location.href='${contextPath }/mypageBoard/write/mypageBoardWriteList'" class="but_1">
            </c:if>
            <!-- 0616_최윤희 끝 -->
            <!-- ================ 박성수 : 내가 결제한 프로그램 목록  -->
            <input type="button" value="내가 결제한 프로그램" onclick="location.href='${contextPath }/mypageBoard/write/paidProgramInfoList'" class="but_1">
            <!-- 0614_최윤희 끝 -->
            <input type="button" value="문의" onclick="location.href='${contextPath }/board/member_qna'" class="but_1">
            <input type="button" value="회원 탈퇴" onclick="location.href='member_leave'" class="but_1">
         </div>
      </form>
      </div>
   </section>
   
   <c:import url="../default/footer.jsp"/>
   
</body>
</html>