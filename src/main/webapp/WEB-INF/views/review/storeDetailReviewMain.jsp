<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
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
<table border="1" style="width: 506px;">
	<tr>
		<th colspan="2">리뷰</th>
	</tr>
	<tr>
		<td>좋아요♥ 개수: ${reviewLikeCnt }</td>
		<td width="203">
			<form action="storeDetailReviewMain" method="post">
				<c:if test="${reviewLikeVO.sw == 0 }">
					<input type="hidden" name="sw" value="1"/>
					<input type="hidden" name="id" value="${sessionScope.id }"/>
					<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
					<input type="submit" value="좋아요"/>
				</c:if>
				<c:if test="${reviewLikeVO.sw == 1 }">
					<input type="hidden" name="sw" value="0"/>
					<input type="hidden" name="id" value="${sessionScope.id }"/>
					<input type="hidden" name="storeNo" value="${storeVO.storeNo }"/>
					<input type="submit" value="좋아요 취소" style="color: white; background-color: blue;"/>
				</c:if>
			</form>
		</td>
	</tr>
	<tr>
		<td>♥ ${sessionScope.nickName }</td><td>리뷰쓰기</td>
	</tr>
	
	<!-- 리뷰리스트 사이즈 받아와서 출력 -->
	 <c:if test="reviewList">
	 	<c:forEach var="i" begin="0" end="">
			<tr>
				<th>닉네임</th><td>내용</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>