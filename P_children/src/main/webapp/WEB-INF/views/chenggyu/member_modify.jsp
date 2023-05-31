
<!-- member_modify -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_modify</title>
</head>
<body>

	<c:import url="../default/header.jsp" />
	<div align="center">
		<br>
		<h1>개인정보 수정</h1>
		<br>
		<form action="${contextPath }/member/modify" enctype="mulipart/form-data" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<th><input type="text" name="id" value="" readonly="readonly"></th>
				</tr>
				<tr>
					<th>닉네임</th>
					<th><input type="text" name="nickname" value="" ></th>
				</tr>
				<tr>
					<th>이메일</th>
					<th><input type="text" name="email" value="" ></th>
				</tr>
				<tr>
					<th>휴대전화</th>
					<th><input type="text" name="phone" value="" ></th>
				</tr>
				<tr>
					<th>주소</th>
					<th><input type="text" name="addr" value="" ></th>
				</tr>
			</table>
			<br><br>
			<input type="submit" value="수정"> &nbsp;
			<input type="reset"value="다시 작성">
		</form>
		
		<br><br>
		<a href="/root/member/member_information ">개인 정보</a>

	</div>

	<c:import url="../default/footer.jsp" />

</body>
</html>