<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


  <title>회원가입</title>
</head>
<body>
  <div class="container mt-3 p-3" id="form">
  <div class="row">
   <h2 class="text-center">회원가입</h2>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">아이디</span>
      <input type="text" class="form-control">
    </div>
    <div class="input-group mb-3">
      <span  class="input-group-text col-3 text-center">비밀번호</span>
      <input type="password" class="form-control">
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">이름</span>
      <input type="text" class="form-control">
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">전화번호</span>
      <input type="text" class="form-control">
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text col-3 text-center">별명</span>
      <input type="text" class="form-control">
    </div>
  </div>
  <div class="row text-center">
    <div class="container mt-3">
      <a href="#"   type="button" class="btn btn-primary">확인</a>
      <a href="#" type="button" class="btn btn-primary">취소</a>
    </div>
  </div>
</div>

</body>
