<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body id="myPage">

<!-- Sidebar on click -->
<nav class="w3-sidebar w3-bar-block w3-white w3-card w3-animate-left w3-xxlarge" style="display:none;z-index:2" id="mySidebar">
	<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-display-topright w3-text-teal">Close
	  <i class="fa fa-remove"> </i>
	</a>
	<a href="#" class="w3-bar-item w3-button">Link 1</a>
	<a href="#" class="w3-bar-item w3-button">Link 2</a>
	<a href="#" class="w3-bar-item w3-button">Link 3</a>
	<a href="#" class="w3-bar-item w3-button">Link 4</a>
	<a href="#" class="w3-bar-item w3-button">Link 5</a>
</nav>

<!-- Navbar -->
<div class="w3-top">
	<div class="w3-bar w3-theme-d2 w3-left-align">
		<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()">
			<i class="fa fa-bars"></i>
		</a>
		<a href="#" class="w3-bar-item w3-button w3-white"><img src="../image/kgclogo2.png" width="100%" height="40px" ></a>
	<!-- <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">KGC</a>
	 <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Player</a>
	 <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Community</a>
	 <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Market</a>
	 <a href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Notice</a>   -->
		<div class="w3-dropdown-hover w3-hide-small">
			<button class="w3-button" title="Notifications">KGC <i class="fa fa-caret-down"></i></button>
			<div class="w3-dropdown-content w3-card-4 w3-bar-block">
				<a href="#" class="w3-bar-item w3-button">인삼공사소개</a> 
				<a href="#" class="w3-bar-item w3-button">오시는 길</a>
			</div>
		</div>
		<div class="w3-dropdown-hover w3-hide-small">
			<button class="w3-button" title="Notifications">PLAYER <i class="fa fa-caret-down"></i></button>
			<div class="w3-dropdown-content w3-card-4 w3-bar-block">
				<a href="#" class="w3-bar-item w3-button">선수단</a> 
				<a href="#" class="w3-bar-item w3-button">경기일정</a> 
				<a href="#" class="w3-bar-item w3-button">응원가</a>
			</div>
		</div>
		<div class="w3-dropdown-hover w3-hide-small">
			<button class="w3-button" title="Notifications">COMMUNITY<i class="fa fa-caret-down"></i></button>
			<div class="w3-dropdown-content w3-card-4 w3-bar-block">
				<a href="#" class="w3-bar-item w3-button">팬들에게</a> 
				<a href="#" class="w3-bar-item w3-button">선수들에게</a>
			</div>
		</div>
		<div class="w3-dropdown-hover w3-hide-small">
			<button class="w3-button" title="Notifications">MARKET<i class="fa fa-caret-down"></i></button>
			<div class="w3-dropdown-content w3-card-4 w3-bar-block">
				<a href="#" class="w3-bar-item w3-button">TICKET</a> 
				<a href="#" class="w3-bar-item w3-button">GOODS</a>
			</div>
		</div>
		<div class="w3-dropdown-hover w3-hide-small">
			<button class="w3-button" title="Notifications">NOTICE<i class="fa fa-caret-down"></i></button>
			<div class="w3-dropdown-content w3-card-4 w3-bar-block">
				<a href="#" class="w3-bar-item w3-button">NOTICE</a> 
				<a href="#" class="w3-bar-item w3-button">QNA</a>
			</div>
		</div>
		<a href="../view/joinForm.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal" title="Join">JOIN</a>
		<a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal" title="Login">LOGIN</a>
	</div>
	
	 <!-- Navbar on small screens -->
	<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
	  <a href="#team" class="w3-bar-item w3-button">KGC</a>
	  <a href="#work" class="w3-bar-item w3-button">PLAYER</a>
	  <a href="#pricing" class="w3-bar-item w3-button">COMMUNITY</a>
	  <a href="#contact" class="w3-bar-item w3-button">MARKET</a>
	  <a href="#" class="w3-bar-item w3-button">NOTICE</a>

	</div>
</div>

<!-- Image Header -->
<div class="w3-display-container w3-animate-opacity">
  <img src="../image/kgcimg1.jpg" alt="boat" style="width:100%;min-height:350px;max-height:600px;">
</div>

<!-- Modal -->
<div id="id01" class="w3-modal">
  <div class="w3-modal-content w3-card-4 w3-animate-top">
    <header class="w3-container w3-teal w3-display-container"> 
      <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-teal w3-display-topright"><i class="fa fa-remove"></i></span>
      <h4>Oh snap! We just showed you a modal..</h4>
      <h5>Because we can <i class="fa fa-smile-o"></i></h5>
    </header>
    <div class="w3-container">
      <p>Cool huh? Ok, enough teasing around..</p>
      <p>Go to our <a class="w3-text-teal" href="/w3css/default.asp">W3.CSS Tutorial</a> to learn more!</p>
    </div>
    <footer class="w3-container w3-teal">
      <p>Modal footer</p>
    </footer>
  </div>
