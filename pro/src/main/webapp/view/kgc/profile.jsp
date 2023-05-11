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
<c:forEach var="p" items="${list}">
<title>${p.name}</title>
</c:forEach>
</head>
<body>
	<div id="container-1">
		<h2 id="title" class="w3-center">선수?</h2>
		<div class="w3-container">
			<img src="${path}/image/profile/${p.num}.jpg"
				width="960px" height="516px" alt="${p.name}" />
			<!--player_profile_00.jpg에서 00은 리스트페이지에서 쏘는 넘버링으로 하겠습니다 -->
			<div class="p_namebox">
				<h4 class="player_tt">
					No.- Opposite(Spiker) <strong>${p.name}</strong>
				</h4>
			</div>
			<ul class="player_detail">
				<li><em>포지션</em>${p.position}</li>
				<li><em>배번</em>${p.num}</li>
				<li><em>생년월일</em>${p.birthday}</li>
				<li><em>출신학교</em>${p.school}</li>
				<li><em>신장</em>${p.height}</li>
		</ul>
		</div>
	</div>
</body>
</html>