<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<form action="${contextPath }/memberRegist" id="frm">
		<label>아이디</label><br>
		<input type="text" id="" name="id" placeholder="영문, 숫자 4~14"><br>
		<br> 
		비밀번호 <input type="text" id="" name="pwd" placeholder="영문, 숫자, 특수문자 조합 최소 8자"><br>
		<br> 
		<input type="text" id="" name="pwdCheck" placeholder="비밀번호 재확인"><br>
		<br> 
		닉네임 <input type="text" id="" name="nickName" placeholder="띄어쓰기와 특수문자를 제외, 2~14자"><br>
		<br> 
		휴대폰 번호 <input type="text" id="" name="phone" placeholder="숫자만 입력해 주세요."><br>
		<br> 
		이메일 <input type="text" id="" name="email" placeholder="ex) abcd123@naver.com"><br>
		<br> 
		주소 <input type="text" id="" name="addr" ><br>
		<br>
		<input type="submit" value="가입하기">    
	</form>
</body>
</html>