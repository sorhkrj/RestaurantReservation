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
		<label class="col-sm-12 btn btn-outline-dark disabled mt-2" style="font-size: 20pt; font-weight: bold;">${firstDay } 부터 ${lastDay }까지의 음식점 예약 분석 결과입니다.</label>
	<table class="table mt-3">
		<tr>
			<th>총 예약건수 </th>
			<th>총 예약인원 </th>
			<th>일 평균 예약 건수 </th>
		</tr>
		<tr>
			<td> ${storeAnalysis.count } 건</td>
			<td> ${storeAnalysis.people } 명</td>
			<td> ${storeAnalysis.dayAvg } 건</td>
		</tr>
	</table>
	<div class="mt-3">
		<a href="${pageContext.request.contextPath}/store/storeAnalysis" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
	</div>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>