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
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>예약확인</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<form class="container" action="reservationInsertPro" method="post">
			<div class="mt-3">
				<div class="row">
			 		<div class="mb-3">
			 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">예약 확인</label>
					</div>
			 		<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">예약 음식점</label>
						<span class="form-control">${rvo.storeName}</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문 일자</label>
						<span class="form-control">${rvo.visitDay}</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문 시간</label>
						<span class="form-control">${rvo.visitTime}</span>
					</div>
			 		<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">예약 인원</label>
						<span class="form-control">${rvo.people}</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문인 이름</label>
						<span class="form-control">${rvo.visitName}</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문인 전화번호</label>
						<span class="form-control">${rvo.visitPhone}</span>
					</div>
					<div class="mb-3">
			 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">위 내용으로 예약합니다</label>
					</div>
			   </div>
			   <div class="row text-center">
				   <div class="container mt-3">
				      <input type="hidden" class="form-control" name="storeNo" value="${rvo.storeNo }">
				   	  <input type="hidden" class="form-control" name="storeName" value="${rvo.storeName }">
				   	  <input type="hidden" class="form-control" name="visitDay" value="${rvo.visitDay }">
				   	  <input type="hidden" class="form-control" name="visitTime" value="${rvo.visitTime }">
				   	  <input type="hidden" class="form-control" name="people" value="${rvo.people }">
				   	  <input type="hidden" class="form-control" name="visitName" value="${rvo.visitName }">
				   	  <input type="hidden" class="form-control" name="visitPhone" value="${rvo.visitPhone }">
				      <input type="submit" class="form-control input-sm btn btn-primary mb-3" value="확인">
				      <a href="${pageContext.request.contextPath}/reservation/reservationInsert?storeNo=${rvo.storeNo }" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
				   </div>
			   </div>
			</div>
		</form>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>