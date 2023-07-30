<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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
<%--
<link rel=stylesheet
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"> --%>
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
/* footer 하단 고정 [S] */
html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}

#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
    margin-top: 56px;
    padding-bottom: 250px; /* footer의 높이 */
}

#footer {
    width: 100%;
    height: 250px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
   
}

#divfooter {
	margin : 60px;
}
/* footer 하단 고정 [E] */

</style>
<sitemesh:write property="head" />

</head>

<body id="myPage">
	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"> <i
				class="fa fa-bars"></i>
			</a> <a href="${path}/kgc/main" class="w3-bar-item w3-button w3-white"><img
				src="${path}/image/kgclogo2.png" width="100%" height="40px"></a>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					KGC <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="${path}/kgc/map" class="w3-bar-item w3-button">오시는길</a> 
					<a href="${path}/kgc/kgcInfo" class="w3-bar-item w3-button">구단기록</a>
				</div>
			</div>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					PLAYER <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="${path}/kgc/player" class="w3-bar-item w3-button">선수단</a>
					<a href="${path}/kgc/game" class="w3-bar-item w3-button">경기일정</a>
					<a href="${path}/kgc/song" class="w3-bar-item w3-button">응원가</a>
				</div>
			</div>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					COMMUNITY<i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="${path}/board/boardList?boardId=FAN" class="w3-bar-item w3-button">팬들에게</a>
					<a href="${path}/board/boardList?boardId=PLAYER" class="w3-bar-item w3-button">선수들에게</a>
				</div>
			</div>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					MARKET<i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
						<a href="${path}/market/marketList" class="w3-bar-item w3-button">상품</a>
					<a href="https://tickets.interpark.com/special/sports/promotion?seq=21&"
						class="w3-bar-item w3-button" target="_blank">티켓</a> 
				</div>
			</div>
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-button" title="Notifications">
					NOTICE<i class="fa fa-caret-down"></i>
				</button>  
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="${path}/board/boardList?boardId=NOTICE" class="w3-bar-item w3-button">NOTICE</a>
					<a href="${path}/board/boardList?boardId=QNA" class="w3-bar-item w3-button">QNA</a>
				</div>
			</div>
			<c:if test="${empty sessionScope.login}">
			<a href="${path}/member/joinForm"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
				title="Join">JOIN</a> 
		    <a href="${path}/member/loginForm"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
				title="Login">LOGIN</a>
			</c:if>
			<c:if test="${!empty sessionScope.login}">
			<a href="${path}/member/logout"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
				title="Logout">LOGOUT</a>
			<div class="w3-dropdown-hover w3-hide-small w3-right">
				<button class="w3-button" title="Mypage">
					${sessionScope.login}님 MYPAGE<i class="fa fa-caret-down"></i>
				</button>  
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="${path}/member/info" class="w3-bar-item w3-button">회원 정보</a>
					<a href="${path}/point/pointAccount" class="w3-bar-item w3-button">포인트 내역</a>
					<a href="${path}/point/pointList" class="w3-bar-item w3-button">포인트 충전</a>
					<a href="${path}/market/cartForm" class="w3-bar-item w3-button">장바구니</a>
					<a href="${path}/market/buyList" class="w3-bar-item w3-button">구매 목록</a>
					<c:if test="${sessionScope.login == 'admin' }">
						<a href="${path}/market/marketForm" class="w3-bar-item w3-button">상품 추가</a>
						<a href="${path}/member/list" class="w3-bar-item w3-button">회원 리스트</a>
						<a href="${path}/market/list" class="w3-bar-item w3-button">회원 구매 리스트</a>
					</c:if>
				</div>
			</div>	
			</c:if>
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
	<div class="w3-main"  id="body-wrapper">

		<div  id="body-content">
			<sitemesh:write property="body" />
		</div>

	
	
		<!-- Footer -->
		<footer class="w3-container w3-padding-1 w3-theme-d1 w3-center" id="footer">
		<div id="divfooter">
			<a href="https://www.facebook.com/VolleyballKgc/" title="Facebook"><img
				src="${path}/image/sns_facebook.png"></a> <a
				href="https://www.youtube.com/@volleyballkgc"><img
				src="${path}/image/sns_youtube.png"></a> <a
				href="https://m.post.naver.com/my.nhn?memberNo=44010406&navigationType=push"
				title="naver"><img src="../image/sns_navertv.png"></a> <a
				href="https://www.instagram.com/kgcvolley/" title="instagram +"><img
				src="${path}/image/sns_insta.png"></a> <a
				href="https://tv.naver.com/kgcvolley" title="naver"><img
				src="${path}/image/sns_navertv.png"></a>
			<br>
			<br>
			<p>
			GDJ62기 공공데이터 융합 자바/스프링 개발자 양성과정 프로젝트
			</p>
			</div>
		</footer>
	</div>
</body>
</html>