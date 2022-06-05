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
<div class="container">
<c:import url="/WEB-INF/views/top.jsp"/>
	<form action = "storeCapacityMonthPro" method = "get">
		<input type = "hidden" name = "storeNo" value = "${storeNo }">
		<table class="table table-striped">
		<tr>
			<td>예약가능한 시간 설정</td>
			<td>
				<c:forEach begin="1"  end="24" varStatus="no">
					<input type = "checkbox" name = "time" value="${no.count }"> ${no.count}시
					<c:if test="${no.count=='12'}"><br></c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>시간당 예약 건수</td>
			<td><input type = "number" name = "capacity"></td>
		</tr>
		<tr>
			<td>예약당 좌석 수</td>
			<td><input type = "number" name = "seat"></td>
		</tr>
		</table>
		<input type ="submit" value = "등록하기">
		<input type = "reset" value = "취소">
	</form>
<c:import url="/WEB-INF/views/footer.jsp"/>	
</div>
</body>
</html>