<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/chenggyu/board.css?v=2" rel="stylesheet" type="text/css">
<c:set var="path" value="${pageContext.request.contextPath }"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>

</head>
<body>
	<c:import url="../default/header.jsp"/>
	<section>
		<form action="${path }/member/kakaoPay">
			<label>프로그램명</label><br>
			<input type="text" id="itemName" name="item_name" value="${title }"/>
			<br><br>
			<label>상품 수량</label><br>
			<input type="text" id="quantity" name="quantity" value="${quantity }"/>
			<br><br>
			<label>상품 총액</label><br>
			<input type="text" id="totalAmount" name="total_amount" value="${total_amount }"/>
			<br><br>
			<label>상품 비과세 금액</label><br>
			<input type="text" id="taxFreeAmount" name="tax_free_amount" value="${tax_free_amount }"/>
			<br><br>
			<input type="hidden" name="write_no" value="${write_no }"><br>
	        <input type="hidden" name="num" value="${num }">
			<input type="submit" id="payment" name="payment" value="결제하기"/>
			<br><br>
		</form>
	</section>
   <c:import url="../default/footer.jsp"/>
</body>
</html>



