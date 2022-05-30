<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	
	<table class="table table-striped">
		<tr>
			<td>가게명</td>
			<td>${storeVO.storeName }</td>
		</tr>	
		<tr>
			<td>사진</td>
			<td><img src = "${pageContext.request.contextPath}/images/${storeVO.photo }"></td>
		</tr>	
		<tr>
			<td>위치</td>
			<td>${storeVO.location }</td>
		</tr>	
		<tr>
			<td>분류</td>
			<td>${storeVO.category }</td>
		</tr>	
		<tr>
			<td>전화번호</td>
			<td>${storeVO.store_phone }</td>
		</tr>	
		<tr>
			<td>주차장</td>
			<td>${storeVO.parking }</td>
		</tr>	
		<tr>
			<td>휴무일</td>
			<td>${storeVO.holyday }</td>
		</tr>	
		<tr>
			<td>소개</td>
			<td>${storeVO.introduce }</td>
		</tr>	
		<tr>
			<td>공지사항</td>
			<td>${storeVO.notice }</td>
		</tr>	
		<tr>
			<td colspan = "2">
				<form action ="storeUpdate" method = "get">
					<input type = "submit" value = "수정하기">
				</form>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<form action ="storeReservation" method = "get">
					<input type = "hidden" name = "storeNo" value = "${storeVO.storeNo }">
					<input type = "submit" value = "예약현황">
				</form>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<form action ="storeCapacitySelect" method = "get">
					<input type = "hidden" name = "storeNo" value = "${storeVO.storeNo }">
					<input type = "submit" value = "음식점 예약 시간 관리">
				</form>
			</td>
		</tr>
	</table>
<c:import url="/WEB-INF/views/footer.jsp"/>
</div>
</body>
</html>