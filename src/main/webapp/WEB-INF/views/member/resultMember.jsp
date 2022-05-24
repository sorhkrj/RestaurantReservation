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
	      align-items: top;
	      padding-top: 40px;
	      padding-bottom: 40px;
	      background-color: #f5f5f5;
	      }
	
	      #form {
	        width: 1000px; /*가로 조절*/
	        border: 1px solid black;
	      }
     </style>
<title>회원검색</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<h3>회원아이디: &nbsp;</h3>
<form action="resultMember">
	<input type="text" name="nigael" placeholder="회원아이디를 입력해주세요." >
	<input type="submit" value="검색하기">
	<h2 class="text-center">회원정보</h2>
</form>


<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>