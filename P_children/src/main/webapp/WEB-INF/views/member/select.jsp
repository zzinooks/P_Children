<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/chenggyu/login.css?v=3" rel="stylesheet" type="text/css">
<script type="text/javascript">
function userSelect(){
	const select = document.memberLoginForm.userSelect.value;	

	location.href = "${contextPath}/member/emailCheck?userSelect="+select;
	
}
</script>
<script>
function get_main(event) {
	  document.getElementById('main').innerText = 
	    event.target.id;
	}
</script>
</head>
<body>

	<c:import url="../default/header.jsp"/>
	
	<section>
		<div class="form-box">
			<form name="memberLoginForm" action="${contextPath}/member/userCheck" method="post" >
				<h2>MemberShip</h2>
				<div class="select">
				<input type="radio" name="userSelect"  id="밝아오는 새해에는 더욱 건강하시고 모든 소망이 이루어지는 한 해가 되시길 기원합니다." value="member"  onclick="get_main(event)" ><label for="member"><a>일반</a></label>
				<input type="radio" name="userSelect"  id=" 새해 복 많이 받으세요. 좋은 사람들과 함께 인생을 살아간다는 것은 참 좋은 행복한 일인 거 같습니다." value="host" onclick="get_main(event)" ><label for="host"><a>호스트</a></label>
				</div>
				<br>
				<div class="main" id='main'>
				</div>
				<div class="register">
					<p><a onclick="userSelect()">회원가입</a></p>
				</div>
			</form>
		</div>
	</section>

	<c:import url="../default/footer.jsp"/>

</body>
</html>