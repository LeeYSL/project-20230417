<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.select.Elements"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수단</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container-1">
		<h2 id="title" class="w3-center">선수?</h2>
		<div class="w3-container">
			<img src="${path}/image/profile/0.jpg"
				width="960px" height="516px" alt="메가왓티 퍼티위" />
			<!--player_profile_00.jpg에서 00은 리스트페이지에서 쏘는 넘버링으로 하겠습니다 -->
			<div class="p_namebox">
				<h4 class="player_tt">
					No.- Opposite(Spiker) <strong>메가왓티 퍼티위</strong>
				</h4>
			</div>
			<ul class="player_detail">
				<li><em>포지션</em>아포짓(스파이커)</li>
				<li><em>배번</em>-</li>
				<li><em>생년월일</em>1999.09.20</li>
				<!-- <li><em>혈액형</em>-</li>
						<li><em>소속팀 년차</em>1</li> -->
				<!-- <li><em>가족관계</em></li> -->
				<li><em>출신학교</em>-</li>
				<li><em>신장</em>
				<!-- /체중</em> -->185cm<!--  / --> <!-- </li> -->
			</ul>
		</div>
	</div>
</body>
</html>