<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>

</head>
<body>
	<form action="${path }/member/kakaoPay">
		<label>상품명</label><br>
		<input type="text" id="itemName" name="item_name"/>
		<br><br>
		<label>상품 수량</label><br>
		<input type="text" id="quantity" name="quantity"/>
		<br><br>
		<label>상품 총액</label><br>
		<input type="text" id="totalAmount" name="total_amount"/>
		<br><br>
		<label>상품 비과세 금액</label><br>
		<input type="text" id="taxFreeAmount" name="tax_free_amount"/>
		<br><br>
		<input type="submit" id="payment" name="payment" value="결제하기"/>
		<br><br>
	</form>
</body>
</html>



