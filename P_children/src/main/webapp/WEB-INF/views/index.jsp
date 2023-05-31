<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>P.Children</title>
</head>
<body>

	<c:import url="default/header.jsp"/>
	<div class="wrap">
		<h1>임시 index</h1>
	
		<c:if test="${loginUser != null }">
			<h2>${loginUser }님 로그인 성공</h2>
		</c:if>
		<c:if test="${loginUser == null }">
			<h2>내용 없음</h2>
		</c:if>
	</div>
	<c:import url="default/footer.jsp"/>

</body>
</html>