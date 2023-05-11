<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="container-1">
		<!-- CONTENTS START -->
		<form action="join" method="post" name="f"
			onsubmit="return input_check(this)">
			<!-- location menu -->
			<h3 class="h3Txt center">홈구장 충무체육관 안내</h3>

			<div class="tbl1">
				<table cellspacing="0" class="tbl"
					summary="시설명, 부지면적, 건축면적, 연면적, 층수, 수용인원, 좌석수, 개장년도의 정보가 있습니다.">
					<thead>
						<tr class="center">
							<th scope="col">시설명</th>
							<th scope="col">부지면적</th>
							<th scope="col">건축면적</th>
							<th scope="col">연면적</th>
							<th scope="col">층수</th>
							<th scope="col">수용인원</th>
							<th scope="col">좌석수</th>
							<th scope="col">개장년도</th>
						</tr>
					</thead>
					<tbody>
						<tr class="center">
							<td>충무체육관</td>
							<td>5,071평</td>
							<td>1,176</td>
							<td>10,548</td>
							<td>3층</td>
							<td>5,960명</td>
							<td>4,510명</td>
							<td>1970. 12</td>
						</tr>
					</tbody>
				</table>
			</div>

			<br>
			<div class="center">
				<img src="${path}/image/map2.jpg" alt="좌석배치도" />
			</div>
			<h4 class="center">좌석배치도</h4>

			<br>
			<br>
			<br>

			<h4 class="h5Txt center mg10">찾아오시는 길</h4>
			<div class="center">
				<img src="${path}/image/map1.png" alt="약도 이미지" />
			</div>

			<h5 class="h5Txt">위치</h5>
			<ul class="ul_type1">
				<li>대전광역시 중구 부사동 177-1 (보문산공원 입구)</li>
			</ul>

			<h5 class="h5Txt">교통편</h5>
			<ul class="ul_type1">
				<li>대중교통 : 대전역 3분출구 건너편 2번버스 → 한밭종합운동장 하차후 4분 도보</li>
				<li>자가용 : 대전IC에서 동부네거리방면 1.4km → 충무네거리 방면 4.6km 이동 한밭종합운동장 하차</li>
			</ul>

			<h5 class="h5Txt">안내 및 문의</h5>
			<ul class="ul_type1">
				<li>대전광역시 동부 부사동 177-1 (보문산공원입구) 대전광역시 시설관리공단 체육시설사업소</li>
				<li>T. 042)253-4181~4 F. 042)252-6324</li>
				<li>구단사무국 T.042)600-1783 F.042)600-1785</li>
			</ul>
		</form>
		<!-- //CONTENTS -->
	</div>
</body>
</html>
