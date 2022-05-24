<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<form:form action="serviceBoardUpdatePro" modelAttribute="serviceBoardVO">
		<table border="1">
			<tr>
				<th>제목</th><td><form:input path="title" required="required" autofocus="autofocus"/></td>
			</tr>
			<tr>
				<th>작성자</th><td>${serviceBoardVO.nickName }</td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td colspan="2"><form:textarea path="content" cols="32" rows="5" required="required"/></td>
			</tr>
			<tr>
				<td>
					<form:hidden path="serviceNo" value="${serviceBoardVO.serviceNo }"/>
					<form:button>작성완료</form:button>
					<input type="reset" value="취소">
					<input type="button" value="돌아가기" onclick="location.href='serviceBoardDetail?serviceNo=${serviceBoardVO.serviceNo}'">
				</td>
			</tr>
		</table>
	</form:form>
	<hr>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>