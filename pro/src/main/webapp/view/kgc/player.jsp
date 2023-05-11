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
<body>
	<c:set var="a" value="Opposite(Spiker)" />
	<c:set var="b" value="Outside Hitter" />
	<c:set var="c" value="Middle Blocker" />
	<c:set var="d" value="Setter" />
	<c:set var="e" value="Libero" />


	<div id="container-1">
		<h3 class="h3Txt">선수</h3>
		<c:forEach var="m" items="${map}">
			<%--포지션별로 반복--%>
			<div id="list-1">
				<dl>
					<dt>${m.key}</dt>
					<dd>					
						<ul>
						<c:forEach var="p" items="${m.value}">
							<li><a href="profile?num=" +${p.num}> <img
									id="profileimg" src="${path}/image/profile1/${p.num}.jpg"
									alt="No.${p.num} ${p.name}" /> <span class="bg_name"><em>No.${p.num}</em><strong>${p.name}</strong></span>
							</a></li></c:forEach>
						</ul>
					</dd>
				</dl>
			</div>
		</c:forEach>
	</div>
</body>
</html>


