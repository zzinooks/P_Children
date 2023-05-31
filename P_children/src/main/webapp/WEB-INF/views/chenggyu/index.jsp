
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
		<a href="/root/member/member_information">개인 정보</a>
		<a href="/root/member/manager_information">관리자 정보</a>
	
	</div>
	
	<c:import url="../default/footer.jsp"/>
	

</body>
</html>