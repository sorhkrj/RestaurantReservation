<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
	<c:import url="/WEB-INF/views/top.jsp"/>
		<label>가게명</label>${storeVO.storeName }<br>
		<label><img src = "${pageContext.request.contextPath}/images/${storeVO.photo }" style="width=400px;"></label>
		<br>
		<sec:authorize access="isAuthenticated()">
			<a href = "${pageContext.request.contextPath}/reservation/reservationInsert?storeNo=${storeVO.storeNo }"> 예약하기 </a>
		</sec:authorize>
		<br>
		
	<!-- Nav tabs -->
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" data-bs-toggle="tab" href="#review">리뷰</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-bs-toggle="tab" href="#storeInfo">가게정보</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-bs-toggle="tab" href="#menuInfo">메뉴정보</a>
	  </li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane container fade" id="storeInfo">
		<br>
			<table class="table table-striped">
				<tr>
					<td class="col-4">♥ ${reviewLikeVO.reviewLikeCnt }</td>
					<td class="col-4">평점: ${avg }</td>
					<sec:authorize access="isAuthenticated()">
					<td class="col-4">
						<form action="storeDetailReviewMain" method="post">
							<c:if test="${reviewLikeVO.likeStatus == 0 }">
								<input type="hidden" name="sw" value="2"/>
								<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
								<input type="submit" value="좋아요"/>
							</c:if>
							<c:if test="${reviewLikeVO.likeStatus == 1 }">
								<input type="hidden" name="sw" value="1"/>
								<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
								<input type="submit" value="좋아요 취소">
							</c:if>
						</form>
					</td>
					</sec:authorize>
				</tr>
			</table>
			<table class="table table-striped">
				<tr>
					<td>위치</td>
					<td>${storeVO.location }</td>
				</tr>	
				<tr>
					<td>분류</td>
					<td>${storeVO.category }</td>
				</tr>	
				<tr>
					<td>전화번호</td>
					<td>${storeVO.store_phone }</td>
				</tr>	
				<tr>
					<td>주차장</td>
					<td>${storeVO.parking }</td>
				</tr>	
				<tr>
					<td>휴무일</td>
					<td>${storeVO.holyday }</td>
				</tr>	
				<tr>
					<td>소개</td>
					<td>${storeVO.introduce }</td>
				</tr>	
				<tr>
					<td>공지사항</td>
					<td>${storeVO.notice }</td>
				</tr>	
			</table>
		</div>
		<div class="tab-pane container fade" id="menuInfo">
			<br>
			<c:forEach var = "i" items="${menuList }">
				<img src="${pageContext.request.contextPath}/images/${i.menuPhoto }" width="200" height="100"><br>
					${i.menuName }<br>
					${i.price }<br>
					${i.menuInfo }<br>
					
			</c:forEach>
		
		</div>
		<div class="tab-pane container active " id="review">
		<br>
			<c:if test="${reviewList.size() != 0 }">
				<c:forEach var="i" begin="0" end="${reviewList.size()-1 }">
				
				<div class="container mt-3 shadow p-4 mb-4 bg-light"  >
					<div class="card">
					    <div class="card-header">${reviewListNick.get(i).nickName }</div>
					    <div class="card-header">★ : ${reviewListNick.get(i).rating }</div>
				  		<div class="card-header">${reviewList.get(i).reviewRDate }</div>
					    <div class="card-body"><img src="${pageContext.request.contextPath}/images/${reviewList.get(i).reviewPhoto }" width="70%"></div> 
					    <div class="card-footer">${reviewList.get(i).reviewContent }</div>
   					    <c:if test="${reviewCommentList.size() != 0 }">
							<c:forEach var="j" begin="0" end="${reviewCommentList.size()-1 }">
	   					    	<div class="card-footer">
									<c:if test="${reviewList.get(i).reviewNo == reviewCommentList.get(j).reviewNo }">
												${reviewCommentList.get(j).id }
												${reviewCommentList.get(j).reviewCommentContent }
												${reviewCommentList.get(j).reviewCommentRDate }
										<sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal" var="check"/>
											<c:if test="${check.username eq reviewCommentList.get(j).id }">
												<form action="reviewCommentDeletePro" method = "post">
													<input type="hidden" name="storeNo" value="${reviewList.get(i).storeNo}">
													<input type="hidden" name="reviewCommentNo" value="${reviewCommentList.get(j).reviewCommentNo }">
													<input type="submit" value="삭제">
												</form>
											</c:if>
										</sec:authorize>
									</c:if>
	   					    	</div>
							</c:forEach>
						</c:if>
						<sec:authorize access="isAuthenticated()">
						    <div class="card-footer">
								<form action="reviewCommentInsertPro" method = "post">
									<textarea rows="3" cols="20" maxlength="30" required name="reviewCommentContent"></textarea>
									<input type="hidden" name="storeNo" value="${reviewList.get(i).storeNo}">
									<input type="hidden" name="reviewNo" value="${reviewList.get(i).reviewNo}"> 
									<input type="submit" value="리뷰댓글">
								</form>
						    </div>
					    </sec:authorize>
					</div>
				</div>
					<!-- 지우기 버튼 -->
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="check"/>
						<c:if test="${check.username eq reviewList.get(i).id}">
							<input type="button" value="지우기" onclick="location.href='reviewDeletePro?storeNo=${reviewList.get(i).storeNo }&reviewNo=${reviewList.get(i).reviewNo}'"/>
						</c:if>
				</sec:authorize>
			
				<!-- 로그인 되어 있는 상태 -->
				<br><br><br>
				
					
					
					
					<!-- 리뷰 댓글 출력 -->
					
					<br><br><br><br><br><br><br><br><br><br><br><br>
				</c:forEach>
			</c:if>
			
			
			
			
			
			
			<sec:authorize access="isAuthenticated()">
			<hr>
			<form action="reviewInsertPro" method="post" enctype="multipart/form-data">
				<table class="table table-striped">
				<tr>
					<th>평점</th>
					<th>닉네임</th>
					<th>파일</th>
					<th>리뷰내용</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<td>
						<select name="rating">
							<option value="1">★1</option>
							<option value="2">★2</option>
							<option value="3">★3</option>
							<option value="4">★4</option>
							<option value="5" selected>★5</option>
						</select>
					</td>
					<td>${sessionScope.nickName }</td>
					<td><input type="file" name="file"/></td>
					<td colspan="3">
						<textarea rows="3" cols="20" maxlength="30" required name="reviewContent"></textarea>
					</td>
					<td>
						<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
						<input type="submit" value="리뷰쓰기"/>
					</td>
				</tr>
				</table>
			</form>
			</sec:authorize>
		</div>
	</div>
</div>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>