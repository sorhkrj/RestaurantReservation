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
<style type="text/css">
	table{
		border: 1px solid black;
	}
	#comment{
		height: 50px;
	}
</style>
</head>
<body>
<div class="container">
<c:import url="/WEB-INF/views/top.jsp"/>
	
	사진 : ${storeVO.photo }<br>
	위치 : ${storeVO.location }<br>
	분류 : ${storeVO.category}	<br>
	전화번호 : ${storeVO.store_phone}<br>
	주차장 : ${storeVO.parking}<br>
	휴무일 : ${storeVO.holyday}<br>
	소개 : ${storeVO.introduce}<br>
	공지사항 : ${storeVO.notice}<br>

		<a href = "storeUpdate">수정하기</a><br>
		<a href = "storeReservation?storeNo=${storeVO.storeNo }">예약현황</a><br>
		<a href = "storeCapacitySelect?storeNo=${storeVO.storeNo }">예약가능시간 확인</a><br>
<hr>
<h4>리뷰정보</h4>
<table class="table table-striped">
	<tr>
		<th colspan="6">리뷰</th>
	</tr>
	<tr>
		<td colspan="2">좋아요♥ 개수: ${reviewLikeVO.reviewLikeCnt }</td>
		<td colspan="2">평점: ${avg }</td>
		<td colspan="2">
			<form action="storeDetailReviewMain" method="post">
				<c:if test="${reviewLikeVO.likeStatus == 0 }">
					<input type="hidden" name="sw" value="2"/>
					<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
					<input type="submit" value="좋아요"/>
				</c:if>
				<c:if test="${reviewLikeVO.likeStatus == 1 }">
					<input type="hidden" name="sw" value="1"/>
					<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
					<input type="submit" value="좋아요 취소"/>
				</c:if>
			</form>
		</td>
	</tr>
	</table>
	<hr>
	<h4>리뷰목록</h4>
	<form action="reviewCommentInsertPro" method="post">
		<table class="table table-striped">
			<tr>
				<th>작성자</th>
				<th>평점</th>
				<th>사진</th>
				<th>내용</th>
				<th>작성일</th>
				<th>댓글</th>
			</tr>
			<c:if test="${reviewList.size() != 0 }">
				<c:forEach var="i" begin="0" end="${reviewList.size()-1 }">
					<tr>
						<td>${reviewListNick.get(i).nickName }</td>
						<td>${reviewListNick.get(i).rating }</td>
						<td width="200" height="100">
							<c:if test="${reviewList.get(i).reviewPhoto != null }">
								<img alt="d" src="images/${reviewList.get(i).reviewPhoto }" width="200" height="100">
							</c:if>	
						</td>
						<td>${reviewList.get(i).reviewContent }</td>
						<td>
							${reviewList.get(i).reviewRDate }
								<sec:authentication property="principal" var="check"/>
									<c:if test="${check.username eq reviewList.get(i).id}">
										<input type="button" value="지우기" onclick="location.href='reviewDeletePro?storeNo=${reviewList.get(i).storeNo }&reviewNo=${reviewList.get(i).reviewNo}'"/>
									</c:if>
						</td>
						<td>
							<form action="reviewCommentInsertPro">
								<textarea rows="3" cols="20" maxlength="30" required name="reviewCommentContent"></textarea>
								<input type="hidden" name="storeNo" value="${reviewList.get(i).storeNo}">
								<input type="hidden" name="reviewNo" value="${reviewList.get(i).reviewNo}"> 
								<input type="submit" value="리뷰댓글">
							</form>
						</td>
					</tr>
					<c:if test="${reviewCommentList.size() != 0 }">
						<c:forEach var="j" begin="0" end="${reviewCommentList.size()-1 }">
							<c:if test="${reviewList.get(i).reviewNo == reviewCommentList.get(j).reviewNo }">
								<tr id="comment">
									<td>[re]</td>
									<td>
										${reviewCommentList.get(j).reviewCommentNo }
									</td>
									<td>
										${reviewCommentList.get(j).reviewNo }
									</td>
									<td>
										${reviewCommentList.get(j).id }
									</td>
									<td>
										${reviewCommentList.get(j).reviewCommentContent }
									</td>
									<td>
										${reviewCommentList.get(j).reviewCommentRDate }
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
	</form>
	<hr>
	<h4>리뷰작성</h4>
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
	
	<a href = "${pageContext.request.contextPath}/reservation/reservationInsert?storeNo=${storeVO.storeNo }"> 예약하기 </a>
<c:import url="/WEB-INF/views/footer.jsp"/>
</div>
</body>
</html>