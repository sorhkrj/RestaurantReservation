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
  <style>
    
    html,
    body {
      height: 100%;  /*높이 조절*/
    }

      body {
      display: flex;
      align-items: center;
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
      }

      #form {
        width: 500px; /*가로 조절*/
        border: 1px solid black;
      }

  </style>


  <title>내정보</title>
</head>
<body>
<form action="memberSelect" method="get">
<c:import url="/WEB-INF/views/top.jsp"/>
  <div class="container mt-3 p-3" id="form">
  <div class="row">
   <h2 class="text-center">내정보</h2>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">아이디</span>
       &nbsp; ${memberVO.id}
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">이름</span>
    &nbsp; ${memberVO.name}
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">전화번호</span>
   &nbsp; ${memberVO.phone}
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">별명</span>
    &nbsp; ${memberVO.nickname}
    </div>
  </div>
  <div class="row text-center">
    <div class="container mt-3">
      <a href="memberUpdateCheck?id=${memberVO.id}"   type="button" class="btn btn-primary">수정하기</a>
      <a href="memberDeleteCheck?id=${memberVO.id}" type="button" class="btn btn-primary">회원탈퇴</a>
       <a href="/RestaurantReservation" type="button" class="btn btn-primary">돌아가기</a>
    </div>
  </div>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</form>
</body>