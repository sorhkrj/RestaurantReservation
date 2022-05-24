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
	<form action="loginPro" method="post" class="w3-container">
		<table border="1">
			<tr>
				<td align="right" width="50">
					<p><label>ID</label></p>
					<p><label>PASSWORD</label></p>
				</td>
				<td align="left" width="250">
					<p><input type="text" name="id" class="w3-input" autofocus required></p>
					<p><input type="password" name="password" class="w3-input" required></p>
				</td>
				<td width="150">
					<input type="submit" value="로그인" class="w3-button w3-white w3-border w3-border-blue w3-round-large"/>
					<c:if test="${not empty loginFail}">
						"아이디 또는 비밀번호를 잘못 입력했습니다. 다시 확인 후 입력해 주세요."
					</c:if>
				</td>
			</tr>
		</table>
	</form>
	<form method="get" class="w3-container">
		<table border="1">
			<tr>
				<td align="center" width="500" colspan="3">
					<input type="submit" value="일반 회원가입" formaction="memberInsert" class="w3-button w3-white w3-border w3-border-blue w3-round-large"/>
				</td>
			</tr>
			<tr>
				<td align="center" width="500" colspan="3">
					<input type="submit" value="기업 회원가입" formaction="memberInsertEnterprise" class="w3-button w3-white w3-border w3-border-blue w3-round-large"/>
				</td>
			</tr>
		</table>
	</form>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>