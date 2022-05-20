<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>search Result</title>
</head>
<body>
	<c:import url="/WEB-INF/views/top.jsp"/>
	<table border="1">
		<c:forEach var="store" items="${storeList}">
			<tr>
				<td align="left" width="500">
					<div class="w3-container">
						<div class="w3-container w3-border w3-large">
						<c:if test="${store.storeName eq param.search}">
							<table>
								<tr>
									<td align="left" width="450">
										<div class="w3-left-align">${store.storeName}</div>
										<div class="w3-left-align">${store.introduce}</div>
									</td>
									<td align="right" width="50">
										<div class="w3-right-align">
											<button onclick="reservationSelect" class="w3-button w3-white w3-border w3-border-blue w3-round-large">예약하기</button>
										</div>
									</td>
								</tr>
							</table>
						</c:if>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>