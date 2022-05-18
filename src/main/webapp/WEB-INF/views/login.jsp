<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp"/>
	<form action="#" class="w3-container">
		<table border="1">
			<tr>
				<td align="right" width="50">
					<p><label>ID</label></p>
					<p><label>PASSWORD</label></p>
				</td>
				<td align="left" width="250">
					<p><input class="w3-input" type="text"></p>
					<p><input class="w3-input" type="text"></p>
				</td>
				<td width="150">
					<button class="w3-button w3-white w3-border w3-border-blue w3-round-large">로그인</button>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<button onclick="#" class="w3-button w3-white w3-border w3-border-blue w3-round-large">일반 회원가입</button>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<button onclick="#" class="w3-button w3-white w3-border w3-border-blue w3-round-large">기업 회원가입</button>
				</td>
			</tr>
		</table>
	</form>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>