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

#mytable {
	width: 1000px; /*가로 조절*/
	border: 1px solid black;
}
</style>


<title>예약확인</title>
</head>
<body>
<div class="container">
<c:import url="/WEB-INF/views/top.jsp"/>

	<div class="container" id="mytable">
		<h2 class="text-center">나의 예약 목록</h2>
		<div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col">음식점</th>
						<th class="col">방문일</th>
						<th class="col">방문시간</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<button type="button" class="btn btn-primary btn-sm">세부정보</button>
		</div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp"/>
	</div>
</body>
</html>
