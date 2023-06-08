/**
 * 
 */
 
 // 공지사항 게시글 수정하기
 function noticeBoardModifyFormCheck(){
	if(document.noticeBoardModifyForm.title.value == ""){
		alert("제목을 입력해주세요");
		document.noticeBoardModifyForm.title.focus();
	}
	else if(document.noticeBoardModifyForm.content.value == ""){
		alert("내용을 입력해주세요");
		document.noticeBoardModifyForm.content.focus();
	}
	else {
		document.noticeBoardModifyForm.submit();
	}
 }
 
 
  // 공지사항 게시글 작성
 function noticeBoardWriteFormCheck(){
	if(document.noticeBoardWriteForm.title.value == ""){
		alert("제목을 입력해주세요");
		document.noticeBoardWriteForm.title.focus();
	}
	else if(document.noticeBoardWriteForm.content.value == ""){
		alert("내용을 입력해주세요");
		document.noticeBoardWriteForm.content.focus();
	}
	else {
		document.noticeBoardWriteForm.submit();
	}
 }
 
 
 