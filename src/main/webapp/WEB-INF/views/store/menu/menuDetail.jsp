<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"	rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
function deleteMenu(menu){
	var check = confirm(menu + "를 삭제하시겠습니까?");
	if(!check) return false;
		$.ajax({
			url : "${pageContext.request.contextPath}/store/menuDelete",
			async : false,
			type : "get",
			datatype : "json",
			data :  "menuName="+menu,			
			success : function(result) {
				alert("삭제되었습니다.");
			}, error:function(jqXHR, textStatus, errorThrown) {
       	  		alert("실패");
	        }
		}).done(function(){
			location.reload();
		});
}
function insertMenu(){
	var formData = new FormData($('#menuInsertPro')[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/store/menuInsert",
		async : false,
		type : "POST",
		data :  formData,
		contentType: false,
		processData : false,
		cache: false,
		success : function(result) {
			alert("등록되었습니다.");
		}, error:function(jqXHR, textStatus, errorThrown) {
   	  		alert("실패");
        }
	}).done(function(){
		location.reload();
	});
}

function updateMenu(menu){
	var formData = new FormData();
	formData.append('menuName', menu);
	formData.append('nameModified', $('#menuName_'+menu).val());
	formData.append('price', $('#price_'+menu).val());
	formData.append('menuInfo', $('#menuInfo_'+menu).val());
	formData.append('file', $('#menuPhoto_'+menu)[0].files[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/store/menuUpdate",
		async : false,
		type : "post",
		datatype : "text",
		contentType: false,
		processData : false,
		cache: false,
		data : formData,
		success : function(result) {
			alert("수정되었습니다.");
		}, error:function(jqXHR, textStatus, errorThrown) {
   	  		alert("실패");
        }
	}).done(function(){
		location.reload();
	});
}
</script>

<title>index</title>
</head>
<body>
<c:import url="/WEB-INF/views/top.jsp" />
	<div class="container">
		<div class="mt-3">
			<div class="row">
				<div class="mb-3">
		 		 <label class="col-sm-12 btn btn-outline-dark disabled me-2" style="font-size: 20pt; font-weight: bold;">지점 메뉴 관리</label>
				</div>
				<div class="mb-3">
		 			<button onclick="addInsertForm()" style="width: 25%;" class="btn btn-outline-dark">메뉴 추가</button>
					<form id="menuInsertPro" method="POST" enctype="multipart/form-data">
					<div id="addMenu"></div>
						</form>
				</div>
			</div>
			<form:form id = "menuUpdatePro">
				<c:forEach var="i" items="${menuList }" varStatus="no">
					<div class="input-group mb-3">
			 			<label class="btn btn-outline-dark disabled me-2" style="width: 150px">메뉴명</label>
			 			<span class="form-control">${i.menuName}</span>
						<span class="form-control" style="margin: 0; padding: 0;"><input type = "text"  id = "menuName_${i.menuName}" required style='width:100%;' class="form-control"></span>
						
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">메뉴 사진</label>
			 			<span class="form-control" style='margin: 0; padding: 0; width:400px;'><img src = "${pageContext.request.contextPath}/images/${i.menuPhoto}" style='width:400px; height:300px;' align="middle"></span>
			 			<span class="form-control" style='margin: 0; padding: 0; width:400px;'><input type = "file"  id = "menuPhoto_${i.menuName}" required class="form-control"></span>
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">가격</label>
						<span class="form-control">${i.price}</span>
						<span class="form-control" style='margin: 0; padding: 0;'><input type = "number"  id = "price_${i.menuName}" required style='width:100%;' class="form-control"></span>
					</div>
					<div class="input-group mb-3">
						<label class="btn btn-outline-dark disabled me-2" style="width: 150px">메뉴 정보</label>
						<span class="form-control">${i.menuInfo}</span>
						<span class="form-control" style='margin: 0; padding: 0;'><input type = "text"  id = "menuInfo_${i.menuName}" required style='width:100%;' class="form-control"></span>
					</div>
				  <div class="container mt-3">
				      <div class="row text-center">
						  <button onclick = "updateMenu('${i.menuName}');" class="form-control input-sm btn btn-primary mb-3" style="width: 50%;">수정</button>
					      <button onclick = "deleteMenu('${i.menuName}');" class="form-control input-sm btn btn-outline-danger mb-3" style="width: 50%;">삭제</button>
					  </div>
			 	  </div>
		 	  </c:forEach>
			</form:form>
	 	  </div>
	 	  <a href="${pageContext.request.contextPath}/store/myStore" class="form-control input-sm btn btn-outline-danger mb-3">돌아가기</a>
		</div>
		

	
<c:import url="/WEB-INF/views/footer.jsp" />
</body>
<script>
	var count = 0;
	var id = '<sec:authentication property="principal.username"/>';
	function addInsertForm() {
		var addedFormDiv = document.getElementById("addMenu");
		var str = '<div class="row mt-3"><label class="btn btn-outline-dark  mx-3" style="margin: 0; padding: 0; width:200px;"> 메뉴이름 </label> <input type = "text" name = "menuName" id = "menuName_input" style="margin: 0; padding: 0; width:400px;"></div><br>'
				+ ' <div class="row"><label class="btn btn-outline-dark  mx-3" style="margin: 0; padding: 0; width:200px;">사진    </label> <input type = "file" name = "file" id = "file_input" style="margin: 0; padding: 0; width:400px;" multiple></div><br>'
				+ ' <div class="row"><label class="btn btn-outline-dark  mx-3" style="margin: 0; padding: 0; width:200px;"> 가격   </label> <input type = "number" name = "price" id = "price_input" style="margin: 0; padding: 0; width:400px;"></div><br>'
				+ ' <div class="row"><label class="btn btn-outline-dark  mx-3" style="margin: 0; padding: 0; width:200px;"> 설명   </label> <input type = "text" name = "menuInfo" id = "menuInfo_input" style="margin: 0; padding: 0; width:400px;"></div><br>'
				+ '<input type = "hidden" name = "id" value = '+id+'>'
				+ '<button class="btn btn-outline-dark me-3" onClick = "javascript:insertMenu();">추가</button>'
				+ '<button class="btn btn-outline-dark" onClick = "delFrom(' + count + ')">취소</button>';
		var addedDiv = document.createElement("div");
		if (count < 1) {
			addedDiv.setAttribute("id", "insert_frm" + count);
			addedDiv.innerHTML = str;
			addedFormDiv.appendChild(addedDiv);
			count++;
		} else {
			alert("메뉴 추가는 하나씩 해주세요.");
		}
	}
	function delFrom(delCount) {
		var addedFormDiv = document.getElementById("addMenu");
		var delDiv = document.getElementById("insert_frm" + delCount);
		addedFormDiv.removeChild(delDiv);
		count--;
	}
</script>
</html>