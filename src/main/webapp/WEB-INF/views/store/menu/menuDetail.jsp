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
			type : "get",
			datatype : "json",
			data :  "menuName="+menu,			
			success : function(result) {
				alert("삭제되었습니다.");
				location.reload();
			}, error:function(jqXHR, textStatus, errorThrown) {
       	  		alert("실패");
	        }
		});
}
function insertMenu(){
	var id = '<sec:authentication property="principal.username"/>';
	$.ajax({
		url : "${pageContext.request.contextPath}/store/menuInsert",
		type : "post",
		datatype : "text",
		contentType: "application/json",
		data :  JSON.stringify({
			"menuName" : $("#menuName_input").val(),
			"menuPhoto" : $("#menuPhoto_input").val(),
			"price" : $("#price_input").val(),
			"menuInfo" : $("#menuInfo_input").val(),
			"id" : id
			}),
		success : function(result) {
			alert("성공");
			location.reload();
		}, error:function(jqXHR, textStatus, errorThrown) {
   	  		alert("실패");
        }
	});
}
function updateMenu(menu){
	$.ajax({
		url : "${pageContext.request.contextPath}/store/menuUpdate",
		type : "post",
		datatype : "text",
		contentType: "application/json",
		data :  JSON.stringify({
			"menuName" : $("#menuName_"+menu).val(),
			"menuPhoto" : $("#menuPhoto_"+menu).val(),
			"price" : $("#price_"+menu).val(),
			"menuInfo" : $("#menuInfo_"+menu).val(),
			}),
		success : function(result) {
			alert("수정되었습니다.");
			location.reload();
		}, error:function(jqXHR, textStatus, errorThrown) {
   	  		alert("실패");
        }
	});
}
</script>

<title>index</title>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/top.jsp" />
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>메뉴명</th>
				<th>사진</th>
				<th>가격</th>
				<th>설명</th>
				<th>관리</th>
			</tr>
			<form:form>
		<c:forEach var="i" items="${menuList }" varStatus="no">
			<tr>
				<td>${no.count}</td>
				<td><input type = "text"  id = "menuName_${i.menuName}" value = "${i.menuName}"></td>
				<td><input type = "text"  id = "menuPhoto_${i.menuName}" value = "${i.menuPhoto}"></td>
				<td><input type = "number"  id = "price_${i.menuName}" value = "${i.price}"></td>
				<td><input type = "text"  id = "menuInfo_${i.menuName}" value = "${i.menuInfo}"></td>
				<td><button onclick = "javascript:updateMenu(${i.menuName});">수정</button>
					<button onclick = "javascript:deleteMenu(${i.menuName});">삭제</button></td>
			</tr>
		</c:forEach>
			</form:form>
			<!-- <tr>
				<td>추가</td>
				<td><input type = "text"  id = "menuName_input"></td>
				<td><input type = "text" id = "menuPhoto_input"></td>
				<td><input type = "number" id = "price_input"></td>
				<td><input type = "text" id = "menuInfo_input"></td>
				<td><button onclick = "javascript:insertMenu();">추가</button></td>
			</tr> -->
		</table>
		<br> <br>
				
				
				
		<button onclick="addInsertForm()">메뉴 추가</button>

		<form id="menuInsertPro" method="POST">
			
	<div id="addMenu"></div>
		</form>
		<c:import url="/WEB-INF/views/footer.jsp" />
	</div>
</body>
<script>
	var count = 0;
	function addInsertForm() {
		var addedFormDiv = document.getElementById("addMenu");
		var str = '메뉴이름 : <input type = "text" name = "menuName" id = "menuName_input"><br>'
				+ ' 사진 : <input type = "text" name = "menuPhoto" id = "menuPhoto_input"><br>'
				+ ' 가격 : <input type = "number" name = "price" id = "price_input"><br>'
				+ ' 설명 : <input type = "text" name = "menuInfo" id = "menuInfo_input"><br>'
				+ '<button onClick = "javascript:insertMenu();">추가</button>'
				+ '<button onClick = "delFrom(' + count + ')">취소</button>';
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