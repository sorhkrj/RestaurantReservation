<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

  <title>내정보</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<div class="container">
	<div class="mt-3">
		<div class="row">
	 		<div class="mb-3">
	 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">내 정보</label>
			</div>
	 		<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">ID</label>
				<span class="form-control">${memberVO.id}</span>
			</div>
	 		<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">이름</label>
				<span class="form-control">${memberVO.name}</span>
			</div>
	 		<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">전화번호</label>
				<span class="form-control">${memberVO.phone}</span>
			</div>
	 		<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">별명</label>
				<span class="form-control">${memberVO.nickname}</span>
			</div>
	   </div>
	   <div class="row text-center">
		   <div class="container mt-3">
		   	<c:if test="${memberVO.enabled eq 0}">
		      <form action = "memberRecoveryAdmin" method= "post">
		      	<input type = "hidden" name = "id" value = "${memberVO.id}">
		      	<input class="form-control input-sm btn btn-outline-primary mb-3" type = "submit" value = "회원 복구">
		      </form>
		    </c:if>
		      <a href="/RestaurantReservation" class="form-control input-sm btn btn-outline-primary mb-3">돌아가기</a>
		   </div>
	   </div>
	</div>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>