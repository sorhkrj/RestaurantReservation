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
						<th class="col">이름</th>
						<th class="col">가게명</th>
						<th class="col">방문인원</th>
						<th class="col">방문일자</th>
						<th class="col">방문시간</th>
						<th class="col">방문자이름</th>
						<th class="col">방문자전화번호</th>
						<th class="col">등록시간</th>
						<th class="col">삭제</th>
						
					</tr>
				</thead>
				<tbody>
			 
					<c:forEach var="reservation" items="${list}"> 
						<tr>
			
						 		<td><a href="reservationSelect?reserveNo=${reservation.reserveNo}">${reservation.id}</a></td>
								<td>${reservation.storeNo}</td>
								<td>${reservation.people}</td>
								<td>${reservation.visitDay}</td>
								<td>${reservation.visitTime}</td>
								<td>${reservation.visitName}</td>
								<td>${reservation.visitPhone}</td>
								<td>${reservation.regDate}</td>
								<td><a href=""type="button" class="btn btn-sm btn-primary m-0" onclick="delete();">삭제</a></td>
						</tr> 
					</c:forEach>

				</tbody>
			</table>
			
		</div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp"/>
	</div>
</body>
</html>
