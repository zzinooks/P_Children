<!-- member/memberLoginForm -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P_children: 로그인</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/yoonhee/js/memberLoginScript.js?v=1"></script>
<link href="${pageContext.request.contextPath}/resources/chenggyu/login.css?v=2" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/index.css" rel="stylesheet" type="text/css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> 

<script>
$(document).ready(function(){
	var userInputId = document.cookie;
	var check = document.getElementById('checkbox');
	
	if(document.memberLoginForm.userCheckFalse.value == "id"){ // 아이디 체크 할 때 못찾아서 경고창 발생
		alert("아이디 또는 비밀번호가 틀렸습니다.");
	}
	
	// cookie 생성값 담기
	if(userInputId != ''){ // 쿠키가 ''이 아니면
		check.checked=true; // 성공
	}else{
		check.checked=false; // 실패
	}
});

function userSelect(){
	const select = document.memberLoginForm.userSelect.value;
	
	location.href = "${contextPath}/member/emailCheck?userSelect="+select;
	
	
}
</script>

</head>
<body>
	
	<c:import url="../default/header.jsp"/>
	
	<section>
		<div class="form-box">
			<form name="memberLoginForm" action="${contextPath}/member/userCheck" method="post" >
				<h2>Login</h2>
				<div class="inputbox">
					<div class="ion-icon">
					<i class='bx bx-user'></i>
					</div>
					<input type="text"  name="id" value="${cookie.CookieId.value }" required="required">
					<label for="">아이디</label>
				</div>
				<div class="inputbox">
					<div class="ion-icon">
					<i class='bx bx-lock-alt'></i>
					</div>
					<input type="password" name="pwd" required="required">
					<label for="">비밀번호</label>
				</div>
				<div class="forget">
					<label for="">
					<input type="checkbox" id="checkbox" name="check" onclick="rememberCheckId()">아이디 기억
					<input type="hidden" id="testChek" name="testChek">
					<input type="hidden" id="userCheckFalse" value=${userCheckFalse }>
					<a href="${contextPath }/member/findUserIdForm">아이디 찾기</a>
					<a href="${contextPath }/member/findUserPwdForm">비밀번호 찾기</a>
					</label>
				</div>
				<button value="로그인" onclick="checkLogin()">로그인</button>
				
				<!-- 박성수 _ 카카오 로그인 버튼 _ 시작 -->
				<c:import url="../sungsu/kakaoLogin.jsp"/>
				
				<div class="register">
					<p><a onclick="userSelect()">회원가입</a></p>
				</div>
				<div class="select">
				<input type="radio" name="userSelect" value="member"  checked><label for="member"><a>일반</a></label>
				<input type="radio" name="userSelect" value="host" ><label for="host"><a>호스트</a></label>
				</div>
			</form>
		</div>
	</section>

	<c:import url="../default/footer.jsp"/>
	
</body>
</html>


