<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path }/resources/sungsu/js/hostRegistForm.js?v=1"></script>
<script>
</script>
</head>
<body>
	<form action="${path }/member/regist_host" name="form" method="POST">
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
		<input type="text" id="nickname" name="nickname" oninput="deleteSpan_nickname()" placeholder="띄어쓰기와 특수문자를 제외, 2~14자" >
		<span id="nickname_"></span>
		<br><br>
		<label>휴대폰 번호</label><br> 
		<input type="text" id="phone" name="phone" oninput="deleteSpan_phone()" placeholder="숫자만 입력해 주세요.">
		<span id="phone_"></span>
		<br><br>
		<label>이메일</label><br> 
		<input type="text" id="email" name="email" value="${checkedEmail}" readonly="readonly">
		<span id="email_"></span>
		<br><br>
		<label>주소</label><br>
		<input type="text" id="zonecode" size="5" placeholder="우편번호" > &nbsp; <button type="button" onclick="findAddr()">우편번호 찾기</button><br>
		<input type="text" id="addr1" size="30" placeholder="주소" ><br>
		<input type="text" id="addr2" placeholder="상세주소" oninput="deleteSpan_addr2()"><br>
		<input type="text" id="addr3" size="15" placeholder="참고항목" ><br>
		<span id="addr_"></span>
		<br><br>
		<label>메이트 이름</label><br> 
		<input type="text" id="mateName" name="mateName" oninput="deleteSpan_mateName()" placeholder="띄어쓰기와 특수문자를 제외, 2~14자">
		<span id="mateName_"></span>
		<br><br>
		<label>메이트 소울(Breeding)</label><br> 
		<input type="text" id="mateBreed" name="mateBreed" oninput="deleteSpan_mateBreed()" placeholder="띄어쓰기와 특수문자를 제외, 2~14자">
		<span id="mateBreed_"></span>
		<br><br>
		<input type="button" value="가입하기" onclick="valueCheck()">    
	</form>
</body>
</html>
































