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
	
	사진 : ${storeVO.photo }<br>
	위치 : ${storeVO.location }<br>
	분류 : ${storeVO.category}	<br>
	전화번호 : ${storeVO.store_phone}<br>
	주차장 : ${storeVO.parking}<br>
	휴무일 : ${storeVO.holyday}<br>
	소개 : ${storeVO.introduce}<br>
	공지사항 : ${storeVO.notice}<br>

		<a href = "storeUpdate">수정하기</a><br>
		<a href = "storeReservation">예약현황</a><br>
		<a href = "storeCapacitySelect">예약가능시간 확인</a><br>

<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>