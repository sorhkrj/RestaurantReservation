<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceBoardMain</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<table border="1">
		<tr>
			<th colspan="6">문의글 전체 목록</th>
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
		<c:if test="${selectList != null }">
			<c:forEach var="i" begin="0" end="${selectList.size()-1 }">
				<tr>
					<td>${selectList.get(i).serviceNo }</td>
					<td>${selectList.get(i).id }</td>
					<td><a href="serviceBoardDetail?serviceNo=${selectList.get(i).serviceNo }&views=${selectList.get(i).views }">${selectList.get(i).title }</a></td>
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
	<table border="1">
		<tr>
			<td><input type="button" value="previous"></td>
			<td>1</td>
			<td><input type="button" value="next"></td>
		</tr>
	</table>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>