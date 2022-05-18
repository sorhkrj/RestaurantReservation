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

	날짜출력
	예약가능시간
	시간당 예약 건수
	예약당 좌석 수
	
	<table>
		<tr>
			<td>날짜</td>
			<td>예약 가능시간</td>
			<td>예약 건수</td>
			<td>좌석 수</td>
		</tr>
<%-- 		<tr>
			<form:form modelAttribute = "storeCapacityVO" action ="storeCapacityUpdatePro">
				<td>${day} </td>
				<td><form:input path = "TIME" /></td>
				<td><form:input path = "CAPACITY" /></td>
				<td><form:input path = "SEAT" /></td>
				<form:button>수정하기</form:button>
			</form:form>
		</tr> --%>
	</table>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>