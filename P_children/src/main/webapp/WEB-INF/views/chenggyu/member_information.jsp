
<!-- member_information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_information</title>
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=1" rel="stylesheet" type="text/css">
<script type="text/javascript">
</script>
<style type="text/css">
table{
	border: 1px solid;
	border-collapse: collapse;
	height: 200px;
	width: 500px;
}
th, td {
	border: 1px solid ;
}
</style>
</head>
<body>
	
	<c:import url="../default/header.jsp"/>
		
		<section><!-- body -->
		<div class="form-box"> <!--  container  -->
		<div class="title">회원 정보</div>
		<form >
			<div class="user-details">
				<div class="input-box">
					<span class="details">아이디</span>
					<input type="text"  value="${dto.id }" readonly="readonly">	
				</div>
				<div class="input-box">
					<span class="details">등급</span>
					<input type="text" value="${dto.grade }" readonly="readonly">
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
				<div class="input-box" >
					<span class="details">주소</span>
					<input type="text" value="${dto.addr }"  readonly="readonly">
					<input type="text" value="${dto.addr }"  readonly="readonly">
				</div>
			</div>
			<div class="button">
				<input type="button" value="개인정보 수정" onclick="valueCheck()" class="but_1">
				<input type="button" value="나의 게시글" onclick="valueCheck()" class="but_1">
				<input type="button" value="1:1 문의" onclick="valueCheck()" class="but_1">
				<input type="button" value="회원 탈퇴" onclick="valueCheck()" class="but_1">
			</div>
		</form>
		</div>
	</section>
	
	<c:import url="../default/footer.jsp"/>

	
</body>
</html>