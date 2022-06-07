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
		<table class="table table-striped">
			<tr>
				<td>음식점</td>
				<td><form:input path = "storeName" /></td>
			</tr>
			<tr>			
				<td>사  진</td>
				<td><input type="file" name="file" ></td>
			</tr>
			<tr>
				<td>위  치 </td>
				<td><form:input path = "location" /></td>
			</tr>
			<tr>
				<td>분  류 </td>
				<td><form:input path = "category" /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><form:input path = "store_phone" /></td>
			</tr>
			<tr>
				<td>주차장</td>
				<td><form:input path = "parking" /></td>
			</tr>
			<tr>
				<td>휴무일</td>
				<td>
					<input type="radio" name="holyday" value="월"  checked="checked" > 
					<label for="월">월</label>
					<input type="radio" name="holyday"  value="화"  checked="checked" > 
					<label for="화">화</label>
					<input type="radio" name="holyday"  value="수"  checked="checked" > 
					<label for="수">수</label>
					<input type="radio" name="holyday"  value="목"  checked="checked" > 
					<label for="목">목</label>
					<input type="radio" name="holyday"  value="금"  checked="checked" > 
					<label for="금">금</label>
				</td>
			</tr>
			<tr>
				<td>소  개</td>
				<td><form:input path = "introduce" /></td>
			</tr>
			<tr>
				<td>공  지</td>
				<td><form:input path = "notice" /></td>
			</tr>
		</table>
	<form:button>수정하기</form:button>
	<input type ="reset" value ="취소">
	</form:form>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>