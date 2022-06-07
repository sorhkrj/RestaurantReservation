<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<table class="table table-striped">
		<tr>
			<th colspan="7">문의글 전체 목록 / 문의글 개수: ${total }</th>
		</tr>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>답변여부</th>
		</tr>
		<c:if test="${selectList.size() != 0}">
			<c:forEach var="i" begin="0" end="${selectList.size()-1 }">
				<tr>
					<td>${selectList.get(i).serviceNo }</td>
					<td>${selectList.get(i).nickName }</td>
					<td><a href="serviceBoardDetail?serviceNo=${selectList.get(i).serviceNo }">${selectList.get(i).title }</a></td>
					<td>${selectList.get(i).content }</td>
					<td>${selectList.get(i).views }</td>
					<td>${selectList.get(i).regDate }</td>
					<c:if test="${replyList.get(i) != null }">
						<c:if test="${not empty replyList.get(i)}">
							<td>Y</td>					
						</c:if>
					</c:if>
					<c:if test="${replyList.get(i) == null}">
						<td>N</td>					
					</c:if> 
				</tr>			
			</c:forEach>
		</c:if>
		<tr>
			<td colspan="6">
				<input type="button" value="문의글 쓰기" onclick="location.href='serviceBoardInsert'"/>
			</td>
		</tr>
	</table>
	<hr>
	<table class="table table-striped">
		<tr>
			<td><a href="serviceBoardMain?nowPage=${nowPage-10 }">이전</a></td>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<td width="50" align="center">
						<c:if test="${nowPage == i }">
							<a href="serviceBoardMain?nowPage=${i }" style="color: red;">${i }</a>
						</c:if>
						<c:if test="${nowPage != i }">
							<a href="serviceBoardMain?nowPage=${i }">${i }</a>
						</c:if>
					</td>
				</c:forEach>
			<td><a href="serviceBoardMain?nowPage=${nowPage+10 }">다음</a></td>
		</tr>
	</table>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>