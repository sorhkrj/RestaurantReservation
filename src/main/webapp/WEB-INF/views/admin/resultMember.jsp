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
<title>회원검색</title>
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/top.jsp"/>
		<h3>회원아이디: &nbsp;</h3>
		<form action="resultMember">
			<input type="text" name="id" placeholder="회원아이디를 입력해주세요." >
			<input type="submit" value="검색하기">
			<h2 class="text-center">회원정보</h2>
		</form>
		<table class="table table-striped">
			<c:choose>
				<c:when test="${empty memberList}">
					'${id}' 검색 결과를 찾을 수 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach var="member" items="${memberList}">
						<tr>
							<td>
								${member.id}<br>
							</td>
							<td align="right">
								<form action = "memberAdmin" method ="get">
									<input type="hidden" name = "id" value = "${member.id}">
									<input class="btn btn-outline-dark" type="submit" value ="이동" >
								</form>
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