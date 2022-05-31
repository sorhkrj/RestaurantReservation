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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>Top Border</title>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<td>
					<div class="dropdown">
						<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
  							${sessionScope.nickName}
  						</button>
						<ul class="dropdown-menu">
							<sec:authorize access="isAnonymous()">
								<li><a href="${pageContext.request.contextPath}/signin">로그인</a></li> <!-- 회원, 기업, 관리자 -->
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<form:form action="logout" method="POST">
		    						<li><input type="submit" value="로그아웃"/></li>
								</form:form> <!-- 회원, 기업, 관리자 -->
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_USER')">
								<li><a href="${pageContext.request.contextPath}/member/memberSelect">내정보</a></li> <!-- 회원 -->
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_USER')">
							<li><a href="${pageContext.request.contextPath}/reservation/myReservationList">예약정보</a></li> <!-- 회원 -->
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MANAGER')">
							<li><a href="${pageContext.request.contextPath}/store/myStore">지점관리</a></li> <!-- 기업 -->
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MANAGER')">
							<li><a href="${pageContext.request.contextPath}/store/storeAnalysis">분석현황</a></li> <!-- 기업 -->
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
							<li><a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardMain">고객센터</a></li> <!-- 회원, 기업, 관리자 -->
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li><a href="${pageContext.request.contextPath}/member/searchMember">전체회원관리</a></li> <!-- 관리자 -->
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li><a href="${pageContext.request.contextPath}/member/searchStore">전체지점관리</a></li> <!-- 관리자 -->
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li><a href="${pageContext.request.contextPath}/store/menuDetail">테스트용</a></li> <!-- 관리자 -->
							</sec:authorize>
						</ul>
					</div>
				</td>
				<td>
					<form action="searchResult" method="get">
						<input type="text" name="search" placeholder="검색할 내용"/>
						<input type="submit" value="검색"/>
					</form>
				</td>
				<td>
					<a href="/RestaurantReservation">홈</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>