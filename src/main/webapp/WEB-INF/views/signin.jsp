<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script>
</script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>signin</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<div class="d-grid gap-3">
			<form action="login" method="post">
				<div class="mb-3 mt-3">
					<label class="form-label">ID:</label>
					<input type="text" name="id" placeholder="아이디 입력" autofocus required class="form-control">
				</div>
				<div class="mb-3">
					<label class="form-label">Password:</label>
					<input type="password" name="password" placeholder="패스워드 입력" required class="form-control">
				</div>
				<input type="submit" value="로그인" class="form-control input-sm btn btn-primary"/>
			</form>
			<form action="member/signup/memberInsert" method="get">
				<input type="submit" value="일반 회원가입" class="form-control input-sm btn btn-secondary"/>
			</form>
			<form action="member/signup/memberInsertEnterprise" method="get">
				<input type="submit" value="기업 회원가입" class="form-control input-sm btn btn-secondary mb-3"/>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>