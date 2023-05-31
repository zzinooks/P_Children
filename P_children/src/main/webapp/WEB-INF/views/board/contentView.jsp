
<!-- board/contentView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/contentView.jsp</title>
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
	
	function deleteConfirm() {
		
		if(!confirm('삭제하시겠습니까?')){
			return false;
		} else {
			location.href='${contextPath }/board/delete?write_no=${dto.write_no }&file_name=${dto.file_name }';
		}
		
	}
	
	function slide_click() {
		$("#first").slideDown("slow");
		$("#modal_wrap").show();
	}
	
	function slide_hide() {
		$("#first").slideUp("fast");
		$("#modal_wrap").hide();
	}
	
	function rep() {
		let form = {}
		let arr = $("#frm").serializeArray();
		for( i = 0; i <arr.length ; i++) {
			form[arr[i].name] = arr[i].value
		}
		console.log(form);
		
		$.ajax({
			url: "addReply",
			type: "POST", 
			data: JSON.stringify(form),
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				if(data == 1)
					alert("답글 추가 성공~!")
					slide_hide();
					replyData();
			},
			error: function() {
				alert("Error !!")
			}
			
			
		})
		
	}
	
	function replyData() {
		$.ajax({
			url: "replyData/"+$("#write_no").val(), //val() = value
			type: "get",
			dataType: "json",
			success: function(rep) {
				let htm = ""
				let count = 0;
				rep.forEach(function(redata){
					let date = new Date(redata.write_date)
					let writeDate = date.getFullYear()+"년 " +(date.getMonth() + 1) + "월 "
					writeDate += date.getDate() + "일 " + date.getHours() + " 시 "
					writeDate += date.getMinutes() + "분 " + date.getSeconds() + "초"
					count += 1;
					
					htm += "<div align='left' id='rep" + count + "'><b>아이디 : </b>" + redata.id + "님 / ";
					htm += "<b>작성일 : </b>" + writeDate + "<br>"
					htm += "<b>제 목 : </b><div class='repTitle'>" + redata.title + "</div><br>"
					htm += "<b>내 용 : </b><div class='repContent'>" + redata.content + "</div><br>"
					
					if(redata.id == $("#user").val()) {
						htm += "<a href='${contextPath }/board/deleteReply?id="
								+redata.id +"&content=" + redata.content + "&title="+ redata.title
								+ "&write_no=" + redata.write_group + "'>[삭제]</a>"
								var modifyId = redata.id;
								var modifyTitle = redata.title;
								var modifyContent = redata.content;
						htm += "<a href='#' onclick='updateReply("+ count +")'>[수정]</a></div>"
					} else {
						htm += "</div>"
					}
							
				})
				$("#reply").html(htm)
			},
			error: function() {
				alert("답글 가져오기 실패 !!")
			}
		})
		
	}
	
	function updateReply(count){
		
		if($('#updateTitle').val() != null){
			replyData();
		}
		
		let replyView = ""
		replyView += "<div align='left'><form id='updateResultFrm' action='${contextPath }/board/updateReply'><b>아이디 : </b><input type='text' name='id' value='" + $("#user").val() + "' readonly><br>";
		replyView += "<b>제 목 : </b> <input type='text' id='updateTitle' name='updateTitle' size='30' value='" + $('#rep' + count).children('.repTitle').text() + "'><br>"
		replyView += "<input type='hidden'  name='write_no'  value='" + $('#write_no').val() + "'>"
		replyView += "<input type='hidden' id='beforeTitle' name='beforeTitle' value='" + $('#rep' + count).children('.repTitle').text() + "'>"
		replyView += "<input type='hidden' id='beforeContent' name='beforeContent' value='" + $('#rep' + count).children('.repContent').text() + "'>"
		replyView += "<b>내 용 : </b><textarea id='updateContent' name='updateContent' rows='5' cols='30' autofocus>" + $('#rep' + count).children('.repContent').text() + "</textarea><br></div>"
		replyView += "<input type='button' onclick='updateReplyConfirm()' value='수정 완료'>"
		replyView += "<input type='button' onclick='replyData()' value='취소'></form><br>"
		$('#rep'+count).replaceWith(replyView);
		$('#rep'+count).children('#updateTitle').focus();	
	}
	
	function updateReplyConfirm(){
		/* alert('수정?');
		 */
		if(!confirm('수정하시겠습니까?')){
			return false;
		} else {
			$("#updateResultFrm").submit();
		}
	}

