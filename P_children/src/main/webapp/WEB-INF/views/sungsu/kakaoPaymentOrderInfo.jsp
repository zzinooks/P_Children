<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 결제 상세 내역</title>
<style type="text/css">
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

table {
	margin: auto;
}

h1 {
	text-align: center;
}

</style>
</head>
<body>
	<h1>카카오페이 결제 승인 내역 상세</h1>
	<form>
		<table>
			<tr>
				<th>tid</th>
				<td>${kakaoPaymOrderInfo.tid }</td>
			</tr>
			<tr>
				<th>cid</th>
				<td>${kakaoPaymOrderInfo.cid }</td>
			</tr>
			<tr>
				<th>status</th>
				<td>${kakaoPaymOrderInfo.status }</td>
			</tr>
			<tr>
				<th>partner_order_id</th>
				<td>${kakaoPaymOrderInfo.partner_order_id }</td>
			</tr>
			<tr>
				<th>partner_user_id</th>
				<td>${kakaoPaymOrderInfo.partner_user_id }</td>
			</tr>
			<tr>
				<th>payment_method_type</th>
				<td>${kakaoPaymOrderInfo.payment_method_type }</td>
			</tr>
			<tr>
				<th>amount</th>
				<td>${kakaoPaymOrderInfo.amount }</td>
			</tr>
			<tr>
				<th>canceled_amount</th>
				<td>${kakaoPaymOrderInfo.canceled_amount }</td>
			</tr>
			<tr>
				<th>cancel_available_amount</th>
				<td>${kakaoPaymOrderInfo.cancel_available_amount }</td>
			</tr>
			<tr>
				<th>item_name</th>
				<td>${kakaoPaymOrderInfo.item_name }</td>
			</tr>
			<tr>
				<th>item_code</th>
				<td>${kakaoPaymOrderInfo.item_code }</td>
			</tr>
			<tr>
				<th>quantity</th>
				<td>${kakaoPaymOrderInfo.quantity }</td>
			</tr>
			<tr>
				<th>created_at</th>
				<td>${kakaoPaymOrderInfo.created_at }</td>
			</tr>
			<tr>
				<th>approved_at</th>
				<td>${kakaoPaymOrderInfo.approved_at }</td>
			</tr>
			<tr>
				<th>canceled_at</th>
				<td>${kakaoPaymOrderInfo.canceled_at }</td>
			</tr>
			<tr>
				<th>selected_card_info</th>
				<td>${kakaoPaymOrderInfo.selected_card_info }</td>
			</tr>
			<tr>
				<th>payment_action_details</th>
				<td>${kakaoPaymOrderInfo.payment_action_details }</td>
			</tr>
			<tr>
				<th colspan="2"><a href="kakaoPaymentCancel?cid=${kakaoPaymOrderInfo.cid }&tid=${kakaoPaymOrderInfo.tid }&cancel_amount=${total}&cancel_tax_free_amount=${tax_free}">결제 취소</a></th>
			</tr>
		</table>
	</form>
</body>
</html>