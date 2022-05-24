<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>

	<form action = "storeAnalysisPro" method = "get">
		날짜 선택<br><br>
		<input type = "hidden" name = "storeNo" value = ${storeNo }>
		시작 <input type="date" name = "firstDay"><br>
		종료 <input type="date" name = "lastDay"><br>
		<input type="submit" value="선택완료">
	</form>


<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>