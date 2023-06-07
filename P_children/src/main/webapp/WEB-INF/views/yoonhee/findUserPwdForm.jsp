<!-- findUserPwdForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I Run it : 비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/yoonhee/js/memberLoginScript.js?v=2"></script>
<script>
	//이메일 중복체크
	$(function(){
		$("#input_email").keyup(function(){
			let email = $("#input_email").val();
			
			$.ajax({
				url: "checkEmail",
				type: "get",
				data: {"email" : email},
				success: function(data){
					if(data === "OK"){
						$("#email_").text("사용가능한 이메일 입니다.");
					} else {
						$("#email_").text("중복된 이메일 입니다.");
					}
				},
				error: function(){
					alert("Error");
				}
			});
		});
	});  
	
	// 인증코드 전송
	function sendEmail(){
		let email = $("#input_email").val();
		
		$.ajax({
			url: "sendFindPwdEmailCode",
			type: "get",
			data: {"email" : email},
			success: function(code){
				alert("인증코드가 전송되었습니다. 입력한 메일주소를 확인해 주세요." );
				$("#email_code").val(code);
			},
			error: function(){
				alert("Error");
			}	
		});
	}
	
	// 인증코드 체크
	function CheckCode(){
		let code = $("#input_code").val();
		let check = $("#email_code").val();
		
		if(code === check && code != ""){
			$("#result").text("인증 성공");
		} else {
			$("#result").text("인증 실패");
			$("#input_code").focus();
		}
	}
	
	
</script>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form name="findUserPwdForm" action="${contextPath}/member/findUserPwd" method="post">
		<input type="radio" name="userSelect" value="member" id="member" checked><label for="member">일반</label>
		<input type="radio" name="userSelect" value="host" id="host"><label for="host">호스트</label>
		<br>
		<input type="text" name="findUserId" placeholder="아이디 입력"><br>
		<br>
		
		<!-- 이메일 인증 코드 -->
		<input type="email" id="input_email" name="email" placeholder="이메일 입력">
		<input type="button" value="인증코드 보내기" onclick="sendEmail()" >
		<br>
		<span id="email_"></span>
		<br><br>
		
		인증코드 : <input type="text" id="input_code" name="code" placeholder="받은 메일의 인증코드 입력."> &nbsp;
		<input type="button" value="확인" onclick="CheckCode()"><br>
		<span id="result"></span>
		<input type="hidden" id="email_code" ><br>
		
		<input type="button" value="비밀번호 찾기" onclick="findUserPwdCheck()">
	</form>
	
		
		
	<%-- <h1>비밀번호 찾기</h1>
	<form name="findUserPwdForm" action="${contextPath}/member/findUserPwd" method="post">
		<input type="radio" name="userSelect" value="member" id="member" checked><label for="member">일반</label>
		<input type="radio" name="userSelect" value="host" id="host"><label for="host">호스트</label>
		<br>
		<input type="text" name="findUserId" placeholder="아이디"><br>
		<br>
		<input type="text" name="findUserEmail" placeholder="이메일"><br>
		<br>
		<input type="button" value="비밀번호 찾기" onclick="findUserPwdCheck()">
	</form> --%>
</body>
</html>






