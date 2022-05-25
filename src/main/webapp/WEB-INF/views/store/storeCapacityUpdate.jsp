<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>	
	<form:form modelAttribute = "reservePossibleVO" action ="storeCapacityUpdatePro" method = "get">
		<table>
	 		<tr>
	 			<td>날짜</td>
				<td>${reservePossibleVO.day} </td>
			</tr>		
			<tr>
				<td>시간</td>
				<td><form:checkboxes items="${timeCheck}" path = "timeList" title="time"/></td>
			</tr>
			<tr>
				<td>시간당 예약건 수</td>
				<td><form:input path = "capacity" /></td>
			</tr>
			<tr>
				<td>좌석 수 (예약인원)</td>
				<td><form:input path = "seat" /></td>
			</tr>
			<tr>
				<td colspan = "2"><form:button>수정하기</form:button></td>
		</table>
			</form:form>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>