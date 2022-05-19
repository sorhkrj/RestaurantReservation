<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Top Border</title>
</head>
<body>
	<table border="1">
		<tr height="50">
			<td align="left" width="100">
				<div class="w3-dropdown-hover">
					<div class="w3-button w3-gray">${sessionScope.member.id}</div>
					<div class="w3-dropdown-content w3-bar-block w3-border">
						<a href="login" class="w3-bar-item w3-button">로그인</a> <!-- 회원, 기업, 관리자 -->
						<a href="#" class="w3-bar-item w3-button">로그아웃</a> <!-- 회원, 기업, 관리자 -->
						<a href="#" class="w3-bar-item w3-button">내정보</a> <!-- 회원, 관리자 -->
						<a href="myReservationList" class="w3-bar-item w3-button">예약정보</a> <!-- 회원 -->
						<a href="myStore" class="w3-bar-item w3-button">지점관리</a> <!-- 기업 -->
						<a href="#" class="w3-bar-item w3-button">분석현황</a> <!-- 기업 -->
						<a href="serviceBoardMain" class="w3-bar-item w3-button">고객센터</a> <!-- 회원, 기업, 관리자 -->
						<a href="searchMember" class="w3-bar-item w3-button">전체회원관리</a> <!-- 관리자 -->
						<a href="searchStore" class="w3-bar-item w3-button">전체지점관리</a> <!-- 관리자 -->
					</div>
				</div>
			</td>
				<td width="300">
				<form action="searchResult" method="get">
					<table>
						<tr>
							<td width="250">
								<input type="text" placeholder="검색할 내용" class="w3-input w3-border"/>
							</td>
							<td width="50">
								<input type="submit" value="검색" class="w3-input w3-border"/>
							</td>
						</tr>
					</table>
				</form>
				</td>
			<td align="right" width="100">
				<a href="/" class="w3-button w3-gray">홈</a>
			</td>
	</table>
</body>
</html>