</script>
<style type="text/css">
#modal_wrap {
	display: none;
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0; left: 0; right: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
}

#first {
	display: none;
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background: rgba(210, 240, 250, 0.9);
}

#second {
	display: none;
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background: rgba(210, 240, 250, 0.9);
}

h1 {
	text-align: center;
}

.contentView {
	display: flex;
	justify-content: center;
}
</style>
</head>
<body onload="replyData()">
	<!-- 답글 작성 페이지 -->
	<div id="modal_wrap">
		<div id="first">
			<div style="width: 400px; margin: 0 auto; padding-top: 20px;">
				<form id="frm" action="#">
					<input type="hidden" id="write_no" name="write_no" value="${dto.write_no }">
					<input type="hidden" id="user" name="id" value="${user }">
					<b>답글 작성 페이지</b>
					<hr>
					<b>작성자 : ${user }</b>
					<hr>
					<b>제 목</b><br>
					<input type="text" id="title" name="title" size="30">
					<hr>
					<b>내 용</b><br>
					<textarea id="content" name="content" rows="5" cols="30"></textarea>
					<hr>
					<button type="button" onclick="rep()">답 글</button>
					<button type="button" onclick="slide_hide()">취 소</button>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 답글 수정 페이지 -->
	<div id="modal_wrap">
		<div id="second">
			<div style="width: 400px; margin: 0 auto; padding-top: 20px;">
				<form id="updateFrm" action="#">
					<input type="hidden" id="write_no" name="write_no" value="${dto.write_no }">
					<input type="hidden" id="user" name="id" value="${user }">
					<b>답글 수정 페이지</b>
					<hr>
					<b>작성자 : ${user }</b>
					<hr>
					<b>제 목</b><br>
					<input type="text" id="title" name="title" size="30">
					<hr>
					<b>내 용</b><br>
					<textarea id="content" name="content" rows="5" cols="30"></textarea>
					<hr>
					<button type="button" onclick="repUpdate()">수 정</button>
					<button type="button" onclick="slide_hide()">취 소</button>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 본문 -->
	<c:import url="../default/header.jsp"/>
	<h1> 글보기 </h1>
	<br><br>
	<div class="wrap contentView">
		<table class="table table-striped">
			<tr>
				<th width="100px"> 글번호 </th><td width="200px" class="form-control input-sm">${dto.write_no }</td>
				<th width="100px"> 작성자 </th><td width="200px" class="form-control input-sm">${dto.id }</td>
			</tr>
			<tr>
				<th width="100px"> 제 목 </th><td width="200px" class="form-control input-sm">${dto.title }</td>
				<th width="100px"> 작성일 </th><td width="200px" class="form-control input-sm">${dto.savedate }</td>
			</tr>
			<tr>
				<th> 내 용 </th><td>${dto.content }</td>
				<td colspan="2">
					<c:if test="${dto.file_name == 'nan'}">
						<b>이미지가 없습니다...</b>
					</c:if>
					<c:if test="${dto.file_name != 'nan'}">
						<img src="${contextPath }/board/download?file_name=${dto.file_name}" width="200px" height="200px">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<%-- <c:if test="${dto.id == loginUser}"> --%>
					<!-- 답글 페이지 -->
					<div id="reply"></div>
					
					<c:if test="${dto.id == user}">
						<input type="button" value="수정하기" onclick="location.href='${contextPath }/board/modifyForm?write_no=${dto.write_no }'" /> &nbsp;
						<input type="button" value="삭제하기" onclick="deleteConfirm()" /> &nbsp;
					</c:if>
					<input type="button" value="답글달기" onclick="slide_click()"> &nbsp;
					<input type="button" value="글목록" onclick="location.href='${contextPath}/board/boardAllList'">
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>