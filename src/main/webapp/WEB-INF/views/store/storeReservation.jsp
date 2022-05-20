<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp" />
	<table>
		<tr>
			<td>순번</td>
			<td>이름</td>
			<td>일자</td>
			<td>시간</td>
			<td>전화번호</td>
			<td>인원</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="i" items="${reservationVO }" varStatus="no">
			<tr>
				<td>${no.count }</td>
				<td>${i.visitName }</td>
				<td>${i.visitDay}</td>
				<td>${i.visitTime}</td>
				<td>${i.visitPhone}</td>
				<td>${i.people}</td>
				<td><a href="storeReservationDeletePro?reserveNo=${i.reserveNo }&storeNo=${i.storeNo}">삭제하기</a></td>
			</tr>
		</c:forEach>
	</table>
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>