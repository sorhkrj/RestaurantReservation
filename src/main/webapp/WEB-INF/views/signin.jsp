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
	<form action="login" method="post">
		<div class="mt-3">
			<div class="row">
				<div class="mb-3">
					<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">로그인</label>
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">ID</label>
					<input type="text" name="id" placeholder="아이디 입력" autofocus required class="form-control">
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Password</label>
					<input type="password" name="password" placeholder="패스워드 입력" required class="form-control">
				</div>
				<div class="mt-3">
					<input type="submit" value="로그인" class="form-control input-sm btn btn-primary mb-3"/>
					<a href="member/signup/memberInsert" class="form-control input-sm btn btn-outline-primary mb-3">일반 회원가입</a>
					<a href="member/signup/memberInsertEnterprise" class="form-control input-sm btn btn-outline-primary mb-3">기업 회원가입</a>
				</div>
			</div>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>