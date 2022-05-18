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
	<form action="serviceBoardInsertPro" method="post">
		<table border="1">
			<tr>
				<th colspan="2">문의글 입력</th>
			</tr>
			<tr>
				<th>문의글 제목</th><td><input type="text"/></td>
			</tr>
			<tr>
				<th>문의글 작성자</th><td>작성자</td>
			</tr>
			<tr>
				<th colspan="2">문의글 내용</th>
			</tr>
			<tr>
				<td colspan="2"><textarea id="" cols="" rows=""/>문의글</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="문의글 쓰기"/>
					<input type="reset" value="취소"/>
					<input type="button" value="돌아가기" onclick="location.href='serviceBoardMain'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>