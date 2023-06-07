
<!-- member_modify -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_modify</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/chenggyu/js/memberScript.js?v=2"></script>
<script type="text/javascript">
function modify(){
	$.ajax({
		url: "modify_save",
		type: "POST",
		data : $("#mod_form").serialize(),
		success: function(data){
			$("#count").text(data)
			console.log("성공");
			let url = 'member_information'
			location.replace(url);
		},
		error: function(){
			console.log("실패");
		}
		
	})
}
</script>
</head>
<body>

	<div align="center">
		<br>
		<h1>개인정보 수정</h1>
		<br>
		<form id="mod_form" action="${contextPath }/member/modify_save"  method="post">
					<a>아이디</a>
					<p><input type="text" name="id" value="${dto.id }" readonly="readonly"></p>
					<a>비밀번호</a>
					<p><input type="password" name="pwd" value="${dto.pwd }" readonly="readonly"></p>
					<a>비밀번호 확인</a>
					<p><input type="text" name="ck_pwd" ></p>
					<a>새로운 비밀번호 </a>
					<p><input type="text" name="re_pwd"  ></p>
					<a>새로운 비밀번호 확인</a>
					<p><input type="text" name="re_pwd_ck"  ></p>
					<a>닉네임</a>
					<p><input type="text" name="nickname" value="${dto.nickname }" ></p>
					<a>이메일</a>
					<p><input type="text" name="email" value="${dto.email }" readonly="readonly"></p>
					<a>핸드폰</a>
					<p><input type="text" name="phone" value="${dto.phone }" ></p>
					<a>주소</a>
					<p><input type="text" name="addr" value="${dto.addr }" ></p>
			<br><br>
			<input type="button" value="수정" onclick="modify()"> &nbsp;
			<input type="reset"value="다시 작성">
		</form>
		
		<br><br>
		<a href="/root/member/member_information ">개인 정보</a>

	</div>


</body>
</html>