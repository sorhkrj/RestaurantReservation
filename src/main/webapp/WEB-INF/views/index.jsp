<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- js cdn -->
<script>
  $(document).ready( function() {
	var test = $('#a').height();
    $('#b').height(test);
  } );
  
</script>
<title>Index</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<div class="mb-3">
			<div class="mb-3 mt-3">
				<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">맛있는 음식이 가득! 어서오세요</label>
			</div>
			<!-- 메인사진 출력 -->
			<div class="row">
				<div class="col-sm-6">
					<div class="w-90" style="margin:0 auto">
						<div id="demo" class="carousel slide " data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
								<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
								<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
							</div>
							<div class="carousel-inner bg-dark img-thumbnail" id = "a" >
								<div class="carousel-item active">
									<img src="${pageContext.request.contextPath}/images_system/index01.jpg" class="d-block" style="width:100%">
									<div class="carousel-caption">
										<h3>스테이크, 어디까지 먹어봤어요?</h3>
										<p>다양한 종류의 사이드와 함께</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="${pageContext.request.contextPath}/images_system/index02.jpg" class="d-block" style="width:100%" >
									<div class="carousel-caption">
										<h3>이대로 헤어지기는 아쉽잖아요?</h3>
										<p>2차가기 좋은 곳</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="${pageContext.request.contextPath}/images_system/index03.jpg" class="d-block" style="width:100%">
									<div class="carousel-caption">
										<h3>스시부터 고기, 혼술까지</h3>
										<p>슬기로운 혼밥생활</p>
									</div>
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
								<span class="carousel-control-prev-icon"></span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
								<span class="carousel-control-next-icon"></span>
							</button>
						</div>
					</div>
				</div>
				<c:forEach var = "r" items ="${reviewList }">
					<div class="container mt-3 shadow p-4 mb-4 bg-light" style="width:220px;">
						<div class="card">
							<div class="card-header">${r.storeName}</div>
							<div class="card-header">★ : ${r.rating} </div>
							<div class="card-header">${r.id}</div>
							<div class="card-body"><img src="${pageContext.request.contextPath}/images/${r.reviewPhoto }" style="width:100%"></div>
							<div class="card-footer">${r.reviewContent }</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>