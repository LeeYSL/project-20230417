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
		<form name="game" action="game?">
			<div class="sel_area">
				<select name="mm" onchange="form.submit();" title="월선택"
					class="selec" style="width: 90px">
					<option value="202210">2022.10</option>
					<option value="202211">2022.11</option>
					<option value="202212">2022.12</option>
					<option value="202301">2023.01</option>
					<option value="202302">2023.02</option>
					<option value="202303">2023.03</option>

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
			<c:forEach var="r" items="${recordList}">
				<tr>
					<th scope="col">${r.level}</th>
					<th scope="col"><img class=logoimg
						src="${path}/image/logo/${r.teamImg}.png" class="logo" /></th>
					<th scope="col">${r.teamName}</th>
					<th scope="col">${r.gameNum}</th>
					<th scope="col">${r.gameWin}</th>
					<th scope="col">${r.gameLose}</th>
					<th scope="col">${r.winPoint}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>