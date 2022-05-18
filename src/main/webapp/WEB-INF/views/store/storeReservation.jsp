<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<table>
		<tr>
			<td>이름</td>
			<td>일자</td>
			<td>전화번호</td>
			<td>인원</td>
			<td>삭제</td>
		</tr>
		<tr>
			<td>${visitname }</td>
			<td>${visitday}</td>
			<td>${visitphone}</td>
			<td>${people}</td>
			<td><a href = "storeReservationDeletePro">삭제하기</a></td>
		</tr>
	</table>
</body>
</html>