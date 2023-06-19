<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mate With HOST 인증 신청 목록</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">

	//인증 신청 자료 확인 -> 인증 신청 완료
	function hostCertificationOkCheck(){
		if(!confirm('승인 하겠습니까?')){
			return false;
		} else {
			document.hostCertificationOk.submit();
			alert("HOST 승인 완료되었습니다.");
		}	
	}
	
	//인증 신청 자료 확인 -> 인증 신청 거절
	function hostCertificationNoCheck(){
		if(!confirm('승인 거절 하겠습니까?')){
			return false;
		} else {
			$("#hostCertificationNo").submit();
			alert("HOST 인증 신청을 거절하였습니다.");
		}	
	}
	
</script>
<style type="text/css">
	table, th, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	.valueHiddenView {
		display: none;
	}
</style>
</head>
<body>
	<h1>HOST 신청 목록</h1>
	<table>
		<!-- 제목 부분 시작 -->
		<tr>
			<th>신청인</th>
			<th>제출자료</th>
			<!-- <th>신청상태</th> -->
			<th>신청일</th>
			<th>승인/거절</th>
		</tr>
		<!-- 제목 부분 끝 -->
		
		<!-- 신청 리스트들 시작 -->
		<c:forEach var="hostApplyList" items="${hostApplyList}">
		<tr>
			<td class="valueHiddenView" id="certify_no">${hostApplyList.certify_no}</td><!-- 값만 받아오기 위해 숨김 -->
			<td>${hostApplyList.id }</td>
			<td id="file_name">
				<a href="${contextPath}/mypageBoard/certified/hostCertificationDownload?file_name=${hostApplyList.file_name}">${hostApplyList.file_name }</a> 
				<%-- <img src="${contextPath }/resources/image/hostCertificationDocument/${hostApplyList.file_name }" width="100px" height="100px"> --%> 
			</td>
			<td>${hostApplyList.savedate }</td>
				
					<c:if test="${hostApplyList.state == 'approve' }">
						<td>승인 완료</td>
					</c:if>
					<c:if test="${hostApplyList.state == 'refusal' }">
						<td>승인 거절</td>
					</c:if>
					<c:if test="${hostApplyList.state == 'apply' }">
						<td>
							<!-- 유저 아이디 주소에 안뜨기 위해 form으로 전송 -->
							<form name="hostCertificationOk" action="${contextPath}/mypageBoard/certified/hostCertificationOk" method="post">
								<input type="hidden" name="certify_no" id="certify_no" value="${hostApplyList.certify_no}">
								<input type="hidden" name="userId" id="userId" value="${hostApplyList.id }">
								<input type="button" value="승인" onclick="hostCertificationOkCheck()">
							</form>
							<form name="hostCertificationNo" id="hostCertificationNo" action="${contextPath}/mypageBoard/certified/hostCertificationNo" method="post">
								<input type="hidden" name="certify_no" id="certify_no" value="${hostApplyList.certify_no}">
								<input type="hidden" name="userId" id="userId" value="${hostApplyList.id }">
								<input type="hidden" name="file_name" id="file_name" value="${hostApplyList.file_name}">
								<input type="button" value="거절" onclick="hostCertificationNoCheck()">
							</form>
						</td>
					</c:if>
				
		</tr>
		</c:forEach>
		<!-- 신청 리스트들 끝 -->		
	</table>
	
	<!-- 페이징 -->
		<div class="page_wrap">
				<div class="page_nation">
					<c:if test="${startPage > block }">
						<a href="${contextPath }/mypageBoard/certified/hostCertificationApplyList?num=${startPage-1 }" class="arrow prev"> 이전 </a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${i == num}">
							<a href="${contextPath }/mypageBoard/certified/hostCertificationApplyList?num=${i }" class="active"> ${i } </a>
						</c:if>
						<c:if test="${i != num}">
							<a href="${contextPath }/mypageBoard/certified/hostCertificationApplyList?num=${i }" class="active"> ${i } </a>
						</c:if>
					</c:forEach>		
					<c:if test="${endPage < totalPage }">
						<a href="${contextPath }/mypageBoard/certified/hostCertificationApplyList?num=${endPage+1 }" class="arrow next" > 다음 </a>
					</c:if>
				</div>
			</div>
		<!-- 페이징 끝 -->
		
		<a href="${contextPath}/member/manager_information">마이페이지로 이동</a>

</body>
</html>