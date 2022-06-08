<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<div class="container">
	<div class="mb-3">
		<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">지점 예약 시간 관리</label>
	</div>
	<a href="storeCapacityInsert?storeNo=${storeNo}" class="btn btn-outline-dark mb-3">예약가능시간 설정</a>
	<a href ="storeCapacityMonth?storeNo=${storeNo}" class="btn btn-outline-dark mb-3">예약가능시간 일괄 설정(한달)</a>
	<table class="table">
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
				<table class="table">
					<tr>
						<td>오전</td>
						<c:forEach varStatus="time" begin="1" end="12">
							<td>
								${time.count}시
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>구분</td>
							<c:forEach var = "j" varStatus="no2" begin="1" end="12">
								<td>
									<c:forEach varStatus = "timeListLength" begin="0" end ="${fn:length(timeList[no.index]) }">
										<c:set var="check" value="${timeList[no.index][timeListLength.index] }"/>
										<c:choose> 
											<c:when test="${check eq no2.count}">오픈</c:when>
										</c:choose>	
									</c:forEach>
								</td>
							</c:forEach>
					</tr>
					<tr>
						<td>오후</td>
						<c:forEach varStatus="time" begin="1" end="12">
							<td>
								${time.count}시
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td>구분</td>
							<c:forEach var = "j" varStatus="no2" begin="13" end="24">
								<td>
									<c:forEach varStatus = "timeListLength" begin="0" end ="${fn:length(timeList[no.index]) }">
										<c:set var="check" value="${timeList[no.index][timeListLength.index] }"/>
										<c:choose> 
											<c:when test="${check eq no2.current}">오픈</c:when>
										</c:choose>	
									</c:forEach>
								</td>
							</c:forEach>
					</tr>
				</table>
				</td>
				<td>${i.capacity}</td>
				<td>${i.seat}</td>
				<td><a href="storeCapacityUpdate?day=${i.day }&storeNo=${i.storeNo}" class="btn btn-outline-dark">수정하기</a></td>
				<td><a href="storeCapacityDeletePro?day=${i.day }&storeNo=${i.storeNo}" class="btn btn-outline-dark">삭제하기</a></td>
			</tr>
		</c:forEach> 
	</table>	
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>