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
	날짜선택
	예약가능시간
	시간당 예약 건수
	예약당 좌석 수
	<a href="storeCapacityInsertPro">등록하기</a>
<c:import url="/WEB-INF/views/footer.jsp"/>	
</body>
</html>