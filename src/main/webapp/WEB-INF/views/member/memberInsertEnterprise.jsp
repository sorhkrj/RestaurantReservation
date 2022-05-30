<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
     <title>지점장회원가입</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<form action="memberInsertEnterprisePro?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
<div class="container mt-3 p-3" id="form">
  <div class="row">
   <h2 class="text-center">지점장회원가입</h2>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">아이디</span>
      <input type="text" name="id" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">비밀번호</span>
      <input type="password" name="password" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">이름</span>
      <input type="text" name="name" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">전화번호</span>
      <input type="text" name="phone" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">별명</span>
      <input type="text" name="nickname" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점사진</span>
      <input type = "file" name = "file" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점이름</span>
      <input type="text" name="storeName" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점위치</span>
      <input type="text" name="location" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점분류</span>
      <input type="text" name="category" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점전화번호</span>
      <input type="text" name="store_phone" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점주차여부</span>
      <input type="text" name="parking" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점휴일일</span>&nbsp;
      <input type="radio" name="holyday" value="월"  checked="checked" > 
       <label for="월"><h2>월</h2></label>&nbsp;
         <input type="radio" name="holyday"  value="화"  checked="checked" > 
       <label for="화"><h2>화</h2></label>&nbsp;
         <input type="radio" name="holyday"  value="수"  checked="checked" > 
       <label for="수"><h2>수</h2></label>&nbsp;
         <input type="radio" name="holyday"  value="목"  checked="checked" > 
       <label for="목"><h2>목</h2></label>&nbsp;
         <input type="radio" name="holyday"  value="금"  checked="checked" > 
       <label for="금"><h2>금</h2></label>
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점소개</span>
      <input type="text" name="introduce" class="form-control">
    </div>
     <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">음식점공지사항</span>
      <input type="text" name="notice" class="form-control">
    </div>
    <div class="row text-center">
    <div class="container mt-3">
    	<input type = "submit" value="확인" class="btn btn-primary">
    </div>
    </div>
   </div>
  </div>
  </form>
<c:import url="/WEB-INF/views/footer.jsp"/>


</body>





