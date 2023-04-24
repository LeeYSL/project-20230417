<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 class="w3-center">게시판 리스트</h2>
	<table class="w3-table-all">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>${boardnum}</td>
			<td>${b.title}</td>
			<td>${b.writer}</td>	
<%-- 오늘 등록된 게시물 날짜 format대로 출력하기 --%>			
			<td></td>
			<td>${b.readcnt}</td>

		</tr>
	</table>

</body>
</html>