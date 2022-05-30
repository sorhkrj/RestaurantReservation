<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<form:form modelAttribute = "storeVO" action ="storeUpdatePro">
		음식점 : <td><form:input path = "storeName" /></td><br>
		사  진 : <td><form:input path = "photo" /></td><br>
		위  치 : <td><form:input path = "location" /></td><br>
		분  류 : <td><form:input path = "category" /></td><br>
		연락처 : <td><form:input path = "store_phone" /></td><br>
		주차장 : <td><form:input path = "parking" /></td><br>
		휴무일 : <td><form:input path = "holyday" /></td><br>
		소  개 : <td><form:input path = "introduce" /></td><br>
		공  지 : <td><form:input path = "notice" /></td><br><br>
		<form:button>수정하기</form:button>
		<input type ="reset" value ="취소">
	</form:form>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>