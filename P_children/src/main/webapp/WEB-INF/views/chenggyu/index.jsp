
<!-- index -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	
	<c:import url="../default/header.jsp"/>
	
	<div align="center">
		<br>
		<h1>index</h1>
		<br>
<<<<<<< HEAD
		<a href="/root/member/memberLoginForm">로그인</a>
=======
		<a href="/root/member/member_information">개인 정보</a>
		<a href="/root/member/manager_information">관리자 정보</a>
>>>>>>> branch 'main' of https://github.com/ssp930/P_Children.git
	
	</div>
	
	<c:import url="../default/footer.jsp"/>
	

</body>
</html>