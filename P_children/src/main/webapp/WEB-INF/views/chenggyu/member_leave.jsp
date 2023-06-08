
<!-- member_leave -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_leave</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
function leave(){
	var pwd = $('#pwd').val();
	console.log(pwd);
	if( pwd != ${dto.pwd} ){
		alert("비밀번호를 확인해주세요");
	} else {
	$.ajax({
		url: "member_leave_save",
		type: "POST",
		data : $("#leave_form").serialize(),
		success: function(data){
			$("#count").text(data)
			console.log("성공");
			 window.location.href = "${contextPath }/root/index" ;
		},
		error: function(){
			console.log("실패");
		}
		
	})
	}
}
</script>
</head>
<body>

	<div align="center">

		<br>
		<h1>회원 탈퇴</h1>
		<br>
		<form id="leave_form" action="${contextPath }/member/member_leave_save">
		<table>
			<tr>
				<th>아이디  <input type="text" name="id" value="${dto.id }" readonly="readonly"></th>
			</tr>
			<tr>
				<th>비밀번호 <input type="text"  id="pwd" name="pwd"> </th>
			</tr>
		</table>
			<br><br>
			<input type="button" value="확인" onclick="leave()">
		</form>

		<br><br> 
		<a href="/root/member/member_information ">개인 정보</a>

	</div>


</body>
</html>