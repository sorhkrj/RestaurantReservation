<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>index</title>
<script type="text/javascript">
</script>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp" />
<div class="container">
	<div class="mb-3">
		<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">지점 예약 목록</label>
	</div>
	<table class="table">
		<tr>
			<td>예약번호</td>
			<td>이름</td>
			<td>예약일</td>
			<td>방문시간</td>
			<td>전화번호</td>
			<td>인원</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="i" items="${reservationVO }" varStatus="no">
			<tr>
				<td>${no.count }</td>
				<td>${i.visitName }</td>
				<td>${i.visitDay}</td>
				<td>${i.visitTime}</td>
				<td>${i.visitPhone}</td>
				<td>${i.people}</td>
				<td>
					<form name = "dd" action = "storeReservationDeletePro" method = "get" onsubmit = "return confirm('해당 예약을 취소하시겠습니까?')">
						<input type = "hidden" name = "reserveNo" value = "${i.reserveNo }">
						<input type = "hidden" name = "storeNo" value = "${i.storeNo}">
						<input type = "submit" value = "삭제하기" class="btn btn-outline-dark">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div class="row text-center">
	   <div class="container mt-3">
	      <a href="${pageContext.request.contextPath}/store/myStore" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
	   </div>
   </div>
</div>
<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>