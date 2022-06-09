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
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<div class="mt-3">
			<div class="row">
				<div class="mb-3">
					<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">${storeVO.storeName}</label>
				</div>
				<label><img src = "${pageContext.request.contextPath}/images/${storeVO.photo }" style="width=400px;"></label>
				<sec:authorize access="isAuthenticated()">
					<div class="input-group mb-3">
						<a href="${pageContext.request.contextPath}/reservation/reservationInsert?storeNo=${storeVO.storeNo}" class="form-control input-sm btn btn-primary mt-3">예약하기</a>
					</div>
				</sec:authorize>
				
				<!-- Nav tabs -->
				<div class="container">
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
						<div class="tab-pane container" id="storeInfo">
							<br>
							<table class="table">
								<tr>
									<td class="col-4">♥ ${reviewLikeVO.reviewLikeCnt }</td>
									<td class="col-4">평점: ${avg }</td>
									<sec:authorize access="isAuthenticated()">
										<td class="col-4">
											<form action="storeDetailReviewMain" method="post">
												<c:if test="${reviewLikeVO.likeStatus == 0 }">
													<input type="hidden" name="sw" value="2"/>
													<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
													<input type="submit" value="좋아요" class="btn btn-outline-primary"/>
												</c:if>
												<c:if test="${reviewLikeVO.likeStatus == 1 }">
													<input type="hidden" name="sw" value="1"/>
													<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
													<input type="submit" value="좋아요 취소" class="btn btn-outline-primary"/>
												</c:if>
											</form>
										</td>
									</sec:authorize>
								</tr>
							</table>
							<table class="table">
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
							<table class="table table-hover">
								<thead>
									<tr>
									<th>사진</th>
									<th>이름</th>
									<th>가격</th>
									<th>설명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var = "i" items="${menuList }">
										<tr>
											<td><img src="${pageContext.request.contextPath}/images/${i.menuPhoto }" width="200" height="100"></td>
											<td>${i.menuName }</td>
											<td>${i.price }</td>
											<td>${i.menuInfo }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane container active" id="review">
						<br>
							<c:if test="${reviewList.size() != 0 }">
								<c:forEach var="i" begin="0" end="${reviewList.size()-1 }">
									<div class="container mt-3 shadow p-4 mb-4 bg-light">
										<sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal" var="check"/>
											<c:if test="${check.username eq reviewList.get(i).id}">
												<table>
													<tr>
														<td>
															<input type="button" value="지우기" onclick="location.href='reviewDeletePro?storeNo=${reviewList.get(i).storeNo }&reviewNo=${reviewList.get(i).reviewNo}'" class="btn btn-outline-danger"/>
														</td>
													</tr>
												</table>
											</c:if>
										</sec:authorize>
										<table class="table table-hover">
											<thead>
												<tr>
													<td colspan="4" class="col-4"><img src="${pageContext.request.contextPath}/images/${reviewList.get(i).reviewPhoto }" width="70%"></td>
												</tr>
											</thead>
											<tr>
												<td class="col-2">${reviewListNick.get(i).nickName }</td>
												<td class="col-6">${reviewList.get(i).reviewContent }</td>
												<td class="col-3">${reviewList.get(i).reviewRDate }</td>
												<td align="right" class="col-1">★ : ${reviewListNick.get(i).rating }</td>
											</tr>
										</table>
										<table class="table">
												<c:if test="${reviewCommentList.size() != 0 }">
													<c:forEach var="j" begin="0" end="${reviewCommentList.size()-1 }">
														<c:if test="${reviewList.get(i).reviewNo == reviewCommentList.get(j).reviewNo }">
															<tr>
																<td class="col-2">${reviewCommentList.get(j).id }</td>
																<td class="col-6">${reviewCommentList.get(j).reviewCommentContent }</td>
																<td class="col-3">${reviewCommentList.get(j).reviewCommentRDate }</td>
																<td align="right" class="col-1">
																	<sec:authorize access="isAuthenticated()">
																		<sec:authentication property="principal" var="check"/>
																		<c:if test="${check.username eq reviewCommentList.get(j).id }">
																			<form action="reviewCommentDeletePro" method = "post">
																				<input type="hidden" name="storeNo" value="${reviewList.get(i).storeNo}">
																				<input type="hidden" name="reviewCommentNo" value="${reviewCommentList.get(j).reviewCommentNo }">
																				<input type="submit" value="삭제" class="btn btn-outline-danger">
																			</form>
																		</c:if>
																	</sec:authorize>
																</td>
															</tr>
														</c:if>
													</c:forEach>
												</c:if>
												<sec:authorize access="isAuthenticated()">
													<td align="right" colspan="4">
														<form action="reviewCommentInsertPro" method = "post">
															<textarea rows="4" maxlength="30" style="width: 100%" required name="reviewCommentContent"></textarea>
															<input type="hidden" name="storeNo" value="${reviewList.get(i).storeNo}">
															<input type="hidden" name="reviewNo" value="${reviewList.get(i).reviewNo}"> 
															<input type="submit" value="리뷰댓글" class="btn btn-outline-primary">
															<!-- 지우기 버튼 -->
														</form>
													</td>
												</sec:authorize>
											</tr>
										</table>
									</div>
								<!-- 로그인 되어 있는 상태 -->
								<!-- 리뷰 댓글 출력 -->
								</c:forEach>
							</c:if>
							<sec:authorize access="isAuthenticated()">
								<hr>
								<form action="reviewInsertPro" method="post" enctype="multipart/form-data">
									<table class="table">
										<thead>
											<tr class="table-light">
												<th>평점</th>
												<th>닉네임</th>
												<th>파일</th>
												<th>리뷰내용</th>
												<th></th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
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
													<textarea rows="3" maxlength="30" style="width: 100%" required name="reviewContent"></textarea>
												</td>
												<td>
													<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
													<input type="submit" value="리뷰쓰기" class="btn btn-outline-primary"/>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>