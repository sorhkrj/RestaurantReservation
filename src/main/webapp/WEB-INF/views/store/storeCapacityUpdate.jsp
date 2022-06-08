<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
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
	<form:form modelAttribute = "reservePossibleVO" action ="storeCapacityUpdatePro" method = "get">
		<div class="mt-3">
			<div class="row">
		 		<div class="mb-3">
		 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">지점 예약 시간 수정</label>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">날짜</label>
					<span class="form-control">${reservePossibleVO.day}</span>
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">시간</label>
					<span class="form-control"><form:checkboxes items="${timeCheck}" path = "timeList" title="time"></form:checkboxes></span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">시간당 예약건 수</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "capacity" class="form-control"/></span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">좌석 수(인원수)</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "seat" class="form-control"/></span>
				</div>
			</div>
			<div class="row text-center">
			   <div class="container mt-3">
			      <form:button class="form-control input-sm btn btn-primary mb-3">수정하기</form:button>
			      <input type ="reset" value ="취소" class="form-control input-sm btn btn-outline-danger mb-3">
			      <a href="${pageContext.request.contextPath}/store/storeCapacitySelect?storeNo=${reservePossibleVO.storeNo}" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
			   </div>
		   </div>
		</div>
	</form:form>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>