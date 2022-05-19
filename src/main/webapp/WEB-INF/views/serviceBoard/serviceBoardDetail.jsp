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
			<td>${selectDetail.serviceNo }</td>
			<th>작성자</th>
			<td>${selectDetail.id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${selectDetail.title }</td>
			<th>작성일</th>
			<td>${selectDetail.regDate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${selectDetail.views }</td>
			<th>답변여부</th>
			<td>답변여부</td>
		</tr>
		<tr>
			<th colspan="4">내용</th>
		</tr>
		<tr>
			<td colspan="4">${selectDetail.content }</td>
		</tr>
		<tr>
			<td colspan="4">
				<a href="serviceBoardUpdateCheck?serviceNo=${selectDetail.serviceNo }&id=${selectDetail.id }">수정하기</a>
				<a href="serviceBoardDeleteCheck?serviceNo=${selectDetail.serviceNo }">삭제하기</a>
				<a href="serviceBoardMain">뒤로가기</a>
			</td>
		</tr>
	</table>
	<hr>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>