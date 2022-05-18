<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	${svo.storeName }
	<%-- 사진 : ${info.photo }<br>
	위치 : ${info.location }<br>
	분류 : ${category}	<br>
	전화번호 : ${store_phone}<br>
	주차장 : ${parking}<br>
	휴무일 : ${holyday}<br>
	소개 : ${introduce}<br>
	공지사항 : ${notice}<br>
	<form method = "get">
		
		<a href = "storeUpdate">수정하기</a><br>
		<a href = "storeReservation">예약현황</a><br>
		<a href = "storeCapacitySelect">예약가능시간 확인</a><br>
	</form> --%>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>