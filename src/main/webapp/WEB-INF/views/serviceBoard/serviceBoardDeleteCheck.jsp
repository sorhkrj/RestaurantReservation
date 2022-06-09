<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardDeleteCheck</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	table{
		border: 1px solid black;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<form action="serviceBoardDeletePro" method="post">
			<div class="mt-3">
				<div class="row">
					<div class="mb-3">
						<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">${serviceBoardVO.title } 글을 지웁니다<br>비밀번호를 입력해주세요</label>
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">Password</label>
						<input type="password" name="password" required="required" autofocus="autofocus" placeholder="비밀번호를 입력해주세요" class="form-control"/>
					</div>
					<div class="mt-3">
						<input type="hidden" name="serviceNo" value="${serviceBoardVO.serviceNo}"/>
						<input type="submit" value="확인" class="form-control input-sm btn btn-primary mb-3">
						<input type="reset" value="취소" class="form-control input-sm btn btn-outline-danger mb-3">
						<a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardDetail?serviceNo=${serviceBoardVO.serviceNo}" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
					</div>
				</div>
			</div>
		</form>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>