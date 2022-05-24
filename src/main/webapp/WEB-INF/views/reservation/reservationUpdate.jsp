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

#form{
	width: 600px; /*가로 조절*/
	border: 1px solid black;
}

#mytable {
	width: 1000px; /*가로 조절*/
	border: 1px solid black;
}

</style>


<title>예약수정</title>
</head>

<body>
	
	<div class="container">
		<c:import url="/WEB-INF/views/top.jsp"/>
	
		<form action="reservationUpdateCheck" method="post" id="form">
			<div class="container p-3" >
				<div class="row">
					<h2 class="text-center">예약수정</h2>
					
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">예약인원</span> 
						<input type="text" class="form-control" name="people" value="${rvo.people}">
					</div>
					
					<div class="container" id="mytable">
							<h2 class="text-center">예약 가능 날짜 </h2>
							<div class="row">
								<table class="table table-striped">
									<thead>
										<tr>
											<th class="col">날짜</th>
											<th class="col">시간</th>
											<th class="col">테이블수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="reservation" items="${list}"> 
											<tr>	
													<td>${reservation.day}</td>
													<td>${reservation.time}</td>
													<td>${reservation.capacity}</td>
											</tr> 
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문일자</span> 
						<input type="date" class="form-control" name="visitDay" value="${rvo.visitDay}">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문시간</span> 
						<input type="number" class="form-control" name="visitTime" value="${rvo.visitTime}">
					</div>
	
					<h2 class="text-center">방문인정보</h2>
   					<div class="form-check mb-3 text-center">
     						<label class="form-check-label">
       					<input class="form-check-input" type="checkbox" id="memberCheckbox" onclick=""> 주문자와 동일인</label>
   					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문인이름</span> 
						<input type="text" class="form-control" id="visitName" name="visitName" value="" >
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문인 전화번호</span> 
						<input type="text" class="form-control" id="visitPhone" name="visitPhone" value="">
					</div>
						<input type="hidden" class="form-control" name="reserveNo" value="${rvo.reserveNo}" >
				</div>
				<div class="row text-center">
					<div class="container mt-3">
						<input type="submit" class="btn btn-primary" value="확인"> 
						<a href="myReservationList" type="button" class="btn btn-primary">취소</a>
					</div>
				</div>
			</div>
		</form>
		<c:import url="/WEB-INF/views/footer.jsp"/>
	</div>	
		
	<script type="text/javascript">
 	  let name = '${rvo.visitName}';
      let phone = '${rvo.visitPhone}';
           
      memberCheckbox.addEventListener("change", function() {
        if(this.checked) {
   
          document.querySelector("#visitName").value=name;
          document.querySelector("#visitPhone").value=phone;
        }else {
          document.querySelector("#visitName").value="";
          document.querySelector("#visitPhone").value="";
        }
      })
    </script>
	
	
	
</body>
</html>