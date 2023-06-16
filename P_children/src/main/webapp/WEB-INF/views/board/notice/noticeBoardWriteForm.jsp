<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="${contextPath }/resources/yoonhee/js/noticeBoardScript.js?v=1"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With 공지사항 작성</title>
<script type="text/javascript">
	function readURL(input){
		var file = input.files[0]; // 파일 정보
		if(file != ""){
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어오기
			reader.onload = function(e){ // 읽기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result)
			}
			
		}
	}
</script>
<style type="text/css">
h1 {
	text-align: center;
}

.write_form {
	width: 500px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<%-- <c:import url="../../default/header.jsp"/> --%>
	<h1>공지사항 게시글 작성</h1>
	<br><br>
	<div class="wrap write_form">
		<div class="write_save">
		<form name="noticeBoardWriteForm" action="${contextPath }/board/notice/noticeBoardWriteSave" enctype="multipart/form-data" method="post">
			<!-- <b> 작성자 </b><br> --> 
			<input type="hidden" name="id" value="${user }" readonly><br> <!-- 보통 작성시 작성자 표시안되어서 작성자 숨김 -->
			<b> 구 분 </b><br>
			<select name="category" id="notice_category">
				<option value="" selected> -- 선택 -- </option>
				<option value="noticeGeneral">일반</option>
				<option value="noticeEvent">이벤트</option>
				<option value="noticeProduct">상품</option>
				<option value="noticeDeliveryDelay">배송지연</option>
			</select><br><br>
			<b> 제 목 </b><br>
			<input type="text" name="title"><br>
			<b> 내 용 </b><br>
			<textarea name="content" rows="10" cols="50"></textarea><br>
			<h3> 파일 첨부 </h3>
			<input type="file" name="file" onchange="readURL(this)"/>
			<img src="#" id="preview" width="100px" height="100px"><br>
			<br>
			<input type="button" onclick="noticeBoardWriteFormCheck()" value="완료"> &nbsp;
			<input type="button" value="글목록" onclick="location.href='${contextPath}/board/notice/noticeBoardAllList'"/>
		</form>
		</div>
	</div>
	<%-- <c:import url="../../default/footer.jsp"/> --%>
</body>
</html>