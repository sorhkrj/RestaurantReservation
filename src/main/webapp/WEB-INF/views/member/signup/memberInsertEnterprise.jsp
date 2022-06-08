<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- JS CDN -->
  <script>
  	function memberIdCheck(idCheck) {
  		$.ajax({
			url : "memberIdCheck",
			type : "get",
			contentType: 'application/json',
			datatype : "json",
			data : {
				"id" : $("#id").val()
			}
		}).done(function(result) {
			if (result) {
				idCheck.classList.value="btn btn-outline-success";
				idCheck.innerHTML = "사용 가능";
			} else {
				idCheck.classList.value="btn btn-outline-danger";
				idCheck.innerHTML = "사용 불가능";
			}
		});
  	}
  	
  	function textIdChange(idCheck) {
		idCheck.classList.value="btn btn-outline-danger";
		idCheck.innerHTML = "사용 불가능";
  	}
  </script>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<div class="container">
	<form action="memberInsertEnterprisePro" method="Post" enctype="multipart/form-data">
		<div class="mt-3">
			<div class="row">
				<div class="mb-3">
					<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">지점장 회원가입</label>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">ID</label>
					<input type="text" id="id" name="id" onchange="textIdChange(idCheck)" class="form-control"/>
					<button type="button" id="idCheck" onclick="memberIdCheck(this)" class="btn btn-outline-danger">중복 확인</button>
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
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Nick Name</label>
					<input type="text" name="nickname" class="form-control"/>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Photo</label>
					<input type="file" name="file" class="form-control"/>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Name</label>
					<input type="text" name="storeName" class="form-control"/>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Location</label>
					<input type="text" name="location" class="form-control"/>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Category</label>
					<input type="text" name="category" class="form-control"/>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Phone</label>
					<input type="text" name="store_phone" class="form-control"/>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Parking</label>
					<input type="text" name="parking" class="form-control"/>
				</div>
					
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Holyday</label>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="월" checked class="form-check-input">월
					</div>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="화" class="form-check-input">화
					</div>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="수" class="form-check-input">수
					</div>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="목" class="form-check-input">목
					</div>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="금" class="form-check-input">금
					</div>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Introduce</label>
					<input type="text" name="introduce" class="form-control"/>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Store Notice</label>
					<input type="text" name="notice" class="form-control"/>
				</div>
				<div class="mt-3">
					<input type="submit" value="회원 가입" class="form-control input-sm btn btn-primary mb-3">
					<input type="reset" value="취소" class="form-control input-sm btn btn-outline-danger mb-3">
					<a href="${pageContext.request.contextPath}/signin" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
				</div>
			</div>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>





