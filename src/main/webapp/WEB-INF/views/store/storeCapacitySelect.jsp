<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	
	<table>
		<tr>
			<td>날짜</td>
			<td>예약 가능시간</td>
			<td>예약 건수</td>
			<td>좌석 수</td>
		</tr>
		<tr>
			<form:form modelAttribute = "storeCapacityVO">
				<td><form:input items = "${storeCapacityVO}" path = "DAY" /></td>
				<td><form:input items = "${storeCapacityVO}" path = "TIME" /></td>
				<td><form:input items = "${storeCapacityVO}" path = "CAPACITY" /></td>
				<td><form:input items = "${storeCapacityVO}" path = "SEAT" /></td>
			</form:form>
		</tr>
	</table>
		<a href = "storeCapacityInsert">등록</a>
		<a href = "storeCapacityUpdate">수정</a>
		<a href = "storeCapacityDeletePro">삭제</a>
	
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>