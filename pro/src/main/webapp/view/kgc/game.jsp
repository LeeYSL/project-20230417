<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기일정</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="contents">
		<!-- location menu -->
		<div class="page_location"></div>
		<form name="game" action="game">
			<div class="sel_area">
				<select name="gameDay" onchange="form.submit();" title="일정 선택"
					class="selec" style="width: 90px">
					<c:forEach var = "d" items="${gameList}">
					<option <c:if test="${d.gameDay eq param.gameDay}">selected</c:if> value="${d.gameDay}"></option>
			<!--  
					<option value="202210">2022.10</option>
					<option value="202211">2022.11</option>
					<option value="202212">2022.12</option>
					<option value="202301">2023.01</option>
					<option value="202302">2023.02</option>
					<option value="202303">2023.03</option> 
			-->
                </c:forEach>
				</select>
			</div>
		</form>
	</div>
	<table>
		<colgroup>
			<col width="80px" />
			<col width="80px" />
			<col width="206px" />
			<col width="109px" />
			<col width="93px" />
			<col width="100px" />
			<col width="100px" />
			<col width="141px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<c:forEach var="g" items="${gameYearlist}">
				<tr>
					<th scope="col">${g.homeTeam}</th>
				    <th scope="col">${g.awayTeam}</th>
					<th scope="col">${g.homeWin}</th>
					<th scope="col">${g.awayWin}</th>
					<th scope="col">${g.gameDay}</th>
					<th scope="col">${g.homeImg}</th>
					<th scope="col">${g.awayImg}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>