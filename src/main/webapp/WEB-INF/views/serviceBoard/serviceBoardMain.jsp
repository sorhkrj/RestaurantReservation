<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardMain</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<table border="1">
		<tr>
			<th colspan="6">음식점 이름</th>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>답변여부</th>
		</tr>
		<tr>
			<td colspan="6"><a href="serviceBoardDetail">DetailTest</a></td>
		</tr>
		<tr>
			<c:if test="${boardServiceList != null }">
				<c:forEach var="boardServiceList" items="${boardServiceList}">
					<td>${boardServiceList.serviceNo }</td>
					<td>${boardServiceList.id }</td>
					<td>${boardServiceList.title }</td>
					<td>${boardServiceList.content }</td>
					<td>${boardServiceList.views }</td>
					<td>${boardServiceList.regDate }</td>
				</c:forEach>
			</c:if>
		</tr>
		<tr>
			<td colspan="6">
				<form action="serviceBoardInsert" method="post">
					<input type="submit" value="문의글 쓰기">
				</form>
			</td>
		</tr>
	</table>
	<hr>
	<table border="1">
		<tr>
			<td><input type="button" value="previous"></td>
			<td>1</td>
			<td><input type="button" value="next"></td>
		</tr>
	</table>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>