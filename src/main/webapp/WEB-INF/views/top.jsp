<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/script/top.js"></script>
	<title>Top Border</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<button id="custom_toggler" onclick="collapseAction()" class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="navbar-collapse collapse" id="custom_collapse">
					<ul class="navbar-nav">
						<c:if test="${not empty sessionScope.nickName}">
							<li>
								<div class="nav-item">
									<div class="nav-link active">${sessionScope.nickName}님</div>
								</div>
							</li>
						</c:if>
						<sec:authorize access="isAnonymous()">
							<li class="nav-item">
								<form:form action="${pageContext.request.contextPath}/signin" method="get">
									<input type="submit" value="로그인" class="btn nav-link active"/>
								</form:form>
							</li> <!-- 회원, 기업, 관리자 -->
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<form:form action="${pageContext.request.contextPath}/logout" method="post">
								<li class="nav-item">
									<input type="submit" value="로그아웃" class="btn nav-link active"/>
								</li>
							</form:form> <!-- 회원, 기업, 관리자 -->
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/member/memberSelect" class="nav-link active">내 정보</a>
							</li> <!-- 회원 -->
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_MEMBER')">
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/reservation/myReservationList" class="nav-link active">예약 정보</a>
							</li> <!-- 회원 -->
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_MANAGER')">
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/store/myStore" class="nav-link active">지점 관리</a>
							</li> <!-- 기업 -->
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_MANAGER')">
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/store/storeAnalysis" class="nav-link active">분석 현황</a>
							</li> <!-- 기업 -->
						</sec:authorize>
						<sec:authorize access="permitAll()">
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardMain" class="nav-link active">고객 센터</a>
							</li> <!-- 회원, 기업, 관리자 -->
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/admin/searchMember" class="nav-link active">전체 회원관리</a>
							</li> <!-- 관리자 -->
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/admin/searchStore" class="nav-link active">전체 지점관리</a>
							</li> <!-- 관리자 -->
						</sec:authorize>
					</ul>
				</div>
				<a href="/RestaurantReservation" class="navbar-brand">RRS</a>
			</div>
		</nav>
		<div class="mt-2 mb-2">
			<form action="${pageContext.request.contextPath}/searchResult" method="get" class="d-flex">
				<input type="text" name="search" placeholder="검색할 내용" class="form-control me-2"/>
				<input type="submit" value="검색" class="btn btn-outline-dark"/>
			</form>
		</div>
	</div>
</body>
</html>