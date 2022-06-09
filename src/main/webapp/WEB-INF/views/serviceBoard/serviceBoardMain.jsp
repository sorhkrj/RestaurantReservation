<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<div class="container">
	<div class="mt-3">
		<div class="mb-3">
			<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">문의글 전체 목록 / 문의글 개수: ${total }</label>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>답변여부</th>
				</tr>
			</thead>
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
		</table>
		<sec:authorize access="hasAnyRole('MEMBER', 'MANAGER', 'ADMIN')">
			<div class="row col text-center">
			   <div class="container mt-3">
			   	  <input type="button" value="문의글 쓰기" onclick="location.href='serviceBoardInsert'" class="form-control input-sm btn btn-primary mb-3"/>
			   </div>
			</div>
		</sec:authorize>
		<table class="table" style="width: 100%; height: 40px;">
			<tr>
				<td width="50px" align="center"><a class="btn btn-outline-dark" href="serviceBoardMain?nowPage=${nowPage-10 }">이전</a></td>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<td width="50px" align="center">
							<c:if test="${nowPage == i }">
								<a href="serviceBoardMain?nowPage=${i }" style="color: red;">${i }</a>
							</c:if>
							<c:if test="${nowPage != i }">
								<a href="serviceBoardMain?nowPage=${i }">${i }</a>
							</c:if>
						</td>
					</c:forEach>
				<td width="50px" align="center"><a class="btn btn-outline-dark" href="serviceBoardMain?nowPage=${nowPage+10 }">다음</a></td>
			</tr>
		</table>
	</div>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>