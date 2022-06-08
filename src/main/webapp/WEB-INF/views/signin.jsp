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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- JS CDN -->
<script>
	function loginCheck() {
  		$.ajax({
			url : "loginCheck",
			type : "get",
			contentType: 'application/json',
			datatype : "json",
			data : {
				"id" : $("#id").val(),
				"password" : $("#password").val()
			},
		}).done(function(result) {
			(result) ? login() : alert();
		});
	}
	
	function alert() {
		var alert = document.getElementById("alert");
		alert.style.display ="block";
	}
	
	function login() {
		var form = document.getElementById("login");
		form.submit();
	}
</script>
<title>signin</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<div class="container">
	<div class="mt-3">
		<div class="row">
			<div class="mb-3">
				<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">로그인</label>
			</div>
			<div id="alert" class="container" style="display: none">
				<div class="alert alert-warning">
					<strong>로그인 실패</strong> 아이디 또는 비밀번호를 잘못 입력했습니다.
				</div>
			</div>
			<form action="login" method="post" onsubmit="return false" id="login">
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">ID</label>
					<input type="text" id="id" name="id" placeholder="아이디 입력" autofocus required class="form-control">
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Password</label>
					<input type="password" id="password" name="password" placeholder="패스워드 입력" required class="form-control">
				</div>
				<div class="mt-3">
					<input type="submit" value="로그인" onclick="loginCheck()" class="form-control input-sm btn btn-primary mb-3"/>
					<a href="member/signup/memberInsert" class="form-control input-sm btn btn-outline-primary mb-3">일반 회원가입</a>
					<a href="member/signup/memberInsertEnterprise" class="form-control input-sm btn btn-outline-primary mb-3">기업 회원가입</a>
				</div>
			</form>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>