<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>     
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/yoonhee/js/memberLoginScript.js?v=1"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I Run it : 비밀번호 찾기 결과</title>
<script type="text/javascript">

	// 비밀번호 변경 알림창 -> 인덱스 페이지로
	function userUpdatePwd(){
		let id = $("#id").val();
		let newPwd = $("#newPwd").val();
		console.log(id);
		console.log(newPwd);
		
		if(!id == "" && !newPwd == ""){
			$.ajax({
				url: "userUpdatePwd",
				type: "post",
				data: {"id" : id, "newPwd" : newPwd},
				success: function(code){
					location.href='/root/index';
					alert("비밀번호가 변경되었습니다.");
				},
				error: function(){
					alert("비밀번호 변경이 실패되었습니다.");
				}	
			});
		}
		
	}
	
</script>
</head>
<body>
	<h3>비밀번호 재설정</h3>
	<c:if test="${findUserPwd != null }">
		<p>I Run it 아이디 : ${findUserPwd.id }</p>
		<form name="findUserPwdResult" id="pwddd" action="${contextPath }/member/userUpdatePwd" method="post">
			<input type="hidden" id="id" name="id" value="${findUserPwd.id }"> <!-- 아이디 저장 -->
			<input type="hidden" id="pwd" name="pwd" value="${findUserPwd.pwd }"> <!-- 아이디에서 찾은 현재 비밀번호 저장 -->
			<%-- <input type="hidden" name="userSelect" value="${userSelect }"> --%>
			<input type="password" id="newPwd" name="newPwd" placeholder="새 비밀번호 입력"><br>
			<input type="hidden" id="newPwd_value">
			<br>
			<input type="password" id="newRePwd" name="newRePwd" placeholder="새 비밀번호 확인"><br>
			<br>
			<input type="button" onclick="userUpdatePwdCheck()" value="확인"> <!-- .js 파일에 있는 함수 실행되면 submit 되면서 .ajax 실행 -->
		</form>
	</c:if>
	<c:if test="${findUserPwd == null }">
		<p>회원 정보가 없습니다.</p>
	</c:if>
	
	<a href="${contextPath }/member/memberLoginForm">로그인하기</a>
	<a href="${contextPath }/member/findUserPwdForm">비밀번호 찾기</a>
	<a href="${contextPath }/index">메인</a>
</body>
</html>