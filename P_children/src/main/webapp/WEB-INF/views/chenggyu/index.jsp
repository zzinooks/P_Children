
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
.sub-section-main{
	margin-left: -200px;
}
</style>
<script type="text/javascript">
var slideIndex = 0;

window.onload = function(){
   showSlides();
}

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
   
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    slides[slideIndex - 1].style.display = "block";

    setTimeout(showSlides, 4000); // 2초마다 이미지가 체인지됩니다
}
</script>
<style type="text/css">
.Slidesbackground {
    margin: 0;
    padding: 0;

}
.slideshow-image{
    border-radius:3%;
    width: 100%;
    height: 100%;
    overflow: hidden;
}
.mySlides {
    border-radius:3%;
    width: 550px;
    height: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0px 15px 15px rgba(0, 0, 0, 0.5);
}

.slideshow-container {
    display: flex;
    justify-content: center;
    position: relative;
    margin: auto;
}

.fade {
    animation-name: fade;
    animation-duration: 1.5s;
}

@keyframes fade {
    from {
        opacity: .4
    }
    to {
        opacity: 1
    }
}
</style>
</head>
<body>
   
   <c:import url="../default/header.jsp"/>
   
   <div class="section_main">
    <div class="section section1">
    <div class="sub-section">
      <div>
         <span class="slideshow-container">
            <div class="Slidesbackground">
                <div class="mySlides fade">
                <img src="https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2369&q=80" class="slideshow-image">
                </div>
                <div class="mySlides fade">
                    <img src="https://images.unsplash.com/photo-1581888227599-779811939961?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2148&q=80" class="slideshow-image">
                </div>
                <div class="mySlides fade">
                    <img src="https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80" class="slideshow-image">
                </div>
                <div class="mySlides fade">
                    <img src="https://images.unsplash.com/photo-1527526029430-319f10814151?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80" class="slideshow-image">
                </div>
                <div class="mySlides fade">
                    <img src="https://images.unsplash.com/photo-1600077029182-92ac8906f9a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80" class="slideshow-image">
                </div>
                <div class="mySlides fade">
                    <img src=https://cdn.cnn.com/cnnnext/dam/assets/201030094143-stock-rhodesian-ridgeback-super-tease.jpg" class="slideshow-image">
                </div>
            </div>
          </span>
      </div>    
    </div>
      <div class="sub-section-main">
         <a>${loginUser } 환영합니다<br>
         반려 메이트를 키우는 것은 어려운 시작입니다.<br>
         메이트 위드는 반려 메이트와 함께하는 행복을 많은 사람들에게 전달하는 플랫폼입니다. <br>
         내가 사는 곳 근처에서, 호스트 분들의 반려 메이트와 함께하는 여러 프로그램에 참여해 보세요.<br>
         - 반려 메이트에 관심이 있는데 어떻게 시작할지 몰랐던 분들!<br>
         - 반려 메이트를 키우기 전에 경험을 해보고 싶으신 분들!<br>
         - 반려 메이트에 대한 여러가지 정보를 알고 싶은 분들!<br>
         그 어려움을 Mate With 가 함께 나누겠습니다.</a>
     </div>
    </div>
    <br>
    <div class="section section2">
      <div class="sub-section">
     		<a>뿌지등한 몸을 반려 메이트의 넘치는 에너지로 풀어보세요.</a>
      		<img src="${contextPath }/resources/chenggyu/mate_with_1.jpg" width="500px" height="250px">
      	</div>
    </div>
    <div class="section section3">
      <div class="sub-section">
      	<img src="${contextPath }/resources/chenggyu/mate_with_2.jpg" width="500px" height="250px">
       	<a>반려 메이트에게 좋은 것만 먹이고 싶은 마음을 알아보며 <br> 반려 동물 건강 상식도 배워봐요.</a>     	
      </div>
    </div>
    <div class="section section4">
      <div class="sub-section">
      		<a>나른하고 행복한 반려 메이트의 표정이 궁금하신가요? <br> 우리도 좋아하는 마사지를 직접 배워봐요.</a>      
      		<img src="${contextPath }/resources/chenggyu/mate_with_3.jpg" width="500px" height="250px">
      </div>
    </div>
    <div class="section section5">
      <div class="sub-section">    
      	<img src="${contextPath }/resources/chenggyu/mate_with_4.jpg" width="500px" height="250px">
      	<a>집에서 간단히 할 수 있는 반려 메이트 관리 꿀팁도 알 수 있어요</a>        	
      </div>
    </div>
    <div class="section section6">
      <div class="sub-section">
      	<a>반려 메이트와 나의 순간을 특별하게 기억할 수도 있어요.</a>      
      	<img src="${contextPath }/resources/chenggyu/mate_with_5.jpg" width="500px" height="250px">
      </div>
    </div>   
    <div class="section section7">
    	<a>모든 반려 메이트들을 사랑하는 분들 모두! <br>지금바로 여러가지의 프로그램에 참여해보세요 <br> Mate With Us!</a>
    </div>
</div>
	
   <c:import url="../default/footer.jsp"/>
   
</body>
</html>