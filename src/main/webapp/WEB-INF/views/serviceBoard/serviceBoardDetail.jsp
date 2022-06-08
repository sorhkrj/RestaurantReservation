<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardDetail</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
	table {
		text-align: center;
	}
</style>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<label class="col-sm-12 btn btn-outline-dark disabled mt-3" style="font-size: 20pt; font-weight: bold;">상세 보기</label>
		<div class="mt-3">
			<div class="row">
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">번호</label>
					<span class="form-control">${serviceBoardVO.serviceNo }</span>
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">작성자</label>
					<span class="form-control">${serviceBoardVO.nickName }</span>
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">제목</label>
					<span class="form-control">${serviceBoardVO.title }</span>
				</div>
		 		<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">작성일</label>
					<span class="form-control">${serviceBoardVO.regDate }</span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">조회수</label>
					<span class="form-control">${serviceBoardVO.views }</span>
				</div>
				<div class="input-group mb-3">
		 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">답변여부</label>
					<span class="form-control">
						<c:if test="${replyVO != null }">
							Y
						</c:if>
						<c:if test="${replyVO == null }">
							N
						</c:if>
					</span>
				</div>
			</div>
			<label class="col-sm-12 btn btn-outline-dark disabled" style="font-size: 20pt; font-weight: bold;">내용</label>
			<div class="input-group mt-3">
				<span style="height: 100px;" class="form-control">${serviceBoardVO.content }</span>
			</div>
		</div>
		
		<sec:authorize access="hasAnyRole('MEMBER', 'MANAGER', 'ADMIN')">
			<div class="mt-3">
				<c:if test="${memberVO.id == serviceBoardVO.id}">
					<a class="form-control input-sm btn btn-primary mb-3" href="serviceBoardUpdateCheck?serviceNo=${serviceBoardVO.serviceNo }">수정하기</a>
					<a href="serviceBoardDeleteCheck?serviceNo=${serviceBoardVO.serviceNo }" class="form-control input-sm btn btn-outline-danger mb-3">삭제하기</a>
				</c:if>
				<a href="serviceBoardMain" class="form-control input-sm btn btn-outline-danger mb-3">뒤로가기</a>
			</div>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ADMIN')"> 
		<c:if test="${replyVO == null}">
			<form action="replyInsertPro" method="post">
				<label class="col-sm-12 btn btn-outline-dark disabled mt-3" style="font-size: 20pt; font-weight: bold;">답변 등록</label>
				<div class="mt-3">
					<div class="row">
				 		<div class="input-group mb-3">
				 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">관리자 별명</label>
							<span class="form-control">${memberVO.nickname }</span>
						</div>
					</div>
					<label class="col-sm-12 btn btn-outline-dark disabled" style="font-size: 20pt; font-weight: bold;">답변 내용</label>
					<div class="input-group mt-3">
						<span style="margin: 0; padding: 0; height: 100px;" class="form-control"><textarea name="answer" required="required" rows="3" autofocus="autofocus" maxlength="160" style="height:100%; width: 100%;"></textarea></span>
					</div>
				</div>
				<div class="row col text-center">
				   <div class="container mt-3">
				   	  <input type="hidden" name="serviceNo" value="${serviceBoardVO.serviceNo }">
					  <input type="hidden" name="id" value="${memberVO.id }">
					  <input type="hidden" name="nickName" value="${memberVO.nickname }">
				   	  <input type="submit" value="답변 등록" class="form-control input-sm btn btn-primary mb-3"/>
				   	  <input type="reset" value="취소" class="form-control input-sm btn btn-outline-danger mb-3"/>
				   	  <a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardMain" class="form-control input-sm btn btn-outline-primary mb-3">돌아가기</a>
				   </div>
				</div>
			</form>
		</c:if>
		</sec:authorize>
		
		<c:if test="${replyVO != null}">
			<form action="replyUpdatePro" method="post">
			
				<sec:authorize access="hasRole('ADMIN')"> 
					<label class="col-sm-12 btn btn-outline-dark disabled mt-3" style="font-size: 20pt; font-weight: bold;">답변 수정 삭제</label>
				</sec:authorize>
				
				<div class="mt-3">
					<div class="row">
				 		<div class="input-group mb-3">
				 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">관리자 별명</label>
							<span class="form-control">${replyVO.nickName }</span>
						</div>
						<div class="input-group mb-3">
				 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">답변 내용</label>
							<span class="form-control">${replyVO.answer }</span>
						</div>
					</div>
					
					<sec:authorize access="hasRole('ADMIN')">
						<label class="col-sm-12 btn btn-outline-dark disabled" style="font-size: 20pt; font-weight: bold;">답변 수정 입력</label>
						<div class="input-group mt-3">
							<span style="margin: 0; padding: 0; height: 100px;" class="form-control"><textarea name="answer" rows="3" autofocus="autofocus" maxlength="160" style="height:100%; width: 100%;"></textarea></span>
						</div>
					</sec:authorize>
					
				</div>
					
				<sec:authorize access="hasRole('ADMIN')">
					<div class="row col text-center">
					   <div class="container mt-3">
					   	  <input type="hidden" name="replyNo" value="${replyVO.replyNo }"/>
						  <input type="hidden" name="serviceNo" value="${replyVO.serviceNo }"/>
					   	  <input type="submit" value="답변 수정" class="form-control input-sm btn btn-primary mb-3"/>
					   	  <input type="submit" formaction="replyDeletePro" value="답변 삭제" class="form-control input-sm btn btn-outline-danger mb-3"/>
					   	  <a href="${pageContext.request.contextPath}/serviceBoard/serviceBoardMain" class="form-control input-sm btn btn-outline-primary mb-3">돌아가기</a>
					   </div>
					</div>
				</sec:authorize>
				
			</form>
		</c:if>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>