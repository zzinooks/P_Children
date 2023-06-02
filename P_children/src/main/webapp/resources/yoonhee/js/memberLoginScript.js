/**
 * 
 */
 
 
 /* 로그인 form 확인 */

function checkLogin() {
	console.log('aaa');
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


// 비밀번호 찾고 비밀번호 수정 입력 체크
function userRePwdCheck(){
	if(document.findUserPwdResult.newPwd.value == ""){
		alert("새 비밀번호를 입력하세요");
		document.findUserPwdResult.newPwd.focus();
	} 
	else if(document.findUserPwdResult.newRePwd.value == "") {
		alert("새 비밀번호 확인을 입력하세요");
		document.findUserPwdResult.newRePwd.focus();
	}
	else if(document.findUserPwdResult.newPwd.value != document.findUserPwdResult.newRePwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.findUserPwdResult.newRePwd.focus();
	}
	else {
		document.findUserPwdResult.submit();
	}
}



// 체크박스

function rememberCheckId(){
	const checkbox = document.getElementById('checkbox');
	
	const testChek = document.getElementById('testChek');
	if(checkbox.checked){
		testChek.value = "true"; 
	} else {
		testChek.value = "false";
	}
	
	console.log(testChek.value);
}








