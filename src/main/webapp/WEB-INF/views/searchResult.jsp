<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>search Result</title>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/top.jsp"/>
		<c:choose>
			<c:when test="${empty storeList}">
				'${param.search}' 검색 결과를 찾을 수 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="store" items="${storeList}">
					<div class="w3-container">
					<div class="w3-container w3-border w3-large">
					<div class="w3-left-align">${store.storeName}</div>
					<div class="w3-left-align">${store.introduce}</div>
					<div class="w3-right-align">
					<c:if test="${not empty sessionScope.id}">
						<a href="review/storeDetailReviewMain?storeNo=${store.storeNo}" type="button"class="w3-button w3-white w3-border w3-border-blue w3-round-large">지점보기</a>
					</c:if>
					</div>
					</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:import url="/WEB-INF/views/footer.jsp"/>
	</div>
</body>
</html>