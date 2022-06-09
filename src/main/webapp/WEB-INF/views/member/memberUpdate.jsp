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
  

  <title>내정보수정</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
	   <form action="memberUpdateCheckPro" method ="get">
		  <div class="container mt-3 p-3" id="form">
		  <div class="row">
		   <h2 class="text-center">내정보수정</h2>
		    <div class="input-group mb-3">
		      <span class="input-group-text col-3 text-center">아이디</span>
		      <input type="text" class="form-control" name="" value="${memberVO.id}" readonly="readonly">
		    </div>
		    <div class="input-group mb-3">
		      <span  class="input-group-text col-3 text-center">비밀번호</span>
		      <input type="password" class="form-control" name="password">
		    </div>
		    <div class="input-group mb-3">
		      <span class="input-group-text col-3 text-center">이름</span>
		      <input type="text" class="form-control" name="name" value="${memberVO.name}">
		    </div>
		    <div class="input-group mb-3">
		      <span class="input-group-text col-3 text-center">전화번호</span>
		      <input type="text" class="form-control" name="phone" value="${memberVO.phone}">
		    </div>
		    <div class="input-group mb-3">
		      <span class="input-group-text col-3 text-center">별명</span>
		      <input type="text" class="form-control" name="nickname" value="${memberVO.nickname}">
		    </div>
		  </div>
		  <div class="row text-center">
		    <div class="container mt-3">
		      <input type = "hidden" class="form-control" name="id" value="${memberVO.id}">
		      <input type = "submit" value="수정" class="btn btn-primary">
		      <input type = "reset" value = "취소" class="btn btn-primary" onclick="javascript:window.location='memberSelect';">
		    </div>
		  </div>
		</div>
	   </form>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>

