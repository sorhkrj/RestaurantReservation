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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- js cdn -->


<title>예약수정${rvo.storeNo}</title>
</head>

<body>
<c:import url="/WEB-INF/views/top.jsp"/>
	<div class="container">
		<form action="reservationUpdateCheck" method="post" id="form">
			<div class="container p-3" >
				<div class="row">
					<h2 class="text-center">예약수정</h2>
					
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">예약인원</span> 
						<input type="number" id = "setSeat" class="form-control" name="people" value="${rvo.people}"  min="1" required>
					</div>
					
						<div class="input-group mb-3">
							<span class="input-group-text col-3 text-center" >방문일자</span> 
							<input type="date" class="form-control" name="visitDay" id="visitDay" oninput="visit()" value="" required>
						</div>
						
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문시간</span> 
						<div id="time"></div>
					</div> 
					</div> 
					<h2 class="text-center">방문인정보</h2>
   					<div class="form-check mb-3 text-center">
     						<label class="form-check-label">
       					<input class="form-check-input" type="checkbox" id="memberCheckbox" > 주문자와 동일인</label>
   					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문인이름</span> 
						<input type="text" class="form-control" id="visitName" name="visitName" value="${rvo.visitName}"  required>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text col-3 text-center">방문인 전화번호</span> 
						<input type="text" class="form-control" id="visitPhone" name="visitPhone" value="${rvo.visitPhone}" required>
					</div>
						<input type="hidden" class="form-control" name="reserveNo" value="${rvo.reserveNo}" >
						<input type="hidden" class="form-control" name="storeNo" value="${rvo.storeNo}" >
				</div>
				
				<div class="row text-center">
					<div class="container mt-3">
						<input type="submit" class="btn btn-primary" value="확인"> 
						<a href="myReservationList" type="button" class="btn btn-primary">취소</a>
					</div>
				</div>
				
			</form>
	</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
		
	<script type="text/javascript">
 	  let name = '${rvo.visitName}';
      let phone = '${rvo.visitPhone}';
           
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
			data : {'visitDay': $("#visitDay").val(), 'storeNo' : ${rvo.storeNo}},
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