
<!-- manager_information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager_information</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
</head>
<body>
	
		<c:import url="../default/header.jsp"/>
		
		<section><!-- body -->
		<div class="form-box"> <!--  container  -->
		<div class="title">관리자 정보</div>
		<form >
			<div class="user-details">
				<div class="input-box">
					<span class="details">아이디</span>
					<input type="text"  value="${dto.id }" readonly="readonly">	
				</div>
				<div class="input-box">
					<span class="details">닉네임</span>
					<input type="text" value="${dto.nickname }" readonly="readonly" >
				</div>
				<div class="input-box">
					<span class="details">휴대번호</span>
					<input type="text" value="${dto.phone }" readonly="readonly">
				</div>
				<div class="input-box">
					<span class="details">이메일</span>
					<input type="text" value="${dto.email }" readonly="readonly">
				</div>
				<div class="input-box">
					<span class="details">등급</span>
					<input type="text" value="${dto.grade }" readonly="readonly">
				</div>
				<div class="input-box_addr" >
					<span class="details_addr">주소</span>
					<input type="text" value="${dto.addr }"  readonly="readonly">
				</div>
			</div>
			<div class="button">
				<input type="button" value="사용자 관리" onclick="location.href='manager_memberList'" class="but_1">
				<input type="button" value="문의 관리" onclick="location.href='manager_qna'" class="but_1">
				<input type="button" value="카카오페이 승인 목록" onclick="location.href='kakaoPaymentApproveList'" class="but_1">
			</div>
		</form>
		</div>
	</section>
	
	<c:import url="../default/footer.jsp"/>

</body>
</html>