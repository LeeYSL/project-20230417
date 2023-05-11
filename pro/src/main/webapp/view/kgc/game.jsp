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
	<div id="container-1">
			<h2 class="w3-center">경기일정</h2>
		<!-- location menu -->
		<div class="page_location"></div>
		<form name="game" action="game">
			<div class="sel_area">
				<select name="gameDay" onchange="form.submit();" title="일정 선택"
					class="selec" style="width: 90px">
					<c:forEach var="d" items="${gameList}">
						<option <c:if test="${d.gameDay eq param.gameDay}">selected</c:if>
							value="${d.gameDay}">${d.gameDay}</option>
					</c:forEach>
				</select>
			</div>
		</form>
	<table>
		<colgroup>
			<col width="100px" />
			<col width="100x" />
			<col width="206px" />
			<col width="109px" />
			<col width="93px" />
			<col width="100px" />
			<col width="100px" />
			<col width="141px" />
			<col width="*" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" colspan="2">홈 팀</th>
				<th scope="col" colspan="2">원정 팀</th>
				<th scope="col">홈팀 승</th>
				<th scope="col">원정팀 승</th>
				<th scope="col">경기 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="g" items="${gameYearlist}">
				<tr>
					<th scope="col">${g.homeTeam}</th>
					<th scope="col"><img class=logoimg
						src="${path}/image/logo/${g.homeImg}.png" class="logo" /></th>
					<th scope="col">${g.awayTeam}</th>
					<th scope="col"><img class=logoimg
						src="${path}/image/logo/${g.awayImg}.png" class="logo" /></th>
					<th scope="col">${g.homeWin}</th>
					<th scope="col">${g.awayWin}</th>
					<th scope="col">${g.gameDay}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>