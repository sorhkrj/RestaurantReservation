<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<form action = "storeCapacityInsertPro" method = "get">
		<input type = "hidden" name = "storeNo" value = "${storeNo }">
		날짜<input type = 'date' name = 'day'><br>
		예약가능한 시간 설정<br>
		<c:forEach begin="1"  end="24" varStatus="no">
			<input type = "checkbox" name = "time" value="${no.count }"> ${no.count}시
			<c:if test="${no.count=='12'}"><br></c:if>
		</c:forEach><br>
		시간당 예약 건수 : <input type = "number" name = "capacity"><br>
		예약당 좌석 수 : <input type = "number" name = "seat"> <br>
		
		<input type ="submit" value = "등록하기">
		<input type = "reset" value = "취소">
	</form>
<c:import url="/WEB-INF/views/footer.jsp"/>	
</body>
</html>