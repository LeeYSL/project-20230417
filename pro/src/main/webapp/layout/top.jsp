<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- Navbar -->
<div class="w3-top">
	<div class="w3-bar w3-theme-d2 w3-left-align">
		<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()">
			<i class="fa fa-bars"></i>
		</a>
		<a href="#" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Logo</a>
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
		<a href="../view/member/joinForm.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal" title="Join">JOIN</a>
		<a href="../view/member/loginForm.jsp" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal" title="Login">LOGIN</a>
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

	
	

</body>
</html>