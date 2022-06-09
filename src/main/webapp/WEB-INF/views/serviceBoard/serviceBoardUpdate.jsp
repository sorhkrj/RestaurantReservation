<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardUpdate</title>
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
	<form:form action="serviceBoardUpdatePro" modelAttribute="serviceBoardVO">
		<div class="mt-3">
			<div class="row">
				<div class="mb-3">
					<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">문의글 수정</label>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">제목</label>
					<form:input path="title" required="required" maxlength="6" autofocus="autofocus" class="form-control"/>
				</div>
				<div class="input-group mb-3">
					<label class="btn btn-outline-dark disabled me-2" style="width: 150px">작성자</label>
					<span class="form-control">${serviceBoardVO.nickName }</span>
				</div>
			</div>
			<label class="col-sm-12 btn btn-outline-dark disabled" style="font-size: 20pt; font-weight: bold;">문의글 내용</label>
			<div class="input-group mt-3">
				<span style="margin: 0; padding: 0; height: 100px;" class="form-control"><form:textarea path="content" required="required" rows="3" autofocus="autofocus" maxlength="160" style="height:100%; width: 100%;"></form:textarea></span>
			</div>
			<div class="mt-3">
				<form:hidden path="serviceNo" value="${serviceBoardVO.serviceNo }"/>
				<form:button class="form-control input-sm btn btn-primary mb-3">작성완료</form:button>
				<input type="reset" value="취소" class="form-control input-sm btn btn-outline-danger mb-3">
				<a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardDetail?serviceNo=${serviceBoardVO.serviceNo}" class="form-control input-sm btn btn-outline-primary mb-3">돌아가기</a>
			</div>
		</div>
	</form:form>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>