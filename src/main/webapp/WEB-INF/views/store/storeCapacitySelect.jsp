<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<!-- 이 페이지는 전면수정 필요  -->
	<table>
		<tr>
			<td>날짜</td>
			<td>예약 가능시간</td>
			<td>예약 건수</td>
			<td>좌석 수</td>
		</tr>
		<tr>
		<c:forEach var="i" items="${capaList }" varStatus="no">
			<tr>
				<td>${i.day } </td>
				<td>
				<table>
					<tr>
						<td>오전</td><td>1시</td><td>2시</td><td>3시</td><td>4시</td><td>5시</td><td>6시</td>
									<td>7시</td><td>8시</td><td>9시</td><td>10시</td><td>11시</td><td>12시</td>
					</tr>
					<tr>
						<td>오전</td>
						<c:forEach var = "j" varStatus="no2" begin="1" end="12"> 
							<td>
								<c:forEach varStatus = "no3" begin = "1" end = "${fn:length(timeList[no.index]) }">
									<c:set var = "check" value = "${timeList[no.index][no3.index] }"/>  
									<c:choose>
										<c:when test="${fn:contains(check, no2.count)}">o</c:when>
										<c:otherwise>x</c:otherwise>
									</c:choose>
								</c:forEach>
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>오후</td><td>1시</td><td>2시</td><td>3시</td><td>4시</td><td>5시</td><td>6시</td>
									<td>7시</td><td>8시</td><td>9시</td><td>10시</td><td>11시</td><td>12시</td>
					</tr>
					<tr>
						<td>오후</td>
						<c:forEach var = "j" varStatus="no2" begin="1" end="12">
							<td>
								<c:forEach varStatus = "no3" begin = "1" end = "${fn:length(timeList[no.index])  }">
									<c:set var = "check" value = "${timeList[no.index][no3.index] }"/>  
									<c:choose>
										 <c:when test="${fn:contains(check, no2.count+12)}"><td>o</td></c:when>
										 	<c:otherwise><td>x</td></c:otherwise>
									</c:choose>
								</c:forEach>
							</td>
						</c:forEach>
					</tr>
				</table>
				</td>
				<td>${i.capacity}</td>
				<td>${i.seat}</td>
				<td><a href="storeCapacityUpdate?day=${i.day }&storeNo=${i.storeNo}">수정하기</a></td>
				<td><a href="storeCapacityUpdatePro?day=${i.day }&storeNo=${i.storeNo}">삭제하기</a></td>
			</tr>
		</c:forEach> 
	</table>	
	<br>
				<a href="storeCapacityInsert?storeNo=${storeNo}">새로운 예약가능시간 설정 등록하기</a>
				<br>
				<a href = >일괄 등록(미구현)</a>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>