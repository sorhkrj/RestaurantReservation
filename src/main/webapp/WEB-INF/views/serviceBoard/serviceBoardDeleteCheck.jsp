<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardDeleteCheck</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	table{
		border: 1px solid black;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<form action="serviceBoardDeletePro" method="post">
			<table class="table table-striped">
				<tr>
					<th colspan="2">${serviceBoardVO.title } 글을 지웁니다<br>비밀번호를 입력해주세요</th>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" required="required"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="serviceNo" value="${serviceBoardVO.serviceNo}"/>
						<input type="submit" value="확인">
						<input type="reset" value="취소">
						<input type="button" value="돌아가기" onclick="location.href='serviceBoardDetail?serviceNo=${serviceBoardVO.serviceNo}'">
					</td>
				</tr>
			</table>
		</form>
		<hr>
		</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>