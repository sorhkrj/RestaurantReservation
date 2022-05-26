<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
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
<table class="table table-striped">
	<tr>
		<th colspan="6">리뷰</th>
	</tr>
	<tr>
		<td colspan="3">좋아요♥ 개수: ${reviewLikeVO.reviewLikeCnt }</td>
		<td colspan="3">
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
	<form action="reviewInsertPro" method="post">
		<table class="table table-striped">
			<tr>
				<th>리뷰번호</th>
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
				<td>photo</td>
				<td>
					내용 <input type="text" name=""  required/>
					<input type="submit" value="작성"/>
				</td>
				
			</tr>
		</table>
	</form>
<c:import url="/WEB-INF/views/footer.jsp"/>
</div>
</body>
</html>