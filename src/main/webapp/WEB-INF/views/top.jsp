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
<title>Top Border</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown">${sessionScope.nickName}</a>
							<ul class="dropdown-menu">
								<sec:authorize access="isAnonymous()">
									<li class="nav-item">
										<form:form action="${pageContext.request.contextPath}/signin" method="get">
											<input type="submit" value="로그인" class="dropdown-item"/>
										</form:form>
									</li> <!-- 회원, 기업, 관리자 -->
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<form:form action="${pageContext.request.contextPath}/logout" method="post">
										<li class="nav-item">
											<input type="submit" value="로그아웃" class="dropdown-item"/>
										</li>
									</form:form> <!-- 회원, 기업, 관리자 -->
								</sec:authorize>
							</ul>
						</li>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/member/memberSelect" class="nav-link active">내정보</a>
						</li> <!-- 회원 -->
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/reservation/myReservationList" class="nav-link active">예약정보</a>
						</li> <!-- 회원 -->
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_MANAGER')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/store/myStore" class="nav-link active">지점관리</a>
						</li> <!-- 기업 -->
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_MANAGER')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/store/storeAnalysis" class="nav-link active">분석현황</a>
						</li> <!-- 기업 -->
					</sec:authorize>
					<sec:authorize access="permitAll()">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardMain" class="nav-link active">고객센터</a>
						</li> <!-- 회원, 기업, 관리자 -->
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/member/searchMember" class="nav-link active">전체회원관리</a>
						</li> <!-- 관리자 -->
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/member/searchStore" class="nav-link active">전체지점관리</a>
						</li> <!-- 관리자 -->
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/store/menuDetail" class="nav-link active">테스트용</a>
						</li> <!-- 관리자 -->
					</sec:authorize>
				</ul>
				<a href="/RestaurantReservation" class="navbar-brand">RRS</a>
			</div>
		</nav>
		<div class="mt-2 mb-2">
		<form action="${pageContext.request.contextPath}/searchResult" method="get" class="d-flex">
			<input type="text" name="search" placeholder="검색할 내용" class="form-control me-2"/>
			<input type="submit" value="검색" class="btn btn-dark"/>
		</form>
		</div>
	</div>
</body>
</html>