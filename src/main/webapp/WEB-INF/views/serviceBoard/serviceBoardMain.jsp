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
			<c:forEach var="selectList" items="${selectList}">
			<tr>
				<td>${selectList.serviceNo }</td>
				<td>${selectList.id }</td>
				<td><a href="serviceBoardDetail?serviceNo=${selectList.serviceNo }&views=${selectList.views }">${selectList.title }</a></td>
				<td>${selectList.content }</td>
				<td>${selectList.views }</td>
				<td>${selectList.regDate }</td>
				<c:if test="${replyList != null}">
					<c:forEach var="replyList" items="${replyList }">
						<c:choose>
							<c:when test="${selectList.serviceNo != replyList.serviceNo}">
								<td>N</td>
							</c:when>
							<c:otherwise>
								<td>Y</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>					
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