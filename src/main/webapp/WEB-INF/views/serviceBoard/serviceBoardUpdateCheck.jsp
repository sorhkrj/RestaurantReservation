<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardUpdateCheck</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	table{
		border: 1px solid black;
	}
</style>
</head>
<body>
<div class="container">
<c:import url="/WEB-INF/views/top.jsp"/>
	<form action="serviceBoardUpdate" method="post">
		<table class="table table-striped">
			<tr>
				<th colspan="2">비밀번호를 입력</th>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" required="required"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="serviceNo" value="${serviceNo}"/>
					<input type="submit" value="확인"/>
					<input type="reset" value="취소"/> 
					<input type="button" value="돌아가기" onclick="location.href='serviceBoardDetail?serviceNo=${serviceNo}'"/>
				</td>
			</tr>
		</table>
	</form>
	<hr>
<c:import url="/WEB-INF/views/footer.jsp"/>
</div>
</body>
</html>