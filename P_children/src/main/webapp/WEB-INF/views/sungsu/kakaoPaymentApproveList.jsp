<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>카카오페이 결제 승인 목록 페이지</title>
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


#paging {
	color: black;
	text-decoration: none;
}
#currentPaging {
	color: red;
	text-decoration: underline;
}

</style>
</head>
<body>
	<h1>카카오페이 결제 승인 리스트</h1>
	<table class="table">
		<thead>
			<tr>
				<th scope="col" width="250px">cid</th>
				<th scope="col" width="250px">tid</th>
				<th scope="col" >item_name</th>
				<th scope="col" width="50px">quantity</th>
				<th scope="col" width="200px">approved_at</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="KPAL" items="${kakaoPaymAppList }">
			<tr>
				<td scope="row">${KPAL.cid }</td>
				<td><a href="kakaoPaymentOrderInfo?cid=${KPAL.cid }&tid=${KPAL.tid }">${KPAL.tid }</a></td>
				<td>${KPAL.item_name }</td>
				<td>${KPAL.quantity }</td>
				<td>${KPAL.approved_at }</td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="center">
					<div id="paging_block">
						<c:if test="${startPage > block }">
							[ <a href="kakaoPaymentApproveList?num=${startPage-1 }" id="paging"> 이전 </a> ]
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<c:if test="${i == num}">
								[ <a href="kakaoPaymentApproveList?num=${i }" id="currentPaging"> ${i } </a> ]
							</c:if>
							<c:if test="${i != num}">
								[ <a href="kakaoPaymentApproveList?num=${i }" id="paging"> ${i } </a> ]
							</c:if>
						</c:forEach>
						<c:if test="${endPage < totalPage }">
							[ <a href="kakaoPaymentApproveList?num=${endPage+1 }" id="paging"> 다음 </a> ]
						</c:if>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>