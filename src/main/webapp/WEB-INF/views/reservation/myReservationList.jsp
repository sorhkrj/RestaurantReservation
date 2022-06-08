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
<title>나의 예약 목록</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<div class="mt-3">
			<div class="mb-3">
				<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">나의 예약 목록</label>
			</div>
			<div class="container" id="mytable">
				<div class="row">
					<table class="table">
						<thead>
							<tr>
								<th class="col">음식점명</th>
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
										<td><a href="reservationSelect?reserveNo=${reservation.reserveNo}&storeName=${reservation.storeName}">${reservation.storeName}</a></td>
										<td>${reservation.people}</td>
										<td>${reservation.visitDay}</td>
										<td>${reservation.visitTime}</td>
										<td>${reservation.visitName}</td>
										<td>${reservation.visitPhone}</td>
										<td>${reservation.regDate}</td>
										<td><button class="btn btn-outline-dark" onclick="myFunction(`${reservation.reserveNo}`,`${reservation.visitTime}`,`${reservation.visitDay}`,`${reservation.visitTime}`)">삭제</button></td>
								</tr> 
							</c:forEach>
		
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
		<c:import url="/WEB-INF/views/footer.jsp"/>

<dialog id="myDialog">
  <div id="a">
          <h5 class="text-center">예약삭제</h5>
          <form action="reservationDelete" method="post">
              <input type="hidden" class="form-control my-3" id="reserveNo" name="reserveNo">
              <input type="hidden" class="form-control my-3" id="people" name="people">
              <input type="hidden" class="form-control my-3" id="visitDay" name="visitDay">
              <input type="hidden" class="form-control my-3" id="visitTime" name="visitTime">
            <div class="form-group">
              <input type="password" class="form-control my-3" id="message-text" name="password" placeholder="비밀번호">
            </div>
            <div class="text-center">
              <input type="submit" class="btn btn-primary btn-sm" value="삭제">
              <a href="myReservationList"type="button" class="btn btn-primary btn-sm">취소</a>
            </div>
          </form>
  </div>       
<dialog>

<script>
function myFunction(rno,people,day,time) { 
  document.querySelector("#myDialog").showModal();
  document.querySelector("#reserveNo").value = rno;
  document.querySelector("#people").value = people;
  document.querySelector("#visitDay").value = day;
  document.querySelector("#visitTime").value = time;
} 
	
</script>

	
</body>
</html>
