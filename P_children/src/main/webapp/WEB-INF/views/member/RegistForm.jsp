<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="${pageContext.request.contextPath}/resources/chenggyu/regist.css?v=1" rel="stylesheet" type="text/css">
<script src="${path }/resources/sungsu/js/memberRegistForm.js?v=2"></script>
<script>	
	window.onload = function(){
		if(${cookie.userSelect.value == "host"}){
			$("#divHost").css("display", "");
			
			function deleteSpan_mateName(){
				$("#mateName_").empty();
			}
			
			function deleteSpan_mateBreed(){
				$("#mateBreed_").empty();
			}
		}
		
	}
	
	// form 값 들어왔는지 확인.
function valueCheck() {
		let id = document.querySelector("span#id_");
		let pwd = document.querySelector("span#pwd_");
		let pwdCheck = document.querySelector("span#pwdCheck_");
		let nickname = document.querySelector("span#nickname_");
		let phone = document.querySelector("span#phone_");
		let email = document.querySelector("span#email_");
		let addr = document.querySelector("span#addr_");
		let mateName = document.querySelector("span#mateName_");
		let mateBreed = document.querySelector("span#mateBreed_");
		
		if(document.form.userid.value == ""){
			id.style.color = "red";
			id.innerHTML = "아이디를 입력해 주세요.";
			document.form.userid.focus();
		}
		else if(document.form.pwd.value == ""){
			pwd.style.color = "red";
			pwd.innerHTML = "비밀번호를 입력해 주세요.";
			document.form.pwd.focus();
		}
		else if(document.form.pwdCheck.value == ""){
			pwdCheck.style.color = "red";
			pwdCheck.innerHTML = "비밀번호를 확인해 주세요.";
			document.form.pwdCheck.focus();
		}
		else if(document.form.nickname.value == ""){
			nickname.style.color = "red";
			nickname.innerHTML = "닉네임을 입력해 주세요.";
			document.form.nickname.focus();
		}
		else if(document.form.phone.value == ""){
			phone.style.color = "red";
			phone.innerHTML = "전화번호를 입력해 주세요.";
			document.form.phone.focus();
		}
		else if(document.form.email.value == ""){
			email.style.color = "red";
			email.innerHTML = "이메일을 입력해 주세요.";
			document.form.email.focus();
		}
		else if(document.form.addr2.value == ""){
			addr.style.color = "red";
			addr.innerHTML = "상세주소를 입력해 주세요. 없으면 '없음'을 입력해 주세요.";
			document.form.addr2.focus();
		}
		else if(${cookie.userSelect.value == "host"}){
			if(document.form.mateName.value == ""){
				mateName.style.color = "red";
				mateName.innerHTML = "메이트 이름을 입력해 주세요.";
				document.form.mateName.focus();
			}
			else if(document.form.mateBreed.value == ""){
				mateBreed.style.color = "red";
				mateBreed.innerHTML = "메이트 이름을 입력해 주세요.";
				document.form.mateBreed.focus();
			}
			else {
				document.form.submit();
			}
		}
		else {
			document.form.submit();
		}
		
	}	
	
</script>
</head>
<body>

	<c:import url="../default/header.jsp"/>

	<section><!-- body -->
		<div class="form-box"> <!--  container  -->
		<div class="title">회원 가입</div>
		<form action="${path }/member/registMember" name="form" method="POST">
			<div class="user-details">
				<div class="input-box">
					<span class="details">아이디</span>
					<input type="text" id="userid" name="id" onkeyup="idCheck(event)" placeholder="영문, 숫자 4~14" maxlength="14">	
					<span id="id_"></span>
				</div>
				<div class="input-box">
					<span class="details">비밀번호</span>
					<input type="text" id="pwd" name="pwd" placeholder="영문, 숫자, 특수문자 조합">
					<span id="pwd_"></span>
				</div>
				<div class="input-box">
					<span class="details">비밀번호 확인</span>
					<input type="text" id="pwdCheck" placeholder="비밀번호 재확인" >
					<span id="pwdCheck_"></span>
				</div>
				<div class="input-box">
					<span class="details">닉네임</span>
					<input type="text" id="nickname" name="nickname" oninput="deleteSpan_nickname()" placeholder="띄어쓰기와 특수문자" >
				</div>
				<div class="input-box">
					<span class="details">휴대번호</span>
					<input type="text" id="phone" name="phone" oninput="deleteSpan_phone()" placeholder="숫자만 입력해 주세요.">
					<span id="phone_"></span>
				</div>
				<div class="input-box">
					<span class="details">이메일</span>
					<input type="text" id="email" name="email" value="${checkedEmail}" readonly="readonly">
					<span id="email_"></span>
				</div>
				<div class="input-box" >
					<span class="details">주소</span>
					<input type="text" id="zonecode" name="zonecode" size="5" placeholder="우편번호">
					<input type="text" id="addr1" name="addr1" size="30" placeholder="주소">
					<input type="text" id="addr2" name="addr2" placeholder="상세주소" oninput="deleteSpan_addr2()">
					<input type="text" id="addr3" name="addr3" size="15" placeholder="참고항목">
					<span id="addr_"></span>
				</div>
				<div class="input-box-addr">
					<input type="button" value="우편번호찾기" onclick="findAddr()">
				</div>
				<c:if test="${cookie.userSelect.value == 'host' }">
				<div class="input-box">
					<span class="details">메이트 정보</span>
					<input type="text" id="mateName" name="mateName" oninput="deleteSpan_mateName()" placeholder="메이트 이름">
					<input type="text" id="mateBreed" name="mateBreed" oninput="deleteSpan_mateBreed()" placeholder="메이트 견종">
				</div>
				</c:if>
			</div>
				<input type="hidden" id="userSelect" name="userSelect" value="${cookie.userSelect.value }">
				<input type="button" value="가입하기" onclick="valueCheck()" class="but_1">
		</form>
		</div>
	</section>
	
	<c:import url="../default/footer.jsp"/>
	
</body>
</html>
































