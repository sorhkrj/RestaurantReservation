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
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- js cdn -->
<title>예약</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<form class="container" action="reservationInsertCheck" method="post">
			<div class="mt-3">
				<div class="row">
			 		<div class="mb-3">
			 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">예약 하기</label>
					</div>
			 		<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">예약 음식점</label>
						<span class="form-control">${storevo.storeName }</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문 일자</label>
						<span class="form-control" style="margin: 0; padding: 0;"><input type="date" class="form-control" name="visitDay" id="visitDay" oninput="visit()" value="" required></span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문 시간</label>
						<span class="form-control" style="margin: 0; padding: 0;"><div id="time" class="form-control" style="height: 100%;"></div></span>
					</div>
			 		<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">예약 인원</label>
						<span class="form-control" style="margin: 0; padding: 0;"><input id ="setSeat" type="number" class="form-control" name="people" min="1" required class="form-control"></span>
					</div>
					<div class="mb-3">
			 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">방문인 정보</label>
					</div>
			 		<div class="input-group mb-3">
						<span class="form-control" style="text-align: center;"><input class="form-check-input me-2" type="checkbox" name="memberCheckbox" id="memberCheckbox">주문자와 동일인</span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문인 이름</label>
						<span class="form-control" style="margin: 0; padding: 0;"><input type="text" class="form-control" id="visitName" name="visitName"  value=""  required></span>
					</div>
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">방문인 전화번호</label>
						<span class="form-control" style="margin: 0; padding: 0;"><input type="text" class="form-control" id="visitPhone" name="visitPhone" value=""  required></span>
					</div>
			   </div>
			   <div class="row text-center">
				   <div class="container mt-3">
				   	  <input type="hidden" class="form-control" name="storeNo" value="${storevo.storeNo }">
				   	  <input type="hidden" class="form-control" name="storeName" value="${storevo.storeName }">
				      <input type="submit" class="form-control input-sm btn btn-primary mb-3" value="확인">
				      <input type="reset" value="취소" class="form-control input-sm btn btn-outline-danger mb-3">
				       <a href="${pageContext.request.contextPath}/review/storeDetailReviewMain?storeNo=${storevo.storeNo }" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
				   </div>
			   </div>
			</div>
		</form>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
	
	
	<script type="text/javascript">
 	  let name = '${mvo.name}';
 	  let phone = '${mvo.phone}';
           
      memberCheckbox.addEventListener("change", function() {
        if(this.checked) {
   
          document.querySelector("#visitName").value=name;
          document.querySelector("#visitPhone").value=phone;
        }else {
          document.querySelector("#visitName").value="";
          document.querySelector("#visitPhone").value="";
        }
      })
    </script>
    
    <script type="text/javascript">

function visit(){
   	$('#visitDay').change(function(){
	$('#time').empty();
   	  <!-- ReservationTime -->
		$.ajax({
			url:'reservationTime',
			data : {'visitDay': $("#visitDay").val(), 'storeNo' : ${storevo.storeNo }},
			type:'get',
			async: false,
			dataType:'json',
			timeout: 3000,
			success:function(listResult){
				for(let i = 0 ; i < listResult.length-1 ; i++){
		
				$('#time').append("<input type='radio' class='btn-check' id='" + listResult[i] + "' name='visitTime' value ='"+ listResult[i] +"' required> <label class='btn btn-primary' for='" + listResult[i] + "'>" + listResult[i] + "</label>");
				}
				$("#setSeat").attr("max", listResult[listResult.length-1]);
			},error:function(error){
			}
		});
	    <!-- ReservationTimeEnd -->
   	});
   	
 
}	

</script>
	
</body>
</html>