<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<body>
	<c:import url="/WEB-INF/views/top.jsp"/>
	<h2 class="text-center">지점장회원가입</h2>
	<form action="memberInsertEnterprisePro" method="Post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" class="form-control">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="password" class="form-control">
				</td>
			</tr>
			<tr>
				<td >이름</td>
				<td >
					<input type="text" name="name" class="form-control">
				</td>
			</tr>
			<tr>
				<td >전화번호</td>
				<td >
					<input type="text" name="phone" class="form-control">
				</td>
			</tr>
			<tr>
				<td >별명</td>
				<td >
					<input type="text" name="nickname" class="form-control">
				</td>
			</tr>
			<tr>
				<td >음식점사진</td>
				<td >
					<input type="file" name="file" class="form-control">
				</td>
			</tr>
			<tr>
				<td >음식점이름</td>
				<td >
					<input type="text" name="storeName" class="form-control">
				</td>
			</tr>
			<tr>
				<td >음식점위치</td>
				<td >
					<input type="text" name="location" class="form-control">
				</td>
			</tr>
			<tr>
				<td >음식점분류</td>
				<td >
					<input type="text" name="category" class="form-control">
				</td>
			</tr>
			<tr>
				<td >음식점전화번호</td>
				<td >
					<input type="text" name="store_phone" class="form-control">
				</td>
			</tr>
			<tr>
				<td >음식점주차여부</td>
				<td >
					<input type="text" name="parking" class="form-control">
				</td>
			</tr>
			<tr>
				<td >음식점휴일</td>
				<td>
					<input type="radio" name="holyday" value="월"  checked="checked" > 
					<h4><label for="월">월</label></h4>
			
					<input type="radio" name="holyday"  value="화"  checked="checked" > 
					<h4><label for="화">화</label></h4>
			
					<input type="radio" name="holyday"  value="수"  checked="checked" > 
					<h4><label for="수">수</label></h4>
		
					<input type="radio" name="holyday"  value="목"  checked="checked" > 
					<h4><label for="목">목</label></h4>
			
					<input type="radio" name="holyday"  value="금"  checked="checked" > 
					<h4><label for="금">금</label></h4>
				</td>
			</tr>
			<tr>
				<td >음식점소개</td>
				<td >
					<input type="text" name="introduce" class="form-control">
				</td>
			</tr>
			<tr>
				<td >음식점공지사항</td>
				<td >
					<input type="text" name="notice" class="form-control">
					<input type = "submit" value="확인" class="btn btn-primary">
				</td>
			</tr>
		</table>
	</form>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>





