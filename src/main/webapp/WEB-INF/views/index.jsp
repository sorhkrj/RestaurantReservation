<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
<%
	String center = "searchResult.jsp";
%>
	<table border="1">
		<tr height="50">
			<td width="500">
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		<tr height="700">
			<td width="500">
				<jsp:include page="<%=center%>"/>
			</td>
		</tr>
		<tr height="60">
			<td width="500">
				<jsp:include page="footer.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>