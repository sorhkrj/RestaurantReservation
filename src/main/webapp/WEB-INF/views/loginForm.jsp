<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>login</title>
</head>
<body>
	<!-- security의 login과 겹쳐서 loginForm으로 이름 수정  -->
	<div class="container">
		<c:import url="/WEB-INF/views/top.jsp"/>
		<form:form action="login" method="post" class="w3-container">
			<p><label>ID</label></p>
			<p><label>PASSWORD</label></p>
			<p><input type="text" name="id" class="w3-input" autofocus required></p>
			<p><input type="password" name="password" class="w3-input" required></p>
			<input type="submit" value="로그인" class="w3-button w3-white w3-border w3-border-blue w3-round-large"/>
		    <c:if test="${param.error != null}">
        		<p>아이디와 비밀번호가 잘못되었습니다.</p>
  			</c:if>
		</form:form>
		<form method="get" class="w3-container">
			<input type="submit" value="일반 회원가입" formaction="${pageContext.request.contextPath}/member/memberInsert" class="w3-button w3-white w3-border w3-border-blue w3-round-large"/>
			<input type="submit" value="기업 회원가입" formaction="${pageContext.request.contextPath}/member/memberInsertEnterprise" class="w3-button w3-white w3-border w3-border-blue w3-round-large"/>
		</form>
		<c:import url="/WEB-INF/views/footer.jsp"/>
	</div>
</body>
</html>