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
				<th>제목</th><td><input type="text" name="title" required="required" autofocus="autofocus"/></td>
			</tr>
			<tr>
				<th>작성자</th><td>${serviceBoardVO.nickName }</td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td colspan="2"><textarea name="content" cols="32" rows="5" required="required"></textarea></td>
			</tr>
			<tr>
				<td>
					<input type="hidden" name="serviceNo" value="${serviceBoardVO.serviceNo }"/>
					<input type="submit" value="작성완료">
					<input type="reset" value="취소">
					<input type="button" value="돌아가기" onclick="location.href='serviceBoardDetail?serviceNo=${serviceBoardVO.serviceNo}'">
				</td>
			</tr>
		</table>
	</form>
	<hr>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>