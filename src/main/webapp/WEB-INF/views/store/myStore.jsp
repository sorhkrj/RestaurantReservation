<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<div class="container">
	<div class="mt-3">
		<div class="row">
	 		<div class="mb-3">
	 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">지점 관리</label>
			</div>
	 		<div class="input-group mb-3" style="height: 300px;">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">지점 사진</label>
				<span class="form-control" style="height: 300px;"><img src = "${pageContext.request.contextPath}/images/${storeVO.photo }" style="width: 70%; height: 100%;"></span>
			</div>
	 		<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">가게명</label>
				<span class="form-control">${storeVO.storeName }</span>
			</div>
	 		<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">위치</label>
				<span class="form-control">${storeVO.location }</span>
			</div>
	 		<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">분류</label>
				<span class="form-control">${storeVO.category }</span>
			</div>
			<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">지점 번호</label>
				<span class="form-control">${storeVO.store_phone }</span>
			</div>
			<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">주차장</label>
				<span class="form-control">${storeVO.parking }</span>
			</div>
			<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">휴무일</label>
				<span class="form-control">${storeVO.holyday }</span>
			</div>
			<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">소개</label>
				<span class="form-control">${storeVO.introduce }</span>
			</div>
			<div class="input-group mb-3">
	 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">공지사항</label>
				<span class="form-control">${storeVO.notice }</span>
			</div>
	   </div>
	   <div class="row text-center">
		   <div class="container mt-3">
		      <form action ="storeUpdate" method = "get">
				<input type = "submit" value = "지점 정보 수정" class="form-control input-sm btn btn-primary mb-3">
			  </form>
		      <form action ="storeReservation" method = "get">
				<input type = "hidden" name = "storeNo" value = "${storeVO.storeNo }">
				<input type = "submit" value = "지점 예약현황" class="form-control input-sm btn btn-primary mb-3">
			  </form>
			  <form action ="storeCapacitySelect" method = "get">
				<input type = "hidden" name = "storeNo" value = "${storeVO.storeNo }">
				<input type = "submit" value = "지점 예약 시간 관리" class="form-control input-sm btn btn-primary mb-3">
			  </form>
			  <form action ="menuDetail" method = "get">
				<input type = "submit" value = "지점 메뉴관리" class="form-control input-sm btn btn-primary mb-3">
			  </form>
		       <a href="/RestaurantReservation" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
		   </div>
	   </div>
	</div>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>