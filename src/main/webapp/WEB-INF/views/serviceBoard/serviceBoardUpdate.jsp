<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardUpdate</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<form action="serviceBoardUpdatePro" method="post">
		<table border="1">
			<tr>
				<th>제목</th>
			</tr>
			<tr>
				<th>제목</th>
			</tr>
			<tr>
				<th>내용</th>
			</tr>
			<tr>
				<td>
					<input type="submit" value="작성완료">
					<input type="reset" value="취소">
					<input type="button" value="돌아가기" onclick="location.href='serviceBoardDetail'">
				</td>
			</tr>
		</table>
	</form>
	<hr>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>