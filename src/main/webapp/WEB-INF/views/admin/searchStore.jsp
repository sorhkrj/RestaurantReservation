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
<title>음식점검색</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<form action="resultStore" method="get">
			<div class="mt-3">
				<div class="row">
					<div class="mb-3">
						<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">음식점 이름</label>
					</div>
					<div class="input-group mb-3">
						<input type="text" name="storeName" placeholder="검색할 음식점을 입력해주세요." class="form-control me-2"/>
						<input type="submit" value="검색" class="btn btn-outline-dark"/>
					</div>
				</div>
			</div>
		</form>
	</div>	
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>