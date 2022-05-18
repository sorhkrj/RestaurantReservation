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
	<table border="1">
		<tr>
			<th colspan="4">상세 보기</th>
		</tr>
		<tr>
			<th>번호</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>작성자</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text"/></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>등록일</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>조회수</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
		</tr>
		<tr>
			<td colspan="4"><textarea rows="" cols=""></textarea></td>
		</tr>
		<tr>
			<td colspan="6">
				<form action="serviceBoardInsert" method="post">
					<input type="submit" value="문의글 쓰기">
				</form>
			</td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td><input type="button" value="previous"></td>
			<td>1</td>
			<td><input type="button" value="next"></td>
		</tr>
	</table>
</body>
</html>