</div>

<!-- Team Container -->
<div class="w3-container w3-padding-64 w3-center" id="team">
<h2>OUR TEAM</h2>
<p>슬로건 넣기?</p>

<div class="w3-row"><br>

<div class="w3-quarter">
  <img src="../image/playerImg/1.jpg" alt="Boss" style="width:45%" class="w3-circle w3-hover-opacity">
  <h3>Lee So Young</h3>
  <p>아웃사이드 히터</p>
</div> 

<div class="w3-quarter">
  <img src="../image/playerImg/3.jpg" alt="Boss" style="width:45%" class="w3-circle w3-hover-opacity">
  <h3>염 혜 선</h3>
  <p>세터</p>
</div>

<div class="w3-quarter">
  <img src="../image/playerImg/4.jpg" alt="Boss" style="width:45%" class="w3-circle w3-hover-opacity">
  <h3>이 예 솔</h3>
  <p>아포짓</p>
</div>

<div class="w3-quarter">
  <img src="../image/playerImg/5.jpg" alt="Boss" style="width:45%" class="w3-circle w3-hover-opacity">
  <h3>노 란</h3>
  <p>리베로</p>
</div>

</div>
</div>

<!-- Work Row 뉴스기사? -->
<div class="w3-row-padding w3-padding-64 w3-theme-l1 w3-center" id="work">
<h2>NEWS</h2>
<br>

<div class="w3-quarter">
<div class="w3-card w3-white">
  <a href="https://news.sbs.co.kr/news/endPage.do?news_id=N1007158800&plink=ORI&cooper=NAVER" target="blank"><img src="../image/news1.jpg" alt="Snow" style="width:100%"></a>
  <div class="w3-container">
  <p>여자배구 KGC인삼공사, FA 한송이 · 염혜선과 재계약</p>
  </div>
  </div>
</div>

<div class="w3-quarter">
<div class="w3-card w3-white">
  <img src="/w3images/snow.jpg" alt="Snow" style="width:100%">
  <div class="w3-container">
  <h3>Customer 1</h3>
  <h4>Trade</h4>
  <p>Blablabla</p>
  </div>
  </div>
</div>

<div class="w3-quarter">
<div class="w3-card w3-white">
  <img src="/w3images/lights.jpg" alt="Lights" style="width:100%">
  <div class="w3-container">
  <h3>Customer 2</h3>
  <h4>Trade</h4>
  <p>Blablabla</p>
  <p>Blablabla</p>
  <p>Blablabla</p>
  <p>Blablabla</p>
  </div>
  </div>
</div>

<div class="w3-quarter">
<div class="w3-card w3-white">
  <img src="/w3images/mountains.jpg" alt="Mountains" style="width:100%">
  <div class="w3-container">
  <h3>Customer 3</h3>
  <h4>Trade</h4>
  <p>Blablabla</p>
  <p>Blablabla</p>
  <p>Blablabla</p>
  <p>Blablabla</p>
  </div>
  </div>
</div>

</div>

<!-- Container -->
<div class="w3-container" style="position:relative">
  <a onclick="w3_open()" class="w3-button w3-xlarge w3-circle w3-teal"
  style="position:absolute;top:-28px;right:24px">+</a>
</div>



<!-- Image of location/map -->
<img src="/w3images/map.jpg" class="w3-image w3-greyscale-min" style="width:100%;">

<!-- Footer -->
<footer class="w3-container w3-padding-32 w3-theme-d1 w3-center">
  <h4>Follow Us</h4>
  <a href="https://www.facebook.com/VolleyballKgc/" title="Facebook"><img src="../image/sns_facebook.png"></a>
  <a href="https://www.youtube.com/@volleyballkgc"><img src="../image/sns_youtube.png"></a>
  <a href="https://m.post.naver.com/my.nhn?memberNo=44010406&navigationType=push" title="naver"><img src="../image/sns_navertv.png"></a>
  <a href="https://www.instagram.com/kgcvolley/" title="instagram +"><img src="../image/sns_insta.png"></a>
  <a href="https://tv.naver.com/kgcvolley" title="naver"><img src="../image/sns_navertv.png"></a>
  <p>주소넣기</p>
  <p><a href="https://www.w3schools.com/w3css/default.asp" target="_blank">kgc 인삼공사</a></p>
 

  <div style="position:relative;bottom:100px;z-index:1;" class="w3-tooltip w3-right">
    <span class="w3-text w3-padding w3-teal w3-hide-small">Go To Top</span>   
    <a class="w3-button w3-theme" href="#myPage"><span class="w3-xlarge">
    <i class="fa fa-chevron-circle-up"></i></span></a>
  </div>
</footer>

<script>
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
