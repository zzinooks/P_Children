<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${path }/resources/sungsu/js/memberRegistForm.js"></script>
<script>
$(function(){
	$("#pwdCheck").keyup(function(){
		let check = $("#pwdCheck").val();
		let pwd = $("#pwd").val();
		
		if(check == pwd) {
			$("#pwdCheck_").text("비밀번호가 일치합니다.");
			$("#pwdCheck_").css("color", "white");
		} else {
			$("#pwdCheck_").text("비밀번호가 일치하지 않습니다.");
			$("#pwdCheck_").css("color", "white");
		}
		
	});
});

</script>
</head>
<body>
	<form action="${path }/member/regist" name="form" method="POST">
		<label>아이디</label><br>
		<input type="text" id="userid" name="id" onkeyup="idCheck()" placeholder="영문, 숫자 4~14" maxlength="14">
		<span id="id_"></span>
		<br><br>
		<label>비밀번호</label><br>
		<input type="text" id="pwd" name="pwd" placeholder="영문, 숫자, 특수문자 조합 최소 8자">
		<span id="pwd_"></span>
		<br><br>
		<input type="text" id="pwdCheck" placeholder="비밀번호 재확인" >
		<span id="pwdCheck_"></span>
		<br><br>
		<label>닉네임</label><br> 
		<input type="text" id="nickname" name="nickname" placeholder="띄어쓰기와 특수문자를 제외, 2~14자">
		<span id="nickname_"></span>
		<br><br>
		<label>휴대폰 번호</label><br> 
		<input type="text" id="phone" name="phone" placeholder="숫자만 입력해 주세요.">
		<span id="phone_"></span>
		<br><br>
		<label>이메일</label><br> 
		<input type="text" id="email" name="email" placeholder="ex) abcd123@naver.com">
		<span id="email_"></span>
		<br><br>
		<label>주소</label><br> 
		<input type="text" id="addr" name="addr" >
		<span id="addr_"></span>
		<br><br>
		<input type="button" value="가입하기" onclick="valueCheck()">    
	</form>
</body>
</html>
































