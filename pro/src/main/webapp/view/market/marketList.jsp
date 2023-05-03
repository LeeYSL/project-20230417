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
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">굿즈</h2>
		<div class="w3-container">
			<%
			String url = "https://www.kovomarket.co.kr/goods/goods_list.php?cateCd=013";
			Elements div = null;
			try {
				Document doc = Jsoup.connect(url).get();
				div = doc.select(".item_gallery_type li");
				out.println("<table class='w3-table-all w3-border'>");
				for (int i = 0; i < div.size(); i++) {
					if (i % 4 == 0)
				out.println("<tr>");
					out.println("<td>" + div.get(i).html() + "</td>");
					if (i % 4 == 3)
				out.println("</tr>");
				}
				out.println("</table>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			%>
			<hr><%=div.get(0).html()%>
		</div>
	</div>
</body>
</html>