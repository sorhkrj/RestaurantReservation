<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	사진 : ${photo }<br>
	위치 : ${location }<br>
	분류 : ${category}	<br>
	전화번호 : ${store_phone}<br>
	주차장 : ${parking}<br>
	휴무일 : ${holyday}<br>
	소개 : ${introduce}<br>
	공지사항 : ${notice}<br>
	<a href = "/store/storeUpdate">수정하기</a><br>
	<a href = "/store/storeReservation">예약현황</a><br>
	<a href = "/store/storeCapacitySelect">예약가능시간 확인</a><br>
	
</body>
</html>