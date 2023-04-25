<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title><sitemesh:write property='title' /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<link rel=stylesheet
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<sitemesh:write property="head" />


</head>
<body id="myPage">

	<!-- Sidebar on click -->
	<nav
		class="w3-sidebar w3-bar-block w3-white w3-card w3-animate-left w3-xxlarge"
		style="display: none; z-index: 2" id="mySidebar">
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-bar-item w3-button w3-display-topright w3-text-teal">Close
			<i class="fa fa-remove"> </i>
		</a> <a href="#" class="w3-bar-item w3-button">Link 1</a> <a href="#"
			class="w3-bar-item w3-button">Link 2</a> <a href="#"
			class="w3-bar-item w3-button">Link 3</a> <a href="#"
			class="w3-bar-item w3-button">Link 4</a> <a href="#"
			class="w3-bar-item w3-button">Link 5</a>
	</nav>

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"> <i
				class="fa fa-bars"></i>
			</a> <a href="#" class="w3-bar-item w3-button w3-white"><img
				src="../image/kgclogo2.png" width="100%" height="40px"></a>
			<!-- <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">KGC</a>
	 <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Player</a>
	 <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Community</a>
	 <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Market</a>
	 <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Notice</a>   -->
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					KGC <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="../view/kgc/map.jsp" class="w3-bar-item w3-button">오시는
						길</a> <a href="../view/kgc/kgcInfo.jsp" class="w3-bar-item w3-button">구단
						기록</a>
				</div>
			</div>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					PLAYER <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="../view/kgc/player.jsp" class="w3-bar-item w3-button">선수단</a>
					<a href="../view/kgc/game.jsp" class="w3-bar-item w3-button">경기일정</a>
					<a href="../view/kgc/song.jsp" class="w3-bar-item w3-button">응원가</a>
				</div>
			</div>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					COMMUNITY<i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="../view/board/boardlist.jsp" class="w3-bar-item w3-button">팬들에게</a>
					<a href="../view/board/boardlist.jsp" class="w3-bar-item w3-button">선수들에게</a>
				</div>
			</div>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					MARKET<i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="https://www.vticket.co.kr/kgc-schedule-round1"
						class="w3-bar-item w3-button">TICKET</a> <a
						href="../view/member/marketForm.jsp" class="w3-bar-item w3-button">GOODS</a>
				</div>
			</div>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					NOTICE<i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="../view/board/boardlist.jsp" class="w3-bar-item w3-button">NOTICE</a>
					<a href="../view/board/boardlist.jsp" class="w3-bar-item w3-button">QNA</a>
				</div>
			</div>
			<a href="../view/member/joinForm.jsp"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
				title="Join">JOIN</a> <a href="../view/member/loginForm.jsp"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
				title="Login">LOGIN</a>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
			<a href="#team" class="w3-bar-item w3-button">KGC</a> <a href="#work"
				class="w3-bar-item w3-button">PLAYER</a> <a href="#pricing"
				class="w3-bar-item w3-button">COMMUNITY</a> <a href="#contact"
				class="w3-bar-item w3-button">MARKET</a> <a href="#"
				class="w3-bar-item w3-button">NOTICE</a>

		</div>
	</div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-top: 100px;">

		<div class="w3-panel">
			<sitemesh:write property="body" />
		</div>
		<!-- Footer -->
		<footer class="w3-container w3-padding-32 w3-theme-d1 w3-center">
			<h4>Follow Us</h4>
			<a href="https://www.facebook.com/VolleyballKgc/" title="Facebook"><img
				src="../image/sns_facebook.png"></a> <a
				href="https://www.youtube.com/@volleyballkgc"><img
				src="../image/sns_youtube.png"></a> <a
				href="https://m.post.naver.com/my.nhn?memberNo=44010406&navigationType=push"
				title="naver"><img src="../image/sns_navertv.png"></a> <a
				href="https://www.instagram.com/kgcvolley/" title="instagram +"><img
				src="../image/sns_insta.png"></a> <a
				href="https://tv.naver.com/kgcvolley" title="naver"><img
				src="../image/sns_navertv.png"></a>
			<p>주소넣기</p>
			<p>
				<a href="https://www.w3schools.com/w3css/default.asp"
					target="_blank">kgc 인삼공사</a>
			</p>


			<div style="position: relative; bottom: 100px; z-index: 1;"
				class="w3-tooltip w3-right">
				<span class="w3-text w3-padding w3-teal w3-hide-small">Go To
					Top</span> <a class="w3-button w3-theme" href="#myPage"><span
					class="w3-xlarge"> <i class="fa fa-chevron-circle-up"></i></span></a>
			</div>
		</footer>

		<script>
			new Swiper('.swiper', {
				//자동 재생
				autoplay : {
					delay : 3000, //재생 시간
					disableOnInteraction : false,
				},
				loop : true, //반복
				slidesPerView : 3, //한 페이지에 보여줄 항목 개수 지정
				spaceBetween : 0, //슬라이드끼리의 간격
				centeredSlides : true, //슬라이드 가운데정렬
				pagination : { //하단 버튼
					el : '.swiper-pagination',
					clickable : true
				},
				navigation : { //이전, 다음 버튼
					prevEl : '.swiper-button-prev',
					nextEl : '.swiper-button-next'
				}
			})

			// Script for side navigation
			function w3_open() {
				var x = document.getElementById("mySidebar");
				x.style.width = "300px";
				x.style.paddingTop = "10%";
				x.style.display = "block";
			}
			// Close side navigation
			function w3_close() {
				document.getElementById("mySidebar").style.display = "none";
			}
			// Used to toggle the menu on smaller screens when clicking on the menu button
			function openNav() {
				var x = document.getElementById("navDemo");
				if (x.className.indexOf("w3-show") == -1) {
					x.className += " w3-show";
				} else {
					x.className = x.className.replace(" w3-show", "");
				}
			}
		</script>
</body>
</html>