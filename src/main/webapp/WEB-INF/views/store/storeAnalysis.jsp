<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>     
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
	<form action = "storeAnalysisPro" method = "get">
		<h2>날짜 선택</h2>
		<table class="table table-striped">
			<tr>
				<td>시작</td>
				<td><input type="date" name = "firstDay"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="date" name = "lastDay"></td>
			</tr>
			<tr>
				<td colspan = "2"><input type="submit" value="선택완료"><td>
			</tr>
		</table>
	</form>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>