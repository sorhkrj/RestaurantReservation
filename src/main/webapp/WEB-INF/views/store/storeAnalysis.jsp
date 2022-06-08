<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>     
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
	<form action = "storeAnalysisPro" method = "get">
		<div class="mt-3">
			<div class="row">
				<div class="mb-3">
					<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">날짜 선택</label>
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">시작</label>
					<input type="date" name = "firstDay" required class="form-control">
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">종료</label>
					<input type="date" name = "lastDay" required class="form-control">
				</div>
				<div class="mt-3">
					<input type="submit" value="선택완료" class="form-control input-sm btn btn-primary mb-3"/>
					<a href="/RestaurantReservation" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
				</div>
			</div>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>