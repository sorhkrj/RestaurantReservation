<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- JS CDN -->
  <script>
  	function memberIdCheck() {
  		$.ajax({
			url : "memberIdCheck",
			type : "get",
			contentType: 'application/json',
			datatype : "json",
			data : {
				"id" : $("#id").val()
			}
		}).done(function(result) {
			var idCheck = document.getElementById("idCheck");
			if (result) {
				idCheck.classList.value="btn btn-outline-success";
				idCheck.innerHTML = "사용 가능";
			} else {
				idCheck.classList.value="btn btn-outline-danger";
				idCheck.innerHTML = "사용 불가능";
			}
		});
  	}
  </script>
  <title>회원가입</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<form action="memberInsertPro" method ="post">
			<div class="mt-3">
				<div class="row">
					<div class="mb-3">
						<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">회원 가입</label>
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">ID</label>
						<input type="text" id="id" name="id" class="form-control"/>
						<button type="button" id="idCheck" onclick="memberIdCheck()" class="btn btn-outline-danger">중복 확인</button>
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Password</label>
						<input type="password" name="password" class="form-control"/>
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Name</label>
						<input type="text" name="name" class="form-control"/>
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Phone</label>
						<input type="text" name="phone" class="form-control"/>
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">NickName</label>
						<input type="text" name="nickname" class="form-control"/>
					</div>
					<div class="mt-3">
						<a href="memberUpdateCheck?id=${memberVO.id}" class="form-control input-sm btn btn-primary mb-3">회원 가입</a>
						<input type="reset" value="취소" class="form-control input-sm btn btn-outline-danger mb-3">
						<a href="${pageContext.request.contextPath}/signin" class="form-control input-sm btn btn-outline-primary mb-3">돌아가기</a>
					</div>
				</div>
			</div>
		</form>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
