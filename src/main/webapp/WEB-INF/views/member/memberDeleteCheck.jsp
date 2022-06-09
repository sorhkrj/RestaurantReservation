<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
        // 비밀번호 미입력시 경고창
       <c:if test="${msg == false}">
		  alert("비밀번호가 맞지 않습니다.");
	   </c:if>
    </script>

<title>회원탈퇴</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp" />

	<form action="memberDelete" method="post">
		<div class="container mt-3 p-3" id="form">
			<div class="row">
				<h2 class="text-center">회원탈퇴</h2>
				<div class="input-group mb-3">
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">비밀번호</span> <input
							type="password" class="form-control" name="password"><input
							type="hidden" class="form-control" name="id" value="${id}">
					</div>
				</div>
				<div class="row text-center">
					<div class="container mt-3">
						<input type="submit" value="확인" class="btn btn-primary"  > <input
							type="reset" value="취소" class="btn btn-primary">
					</div>
				</div>
			</div>
		</div>
	</form>
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>