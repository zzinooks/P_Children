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
		<input type="text" id="id" name="id" placeholder="영문, 숫자 4~14"><br>
		<br>
		<label>비밀번호</label><br>
		<input type="text" id="pwd" name="pwd" placeholder="영문, 숫자, 특수문자 조합 최소 8자"><br>
		<br> 
		<input type="text" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 재확인"><br>
		<br>
		<label>닉네임</label><br> 
		<input type="text" id="nickName" name="nickName" placeholder="띄어쓰기와 특수문자를 제외, 2~14자"><br>
		<br>
		<label>휴대폰 번호</label><br> 
		<input type="text" id="phone" name="phone" placeholder="숫자만 입력해 주세요."><br>
		<br>
		<label>이메일</label><br> 
		<input type="text" id="email" name="email" placeholder="ex) abcd123@naver.com"><br>
		<br>
		<label>주소</label><br> 
		<input type="text" id="addr" name="addr" ><br>
		<br>
		<input type="submit" value="가입하기">    
	</form>
</body>
</html>