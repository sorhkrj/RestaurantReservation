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
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- JS CDN -->
<script>
	function resultMember() {
  		$.ajax({
			url : "resultMember",
			type : "get",
			contentType: 'application/json',
			datatype : "json",
			data : {
				"search" : $("#search").val()
			},
		}).done(function(memberList) {
			console.log(search.value);
			console.log(memberList);
			var result = document.getElementById("result");
			result.style.display ="block";
		});
	}
</script>
<title>회원검색</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp"/>
<div class="container">
	<div class="mt-3">
		<div class="row">
			<div class="mb-3">
				<label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">회원 아이디</label>
			</div>
			<form action="resultMember" method="get" onsubmit="return false">
				<div class="input-group mb-3">
					<input type="text" id="search" name="id" placeholder="검색할 아이디를 입력해주세요." class="form-control me-2"/>
					<input type="submit" value="검색" onclick="resultMember()" class="btn btn-outline-dark"/>
				</div>
			</form>
			<div id="result" class="container" style="display: none">
				<table class="table table-striped">
					<c:choose>
						<c:when test="">
							'${search.value}' 검색 결과를 찾을 수 없습니다.
						</c:when>
						<c:otherwise>
							<c:forEach var="member" items="${memberList}">
								<tr>
									<td align="right">
										<form action = "memberAdmin" method ="get">
											<input type="hidden" name = "id" value = "">
											<input class="btn btn-outline-dark" type="submit" value ="이동" >
										</form>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>