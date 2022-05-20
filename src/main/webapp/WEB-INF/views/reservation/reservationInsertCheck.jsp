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

<style>
html, body {
	height: 100%; /*높이 조절*/
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

#form {
	width: 600px; /*가로 조절*/
	border: 1px solid black;
}
</style>


<title>예약확인</title>
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/top.jsp"/>
		<form class="container" action="reservationInsert" method="post">
			<div class="container mt-3 p-3" id="form">
				<div class="row">
					<h2 class="text-center">예약확인</h2>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">음식점이름</span> 
						<input type="text" class="form-control" name="storename" disabled>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">예약인원</span> 
						<input type="text" class="form-control" name="people" disabled>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문일자</span> 
						<input type="text" class="form-control" name="visitDay" disabled>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문시간</span> 
						<input type="text" class="form-control" name="visitTime" disabled>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문인이름</span> 
						<input type="text" class="form-control" name="visitName" disabled>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문인 전화번호</span> 
						<input type="text" class="form-control" name="visitPhone" disabled>
					</div>
				</div>
				<h3 class="text-center">위 내용으로 예약합니다</h3>
				<div class="row text-center">
					<div class="container mt-3">
						<input type="submit" class="btn btn-primary" value="확인">
						<a href="javascript:window.history.go(-1);" type="button" class="btn btn-primary">취소</a>
					</div>
				</div>
			</div>
		</form>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</div>
</body>
</html>