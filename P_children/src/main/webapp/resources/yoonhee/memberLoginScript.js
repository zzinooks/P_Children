/**
 * 
 */
 
 
 /* 로그인 form 확인 */

function checkLogin() {

	if(document.memberLoginForm.id.value == ""){
		alert("아이디를 입력해주세요");
		document.memberLoginForm.id.focus();
	}
	else if(document.memberLoginForm.pwd.value == ""){
		alert("비밀번호를 입력해주세요");
		document.memberLoginForm.pwd.focus();
	}
	else {
		document.memberLoginForm.submit();
	}
	
}


// 아이디 찾기

function findUserIdCheck(){
	if(document.findUserIdForm.findUserEmail.value == ""){
		alert("이메일을 입력해주세요");
		document.findUserIdForm.findUserEmail.focus();
	} 
	else if(document.findUserIdForm.findUserPhone.value == "") {
		alert("휴대폰 번호를 입력해주세요");
		document.findUserIdForm.findUserPhone.focus();
	}
	else {
		document.findUserIdForm.submit();
	}
}


// 비밀번호 찾기

function findUserPwdCheck() {

	if(document.findUserPwdForm.findUserId.value == ""){
		alert("아이디를 입력해주세요");
		document.findUserPwdForm.findUserId.focus();
	} 
	else if(document.findUserPwdForm.findUserEmail.value == "") {
		alert("이메일을 입력해주세요");
		document.findUserPwdForm.findUserEmail.focus();
	}
	else {
		document.findUserPwdForm.submit();
	}
}






