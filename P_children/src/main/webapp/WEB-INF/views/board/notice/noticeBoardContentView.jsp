<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글보기</title>
<script type="text/javascript">

	// 파일 업로드 시 img 태그에 그림 화면 보이기
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
	
	// 게시글 삭제
	function noticeDeleteConfirm() {
		
		if(!confirm('삭제하시겠습니까?')){
			return false;
		} else {
			location.href='${contextPath }/board/notice/noticeBoardDelete?write_no=${noticeBoardDTO.write_no }&file_name=${noticeBoardDTO.file_name }';
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

.reply {
	width: 1000px;
	border: 1px solid red;
}

#updateResultFrm {
	display: flex;
	justify-content: center;
}

#updateResultFrm textarea {
	display: block;
}

.reComment {
	background-color: cookie;
}
</style>
</head>
<body onload="replyData()">
	<!-- 본문 -->
	<%-- <c:import url="../default/header.jsp"/> --%>
	<h1> 공지사항 글보기 </h1>
	<br><br>
	<div class="wrap contentView">
		<table class="table table-striped">
			<tr>
				<th width="100px"> 구 분 </th>
				<td width="200px" class="form-control input-sm">
					<c:if test="${noticeBoardDTO.category == 'noticeGeneral' }"> 일반 </c:if>
					<c:if test="${noticeBoardDTO.category == 'noticeEvent' }"> 이벤트 </c:if>
					<c:if test="${noticeBoardDTO.category == 'noticeProduct' }"> 상품 </c:if>
					<c:if test="${noticeBoardDTO.category == 'noticeDeliveryDelay' }"> 배송지연 </c:if>
				</td>
				<th width="100px"> 작성자 </th><td width="200px" class="form-control input-sm">${noticeBoardDTO.id }</td>
			</tr>
			<%-- <tr>
				<th width="100px"> 글번호 </th><td width="200px" class="form-control input-sm">${noticeBoardDTO.write_no }</td>
			</tr> --%>
			<tr>
				<th width="100px"> 제 목 </th><td width="200px" class="form-control input-sm">${noticeBoardDTO.title }</td>
				<th width="100px"> 작성일 </th><td width="200px" class="form-control input-sm">${noticeBoardDTO.savedate }</td>
			</tr>
			<tr>
				<th> 내 용 </th><td>${noticeBoardDTO.content }</td>
				<td colspan="2">
					<c:if test="${noticeBoardDTO.file_name == 'nan'}">
						<b>이미지가 없습니다...</b>
					</c:if>
					<c:if test="${noticeBoardDTO.file_name != 'nan'}">
						<img src="${contextPath }/board/notice/noticeBoardDownload?file_name=${noticeBoardDTO.file_name}" width="200px" height="200px">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<c:if test="${info.grade == admin }">
					<input type="button" value="수정하기" onclick="location.href='${contextPath }/board/notice/noticeBoardModifyForm?write_no=${noticeBoardDTO.write_no }'"> &nbsp;
					<input type="button" value="삭제하기" onclick="noticeDeleteConfirm()" /> &nbsp;
				</c:if>	
				<%-- 글목록  --%>
				<c:choose>
					<c:when test="${notice_category != null}">
						<input type="button" value="글목록" onclick="location.href='${contextPath }/board/notice/noticeSearchForm?num=${num}&notice_category=${notice_category }&notice_searchCategory=${notice_searchCategory}&notice_searchKeyword=${notice_searchKeyword}'">
					</c:when>
					<c:otherwise>
						<input type="button" value="글목록" onclick="location.href='${contextPath }/board/notice/noticeBoardAllList?num=${num}'">
					</c:otherwise>	
				</c:choose>
				</td>
			</tr>
		</table>
	</div>
		<div align="center"><a href="${contextPath }/index">메인으로</a></div>
	<%-- <c:import url="../default/footer.jsp"/> --%>
</body>
</html>