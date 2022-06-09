<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
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
	<form:form modelAttribute = "storeVO" action ="storeUpdatePro"  method="Post" enctype="multipart/form-data">
		<div class="mt-3">
			<div class="row">
		 		<div class="mb-3">
		 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">지점 정보 수정</label>
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">지점명</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "storeName" class="form-control" required="required"/></span>
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">지점 사진</label>
					<span class="form-control" style="margin: 0; padding: 0;"><input type="file" name="file" class="form-control" required="required"></span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">지점 위치</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "location" class="form-control" required="required"/></span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">분류</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "category" class="form-control" required="required"/></span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">연락처</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "store_phone" class="form-control" required="required"/></span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">주차장</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "parking" class="form-control" required="required"/></span>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">휴무일</label>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="월" checked class="form-check-input">월
					</div>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="화" class="form-check-input">화
					</div>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="수" class="form-check-input">수
					</div>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="목" class="form-check-input">목
					</div>
					<div class="form-check me-3 mt-2">
						<input type="radio" name="holyday" value="금" class="form-check-input">금
					</div>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">소개</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "introduce" class="form-control" required="required"/></span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">공지</label>
					<span class="form-control" style="margin: 0; padding: 0;"><form:input path = "notice" class="form-control" required="required"/></span>
				</div>
		   </div>
		   <div class="row text-center">
			   <div class="container mt-3">
			   	  <form:input type="hidden" path = "id"/>
			      <form:button class="form-control input-sm btn btn-primary mb-3">수정하기</form:button>
			      <input type ="reset" value ="취소" class="form-control input-sm btn btn-outline-danger mb-3">
			      <a href="${pageContext.request.contextPath}/store/myStore" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
			   </div>
		   </div>
		</div>
	</form:form>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>