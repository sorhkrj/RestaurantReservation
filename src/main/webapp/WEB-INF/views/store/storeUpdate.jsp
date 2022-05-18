<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>

	<%-- <form:form modelAttribute = "storeVO" action ="storeUpdatePro">
		<td>${day} </td>
		<td><form:input path = "photo" /></td>
		<td><form:input path = "location" /></td>
		<td><form:input path = "category" /></td>
		<td><form:input path = "store_phone" /></td>
		<td><form:input path = "parking" /></td>
		<td><form:input path = "holyday" /></td>
		<td><form:input path = "introduce" /></td>
		<td><form:input path = "notice" /></td>
		<form:button>수정하기</form:button>
	</form:form> --%>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>