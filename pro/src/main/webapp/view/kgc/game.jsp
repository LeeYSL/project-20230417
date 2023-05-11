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
	<div style="padding-left:400px" id="container-1">
			<h2 class="w3-center" style="padding-right: 170px">일정</h2>
		<!-- location menu -->
		<div class="page_location"></div>
		<form name="game" action="game">
			<div class="sel_area" style="margin: 2% 0 1% 60%;">
				<span >경기 일정</span>
				<select name="gameDay" onchange="form.submit();" title="일정 선택"
					class="selec" style="width: 90px">
					<c:forEach var="d" items="${gameList}">
						<option <c:if test="${d.gameDay eq param.gameDay}">selected</c:if>
							value="${d.gameDay}">${d.gameDay}</option>
					</c:forEach>
				</select>
			</div>
		</form>
	<table style="margin:auto;">
		<colgroup>
			<col width="100px" />
			<col width="100x" />
			<col width="100px" />
			<col width="100px" />
			<col width="93px" />
			<col width="100px" />
			<col width="100px" />
			<col width="141px" />
			<col width="*" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" class="center" colspan="2">홈 팀</th>
				<th scope="col" class="center" colspan="2">원정 팀</th>
				<th scope="col" class="center">홈팀 승</th>
				<th scope="col" class="center">원정팀 승</th>
				<th scope="col" class="center">경기 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="g" items="${gameYearlist}">
				<tr>
					<th scope="col" class="center">${g.homeTeam}</th>
					<th scope="col" class="center">
						<img class=logoimg src="${path}/image/logo/${g.homeImg}.png" class="logo" />
					</th>
					<th scope="col" class="center">${g.awayTeam}</th>
					<th scope="col" class="center">
						<img class=logoimg src="${path}/image/logo/${g.awayImg}.png" class="logo" />
					</th>
					<th scope="col" class="center">${g.homeWin}</th>
					<th scope="col" class="center">${g.awayWin}</th>
					<th scope="col" class="center">${g.gameDay}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>