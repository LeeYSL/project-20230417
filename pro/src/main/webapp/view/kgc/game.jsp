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

			<form name="game" action="?">
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
<!-- 

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
 -->

</body>
</html>