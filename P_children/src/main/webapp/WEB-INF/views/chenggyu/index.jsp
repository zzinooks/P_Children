
<!-- index -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/index.css?v=2" rel="stylesheet" type="text/css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style type="text/css">
img{
	float: left;
	border-radius: 20px;
}
.sub-section a{
	margin-left: 150px;
	margin-right: 150px;
}
</style>
</head>
<body>
   
   <c:import url="../default/header.jsp"/>
   
   <div class="section_main">
    <div class="section section1">
      <div class="sub-section">
      		<img src="${contextPath }/resources/chenggyu/mate_with_1.jpg" width="500px" height="250px">
      		<a>뿌지등한 몸을 반려 메이트의 넘치는 에너지로 풀어보세요.</a>
      	</div>
    </div>
    <div class="section section2">
      <div class="sub-section">
      	<a>구반려 메이트에게 좋은 것만 먹이고 싶은 마음을 알아보며 <br> 반려 동물 건강 상식도 배워봐요.</a>
      	<img src="${contextPath }/resources/chenggyu/mate_with_2.jpg" width="500px" height="250px">
      	
      </div>
    </div>
    <div class="section section3">
      <div class="sub-section">
      		<img src="${contextPath }/resources/chenggyu/mate_with_3.jpg" width="500px" height="250px">
      		<a>나른하고 행복한 반려 메이트의 표정이 궁금하신가요? <br> 우리도 좋아하는 마사지를 직접 배워봐요.</a>
      </div>
    </div>
    <div class="section section4">
      <div class="sub-section">
      	<a>집에서 간단히 할 수 있는 반려 메이트 관리 꿀팁도 알 수 있어요</a>      
      	<img src="${contextPath }/resources/chenggyu/mate_with_4.jpg" width="500px" height="250px">
      </div>
    </div>
    <div class="section section5">
      <div class="sub-section">
      	<img src="${contextPath }/resources/chenggyu/mate_with_5.jpg" width="500px" height="250px">
      	<a>반려 메이트와 나의 순간을 특별하게 기억할 수도 있어요.</a>
      </div>
    </div>
    <div class="section section6">
    	<a>지금바로 여러가지의 프로그램에 참여해보세요 <br> Mate With Us!</a>
    </div>
</div>
	
   <c:import url="../default/footer.jsp"/>
   
</body>
</html>