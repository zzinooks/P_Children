<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email 인증 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
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
	
	function sendEmail(){
		let email = $("#input_email").val();
		
		$.ajax({
			url: "sendEmail",
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
	
	function CheckCode(){
		let code = $("#input_code").val();
		let check = $("#email_code").val();
		
		if(code === check && code != ""){
			alert("인증 성공! 회원가입 페이지로 이동합니다.");
			$("#emailCheckForm").submit();
		} else {
			$("#result").html("&nbsp; 인증코드 불일치");
			$("#input_code").focus();
		}
	}
	
	
</script>
</head>
<body>
	<form action="${path }/member/registForm" method="get" id="emailCheckForm" >
		이메일 : <input type="email" id="input_email" name="email">
		<input type="button" value="인증코드 보내기" onclick="sendEmail()" >
		<br>
		<span id="email_"></span>
		<br><br>
		인증코드 : <input type="text" id="input_code" name="code" placeholder="받은 메일의 인증코드 입력."> &nbsp;
		<input type="button" value="확인" onclick="CheckCode()">
		<span id="result"></span>
		<input type="hidden" id="email_code" >
	</form>
</body>
</html>
































