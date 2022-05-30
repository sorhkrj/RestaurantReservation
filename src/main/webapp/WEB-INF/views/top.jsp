<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>Top Border</title>
</head>
<body>
	<div class="container">
		<div class="w3-dropdown-hover">
			<div class="w3-button w3-gray">${sessionScope.nickName}</div>
				<div class="w3-dropdown-content w3-bar-block w3-border">
				<sec:authorize access="isAnonymous()">
						<a href="${pageContext.request.contextPath}/loginForm" class="w3-bar-item w3-button">로그인</a> <!-- 회원, 기업, 관리자 -->
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
						<form:form action="logout" method="POST">
    						<input type="submit" value="로그아웃" />
						</form:form> <!-- 회원, 기업, 관리자 -->
				</sec:authorize>
				
					<a href="${pageContext.request.contextPath}/member/memberSelect" class="w3-bar-item w3-button">내정보</a> <!-- 회원, 관리자 -->
					<a href="${pageContext.request.contextPath}/reservation/myReservationList" class="w3-bar-item w3-button">예약정보</a> <!-- 회원 -->
					<a href="${pageContext.request.contextPath}/store/myStore" class="w3-bar-item w3-button">지점관리</a> <!-- 기업 -->
					<a href="${pageContext.request.contextPath}/store/storeAnalysis" class="w3-bar-item w3-button">분석현황</a> <!-- 기업 -->
					<a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardMain" class="w3-bar-item w3-button">고객센터</a> <!-- 회원, 기업, 관리자 -->
					<a href="${pageContext.request.contextPath}/member/searchMember" class="w3-bar-item w3-button">전체회원관리</a> <!-- 관리자 -->
					<a href="${pageContext.request.contextPath}/member/searchStore" class="w3-bar-item w3-button">전체지점관리</a> <!-- 관리자 -->
					<a href="${pageContext.request.contextPath}/store/menuDetail" class="w3-bar-item w3-button">테스트용</a> <!-- 관리자 -->
				</div>
			</div>
			<form action="searchResult" method="get">
				<input type="text" name="search" placeholder="검색할 내용" class="w3-input w3-border"/>
				<input type="submit" value="검색" class="w3-input w3-border"/>
			</form>
			<a href="/RestaurantReservation" class="w3-button w3-gray">홈</a>
	</div>
</body>
</html>