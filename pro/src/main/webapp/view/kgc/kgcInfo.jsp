<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구단 기록</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="container-1">
			<h2 id="title" class="w3-center">구단 기록</h2>
			
			<form name="form" action="kgcInfo">
				<fieldset style="margin: 2% 0 1% 60%;">
					<span >정규시즌</span>
					<select name="leagueYear" onchange="form.submit();" title="시즌선택"
						style="width: 220px" class="selec">
						<c:forEach var="y" items="${yearList}">
						<option <c:if test="${y.leagueYear eq param.leagueYear}">selected</c:if> value="${y.leagueYear}">${y.leagueName}</option>
						</c:forEach>
					</select>
				</fieldset>
			</form>

			<h4 class="h4Txt mt0"></h4>
			
				<table cellspacing="0" summary="순위, 팀명, 경기수, 승, 패, 승점, 정보가 있습니다." style="margin:auto;">
					<colgroup>
						<col width="80px" />
						<col width="80px" />
						<col width="150px" />
						<col width="109px" />
						<col width="93px" />
						<col width="100px" />
						<col width="100px" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="center">팀 순위</th>
							<th scope="col" colspan="2" class="center">팀명</th>
							<th scope="col" class="center">경기수</th>
							<th scope="col" class="center">승</th>
							<th scope="col" class="center">패</th>
							<th scope="col" class="center">승점</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="r" items="${recordList}">
						<tr>
							<th scope="col" class="center">${r.level}</th>
							<th scope="col" class="center"><img class=logoimg src="${path}/image/logo/${r.teamImg}.png" class="logo" /></th>
							<th scope="col" >${r.teamName}</th>
							<th scope="col" class="center">${r.gameNum}</th>
							<th scope="col" class="center">${r.gameWin}</th>
							<th scope="col" class="center">${r.gameLose}</th>
							<th scope="col" class="center">${r.winPoint}</th>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			
		</div>

</body>
</html>