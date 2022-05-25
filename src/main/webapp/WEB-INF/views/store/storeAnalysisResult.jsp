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
	기간 : ${firstDay } 부터 ${lastDay }까지의 음식점 예약 분석 결과입니다.<br>
	총 예약 건수 : ${storeAnalysis.count }<br>
	총 예약 인원 : ${storeAnalysis.people }<br>
	일 평균 예약 건수 : ${storeAnalysis.dayAvg }<br>
	<br>
	날짜별 예약 건수(미구현)
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>