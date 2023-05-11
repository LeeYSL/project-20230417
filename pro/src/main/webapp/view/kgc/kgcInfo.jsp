<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록실</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="container-1">
			<h2 id="title" class="w3-center">기록실</h2>
			<p class="w3-center">경기 결과</p>
			<form name="form" action="kgcInfo">
				<fieldset>
					<select name="leagueYear" onchange="form.submit();" title="시즌선택"
						style="width: 220px" class="selec">
						<c:forEach var="y" items="${yearList}">
						<option <c:if test="${y.leagueYear eq param.leagueYear}">selected</c:if> value="${y.leagueYear}">${y.leagueName}</option>
						</c:forEach>
					</select>
				</fieldset>
			</form>

			<h4 class="h4Txt mt0"></h4>
			<div class="tbl1 record w3-center">
				<table cellspacing="0" summary="순위, 팀명, 경기수, 승, 패, 승점, 정보가 있습니다." id="kgcinfo">
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
					<thead>
						<tr>
							<th scope="col" colspan="2">팀 순위</th>
							<th scope="col">팀명</th>
							<th scope="col">경기수</th>
							<th scope="col">승</th>
							<th scope="col">패</th>
							<th scope="col">승점</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="r" items="${recordList}">
						<tr>
							<th scope="col">${r.level}</th>
							<th scope="col"><img class=logoimg src="${path}/image/logo/${r.teamImg}.png" class="logo" /></th>
							<th scope="col">${r.teamName}</th>
							<th scope="col">${r.gameNum}</th>
							<th scope="col">${r.gameWin}</th>
							<th scope="col">${r.gameLose}</th>
							<th scope="col">${r.winPoint}</th>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

</body>
</html>