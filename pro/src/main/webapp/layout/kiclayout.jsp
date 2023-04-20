<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />    
<%-- /jspstudy2/src/main/webapp/layout/kiclayout.jsp --%>    
<!DOCTYPE html>
<html > 
<head>
<title><sitemesh:write property='title'/></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
  src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<sitemesh:write property='head'/>
</head>
<style>
#center {
	text-align: center;
}

#half {
	width: 45%;
}
</style>
<body>

	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<!-- Brand -->
		<a class="navbar-brand" href="#">
		<%-- /jspstudy2/src/main/webapp/image 폴더 생성
		     로고 이미지 복사하기
		     화면에 이미지 출력 확인 
		   --%>
		<img src="${path}/image/logo.png" width="80%"></a>

		<!-- Links -->
		<ul class="navbar-nav ">
		  <c:if test="${empty sessionScope.login}">
			<li class="nav-item"><a class="nav-link" 
			   href="${path}/member/joinForm">회원가입</a></li>
			<li class="nav-item"><a class="nav-link" 
			   href="${path}/member/loginForm">로그인</a></li> 
          </c:if> 
		  <c:if test="${!empty sessionScope.login}">
			<li class="nav-item"><a class="nav-link" 
			   href="${path}/member/main">${sessionScope.login}님</a></li>
			<li class="nav-item"><a class="nav-link" 
			   href="${path}/member/logout">로그아웃</a></li> 
          </c:if> 
			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" 
				href="#" id="navbardrop"
				data-toggle="dropdown"> 게시판 </a>
				<div class="dropdown-menu">
				 <a class="dropdown-item" 
				   href="${path}/board/list?boardid=1">공지사항</a>
				 <a	class="dropdown-item" 
				   href="${path}/board/list?boardid=2">자유게시판</a>
				 <a class="dropdown-item" 
				   href="${path}/board/list?boardid=3">QnA</a>
				</div></li>
			
		</ul>
	</nav>
	<hr>
	<sitemesh:write property='body'/>
	<hr>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>구디아카데미</p>
	</div>
</body>
</html>

