<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardDetail</title>
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
			<th colspan="4">상세 보기</th>
		</tr>
		<tr>
			<th>번호</th>
			<td>번호</td>
			<th>작성자</th>
			<td>작성자</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>제목</td>
			<th>등록일</th>
			<td>등록일</td>
		</tr>
		<tr>
			<th colspan="2">조회수</th>
			<td colspan="2">조회수</td>
		</tr>
		<tr>
			<th colspan="4">내용</th>
		</tr>
		<tr>
			<td colspan="4">내용</td>
		</tr>
		<tr>
			<td colspan="4">
				<form action="serviceBoardUpdateCheck" method="post">
					<input type="submit" value="수정하기">
				</form>
				<form action="serviceBoardDeleteCheck" method="post">
					<input type="submit" value="삭제하기">
				</form>
				<input type="button" value="뒤로가기" onclick="location.href='serviceBoardMain'"/>
			</td>
		</tr>
	</table>
	<hr>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>