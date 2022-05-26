<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardDetail</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	table{
		border: 1px solid black;
	}
</style>
</head>
<body>
<div class="container">
<c:import url="/WEB-INF/views/top.jsp"/>
	<table class="table table-striped">
		<tr>
			<th colspan="4">상세 보기</th>
		</tr>
		<tr>
			<th>번호</th>
			<td>${serviceBoardVO.serviceNo }</td>
			<th>작성자</th>
			<td>${serviceBoardVO.nickName }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${serviceBoardVO.title }</td>
			<th>작성일</th>
			<td>${serviceBoardVO.regDate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${serviceBoardVO.views }</td>
			<th>답변여부</th>
			<td>
				<c:if test="${replyVO != null }">
					Y
				</c:if>
				<c:if test="${replyVO == null }">
					N
				</c:if>
			</td>
		</tr>
		<tr>
			<th colspan="4">내용</th>
		</tr>
		<tr>
			<td colspan="4">${serviceBoardVO.content }</td>
		</tr>
		<tr>
			<td colspan="4">
				<c:if test="${!(memberVO.memberLevel == 3) && memberVO.id == serviceBoardVO.id}">
					<a href="serviceBoardUpdateCheck?serviceNo=${serviceBoardVO.serviceNo }">수정하기</a>
					<a href="serviceBoardDeleteCheck?serviceNo=${serviceBoardVO.serviceNo }">삭제하기</a>
				</c:if>
				<a href="serviceBoardMain">뒤로가기</a>
			</td>
		</tr>
	</table>
	<hr>
	<c:if test="${memberVO.memberLevel == 3 && replyVO == null}">
		<form action="replyInsertPro" method="post">
			<table class="table table-striped">
				<tr>
					<th colspan="2">관리자 답변</th>
				</tr>
				<tr>
					<th>${memberVO.nickname }</th><td><textarea name="answer" cols="32" rows="5" required="required" autofocus="autofocus"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="serviceNo" value="${serviceBoardVO.serviceNo }">
						<input type="hidden" name="id" value="${memberVO.id }">
						<input type="hidden" name="nickName" value="${memberVO.nickname }">
						<input type="submit" value="답변 등록"/>
						<input type="reset" value="취소"/>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${replyVO != null}">
		<form action="replyUpdatePro" method="post">
			<table class="table table-striped">
				<tr>
					<th colspan="2">관리자 답변</th>
				</tr>
				<tr>
					<th>${replyVO.nickName }</th>
					<c:if test="${memberVO.memberLevel != 3 }">
						<td>${replyVO.answer }</td>
					</c:if>
					<c:if test="${memberVO.memberLevel == 3 }">
						<td><textarea name="answer" cols="32" rows="5" required autofocus>${replyVO.answer }</textarea></td>
					</c:if>
				</tr>
				<c:if test="${memberVO.memberLevel == 3 }">
					<tr>
						<td colspan="2">
							<input type="hidden" name="replyNo" value="${replyVO.replyNo }"/>
							<input type="hidden" name="serviceNo" value="${replyVO.serviceNo }"/>
							<input type="submit" value="답변수정"/>
							<input type="submit" formaction="replyDeletePro" value="답변삭제"/>
						</td>
					</tr>
				</c:if>
			</table>
		</form>
	</c:if>
<c:import url="/WEB-INF/views/footer.jsp"/>
</div>
</body>
</html>