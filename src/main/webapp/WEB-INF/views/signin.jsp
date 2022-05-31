<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script>
</script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>signin</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<td>
					<form:form action="login" method="post">
						<table class="table table-striped">
							<tr>
								<td>
									<label>ID</label>
								</td>
								<td>
									<input type="text" name="id" autofocus required>
								</td>
								<td rowspan="2">
									<input type="submit" value="로그인"/>
					  			</td>
							</tr>
							<tr>
								<td>
									<label>PASSWORD</label>
								</td>
								<td>
									<input type="password" name="password" required>
								</td>
							</tr>
						</table>
					</form:form>
				</td>
			</tr>
			<tr>
				<td>
					<a href = "member/memberInsert"> 일반 회원가입</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href = "member/memberInsertEnterprise"> 기업 회원가입</a>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>