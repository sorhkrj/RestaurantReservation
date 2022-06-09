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
<title>검색 결과</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<div class="mt-3">
			<div class="row">
				<div class="mb-3">
					<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">검색 결과</label>
				</div>
					<div class="container">
						<table class="table">
							<c:choose>
								<c:when test="${empty storeList}">
									'${param.search}' 검색 결과를 찾을 수 없습니다.
								</c:when>
								<c:otherwise>
									<thead>
										<tr>
											<th>지점명</th>
											<th>위치</th>
											<th>전화번호</th>
											<th>소개글</th>
											<th>선택</th>
										</tr>
									</thead>
									<c:forEach var="store" items="${storeList}">
										<tr>
											<td>${store.storeName}</td>
											<td>${store.location}</td>
											<td>${store.store_phone}</td>
											<td>${store.introduce}</td>
											<td>
												<a href="review/storeDetailReviewMain?storeNo=${store.storeNo}" type="button" class="btn btn-outline-dark">지점 보기</a>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
			</div>
		</div>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>