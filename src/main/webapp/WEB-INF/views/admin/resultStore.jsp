<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>음식점검색</title>
</head>
<body>
<div class="container">
<c:import url="/WEB-INF/views/top.jsp"/>
<h3>음식점: &nbsp;</h3>
	<form action="resultStore" method="get">
		<input type="text" name="storeName" placeholder="음식점을 입력해주세요." >
		<input type="submit" value="검색하기"><br>
	</form>
	<h2 class="text-center">음식점정보</h2>
	<table class="table table-striped">
			<c:choose>
				<c:when test="${empty storeList}">
					'${storeName}' 검색 결과를 찾을 수 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach var="store" items="${storeList}">
						<tr>
							<td>
								${store.introduce}
							</td>
							<td align="right">
								<a href="" type="button"class="w3-button w3-white w3-border w3-border-blue w3-round-large">지점보기</a>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>


<c:import url="/WEB-INF/views/footer.jsp"/>
</div>
</body>
</html>