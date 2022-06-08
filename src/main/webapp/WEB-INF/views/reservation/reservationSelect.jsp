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
<title>예약상세정보</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<form class="container" action="reservationUpdate" method="post">
			<div class="mt-3">
				<div class="row">
			 		<div class="mb-3">
			 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">예약 상세 정보</label>
					</div>
			 		<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">음식점 이름</label>
						<span class="form-control">${reservation.storeName }</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문 일자</label>
						<span class="form-control">${reservation.visitDay }</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문 시간</label>
						<span class="form-control">${reservation.visitTime }</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">예약 인원</label>
						<span class="form-control">${reservation.people }</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문인 이름</label>
						<span class="form-control">${reservation.visitName }</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문인 전화번호</label>
						<span class="form-control">${reservation.visitPhone }</span>
					</div>
			   </div>
			   <div class="row text-center">
				   <div class="container mt-3">
				   	  <input type="hidden" class="form-control" name="reserveNo" value="${reservation.reserveNo }">
				   	  <input type="hidden" class="form-control" name="id" value="${reservation.id }">
				   	  <input type="hidden" class="form-control" name="storeNo" value="${reservation.storeNo }">
					  <input type="hidden" class="form-control" name="storeName" value="${reservation.storeName }">
					  <input type="hidden" class="form-control" name="people" value="${reservation.people }">
					  <input type="hidden" class="form-control" name="visitDay" value="${reservation.visitDay }">
					  <input type="hidden" class="form-control" name="visitTime" value="${reservation.visitTime }">
					  <input type="hidden" class="form-control" name="visitName" value="${reservation.visitName }">
					  <input type="hidden" class="form-control" name="visitPhone" value="${reservation.visitPhone }">
					  <input type="hidden" class="form-control" name="sumTime" value="${reservation.sumTime }">
					  <input type="hidden" class="form-control" name="regDate" value="${reservation.regDate }">
				      <input type="submit" class="form-control input-sm btn btn-primary mb-3" value="수정">
				      <input type="reset" value="취소" class="form-control input-sm btn btn-outline-danger mb-3">
				       <a href="${pageContext.request.contextPath}/reservation/myReservationList" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
				   </div>
			   </div>
			</div>
		</form>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>