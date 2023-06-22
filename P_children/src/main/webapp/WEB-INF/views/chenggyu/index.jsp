
<!-- index -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mate With</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/index.css?v=5" rel="stylesheet" type="text/css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
   
   <c:import url="../default/header.jsp"/>
   
<body>
  <div class="blog-card">  
    <input type="radio" name="select" id="tap-0" checked />
    <input type="radio" name="select" id="tap-1"/>
    <input type="radio" name="select" id="tap-2" />
    <input type="radio" name="select" id="tap-3" />
    <input type="radio" name="select" id="tap-4" />
    <input type="radio" name="select" id="tap-5" />
    <input type="checkbox" id="imgTap" />
    <div class="sliders">
      <label for="tap-0" class="tap tap-0"></label>
      <label for="tap-1" class="tap tap-1"></label>
      <label for="tap-2" class="tap tap-2"></label>
      <label for="tap-3" class="tap tap-3"></label>
      <label for="tap-4" class="tap tap-4"></label>
      <label for="tap-5" class="tap tap-5"></label>
    </div>
   <div class="inner-part">
      <label for="imgTap" class="img">
        <img class="img-0"
          src="${contextPath }/resources/chenggyu/2021051001099_0.jpg" />
      </label>
      <div class="content content-0">
        <span>${loginUser } 환영합니다</span>
        <div class="title">메이트 위드는 반려 메이트와 함께하는 행복을 많은 사람들에게 전달하는 플랫폼입니다.</div>
        <div class="text">
         내가 사는 곳 근처에서, 호스트 분들의 반려 메이트와 함께하는 여러 프로그램에 참여해 보세요.
        </div>
        <button onclick="location.href='${contextPath }/programBoard/programBoardAllList'">바로가기</button>
      </div>
    </div>    
    <div class="inner-part">
      <label for="imgTap" class="img">
        <img class="img-1"
          src="${contextPath }/resources/chenggyu/mate_with_1.jpg" />
      </label>
      <div class="content content-1">
        <span>메이트와 산책</span>
        <div class="title">지루한 이상에서 벗어나 <br> 반려 메이트와 함께 넘치는 에너지로 풀어보세요</div>
        <div class="text">
        </div>
      </div>
    </div>
    <div class="inner-part">
      <label for="imgTap" class="img">
        <img class="img-2"
          src="${contextPath }/resources/chenggyu/mate_with_2.jpg" />
      </label>
      <div class="content content-2">
        <span>메이트 간식 만들기</span>
        <div class="title">반려 메이트에게 좋은 것만 먹이고 싶은 마음을 알아보며 반려 동물 건강 상식도 배워봐요.</div>
        <div class="text">
        </div>
      </div>
    </div>
    <div class="inner-part">
      <label for="imgTap" class="img">
         <img class="img-3"
          src="${contextPath }/resources/chenggyu/14891601649427.jpg" />
      </label>
      <div class="content content-3">
        <span>메이트 마사지</span>
        <div class="title">나른하고 행복한 반려 메이트의 표정이 궁금하신가요? <br>우리도 좋아하는 마사지를 직접 배워봐요.</div>
        <div class="text">
        </div>
      </div>
    </div>
    <div class="inner-part">
      <label for="imgTap" class="img">
        <img class="img-4"
          src="${contextPath }/resources/chenggyu/mate_with_4.jpg" />
      </label>
      <div class="content content-4">
        <span>메이트 미용</span>
        <div class="title">나의 반려의 나의 스타일로 <br>집에서 간단히 할 수 있는 반려 메이트 관리 팁도 알 수 있어요.</div>
        <div class="text">
        </div>
      </div>
    </div>
    <div class="inner-part">
      <label for="imgTap" class="img">
        <img class="img-5"
          src="${contextPath }/resources/chenggyu/12345.jpg" />
      </label>
      <div class="content content-5">
        <span>메이트와 드로잉</span>
        <div class="title">반려 메이트와 특별 순간을 기억할 수도 있어요.</div>
        <div class="text">
        </div>
      </div>
    </div>    
  </div>
   
</body>
</html>