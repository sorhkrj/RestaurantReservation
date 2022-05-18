<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardUpdateCheck</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<form action="serviceBoardUpdate" method="post">
		<table border="1">
			<tr>
				<th colspan="2">제목 글을 지웁니다</th>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인"/>
					<input type="reset" value="취소"/> 
				</td>
			</tr>
		</table>
	</form>
	<hr>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>