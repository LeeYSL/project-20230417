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
	<!-- //left 인클루드 끝 -->
	<!-- contetns 영역 -->
	<div id="contents">
		<!-- location menu -->
		<div class="page_location">
			<span><img src="/images/common/ico_home.gif" alt="Home" /></span> <span>GAME</span>
		</div>

			<form name="go" action="?">
				<div class="sel_area">
					<select name="yy" onchange="form.submit();" title="연도선택"
						class="selec" style="width: 120px">
						<option value="${leagueYar}">${leagueName}</option>
						<option value="2006">2006</option>
						<option value="2007">2007</option>
						<option value="2008">2008</option>
						<option value="2009">2009</option>
						<option value="2010">2010</option>
						<option value="2011">2011</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
						<option value="2023" selected='selected'>2023</option>
						<option value="2024">2024</option>
					</select> <select name="mm" onchange="form.submit();" title="월선택"
						class="selec" style="width: 90px">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03" selected='selected'>3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
			</form>
		</div>

		<script type="text/javascript" src="/common/js/jBox.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				// Tooltip above and centered, this is the default setting
				$('.DemoTooltipAbove').jBox('Tooltip', {
					offset : {
						x : 52,
						y : -5
					},
					pointer : 'left:0'
				});
			});
		</script>

</body>
</html>