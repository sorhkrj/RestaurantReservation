<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<h2 class="text-center">회원가입</h2>
		<form action="memberInsertPro" method ="post">
			<table border="1">
				<tr>
					<td>
						아이디
						<input type="text" class="form-control" name="id">
					</td>
				</tr>
				<tr>
					<td>
						비밀번호
						<input type="password" class="form-control" name="password">
					</td>
				</tr>
				<tr>
					<td>
						이름
						<input type="text" class="form-control" name="name">
					</td>
				</tr>
				<tr>
					<td>
						전화번호
						<input type="text" class="form-control" name="phone">
					</td>
				</tr>
				<tr>
					<td>
						별명
						<input type="text" class="form-control" name="nickname">
					</td>
				</tr>
				<tr>
					<td>
						<input type = "submit" value="확인" class="btn btn-primary">
						<input type = "reset" value = "취소" class="btn btn-primary">
					</td>
				</tr>
			</table>
		</form>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
