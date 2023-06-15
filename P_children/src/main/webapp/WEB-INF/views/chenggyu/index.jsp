
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
<!-- ================================== 성수 시작 ================================== -->
<!--  -->
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

    setTimeout(showSlides, 2000); // 2초마다 이미지가 체인지됩니다
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
    width: 600px;
    height: 350px;
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
<!-- ================================== 성수 끝 ================================== -->
</head>
<body>
   
   <c:import url="../default/header.jsp"/>
   
   <section class="home-landing">
      <%-- <div class="image-section" >
         <img src="${pageContext.request.contextPath}/resources/chenggyu/pet_new.png" alt="">
      </div> --%>
      <!-- ================================== 성수 시작 ================================== -->
      
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
      
      <!-- ================================== 성수 끝 ================================== -->
      <div class="text-section">
         <h2>${loginUser } 환영합니다</h2>
         <h3>반려 메이트를 키우는 것은 어려운 시작입니다.</h3>
         <p>메이트 위드는 반려 메이트와 함께하는 행복을 많은 사람들에게 전달하는 플랫폼입니다. </p>
         <p>내가 사는 곳 근처에서, 호스트 분들의 반려 메이트와 함께하는 여러 프로그램에 참여해 보세요.</p>
         <p>- 반려 메이트에 관심이 있는데 어떻게 시작할지 몰랐던 분들!</p>
         <p>- 반려 메이트를 키우기 전에 경험을 해보고 싶으신 분들!</p>
         <p>- 반려 메이트에 대한 여러가지 정보를 알고 싶은 분들!</p>
         <p>그 어려움을 Mate With 가 함께 나누겠습니다.</p>
            <h3>모든 반려 메이트들을 사랑하는 분들 모두! Mate With Us!</h3>      
      <button class="btn" onclick="location.href='${contextPath }/programBoard/programBoardAllList'">바로 가기</button>
      <div class="social-media">
<!--             <a href="#"><i class='bx bxl-facebook-circle'></i></a>
            <a href="#"><i class='bx bxl-instagram' ></i></a>
            <a href="#"><i class='bx bxl-twitter' ></i></a>
            <a href="#"><i class='bx bxl-reddit' ></i></a> -->
         </div>
      </div>
         <ul class="main_ul">
            <li class="main_li"></li>
            <li class="main_li"></li>
         </ul >
   </section>
   
   <c:import url="../default/footer.jsp"/>
   
</body>
</html>