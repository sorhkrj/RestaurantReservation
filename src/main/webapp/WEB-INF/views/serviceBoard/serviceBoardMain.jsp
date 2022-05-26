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
		width: 600px;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<table border="1">
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
		<tr>
			<td colspan="6">
				<input type="button" value="리뷰페이지" onclick="location.href='storeDetailReviewMain?storeNo=1'"/>
			</td>
		</tr>
	</table>
	<hr>
	<table>
		<tr>
			<td width="50"><a href="serviceBoardMain?nowPage=${i-10 }">이전</a></td>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<td width="50" align="center"><a href="serviceBoardMain?nowPage=${i }">${i }</a></td>
				</c:forEach>
			<td width="50"><a href="serviceBoardMain?nowPage=${i+10 }">다음</a></td>
		</tr>
	</table>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>