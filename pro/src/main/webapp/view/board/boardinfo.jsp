<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix uri="http://java.sun.com/jsp/jstl/core"%>
<!-- /pro/src/main/webapp/view/board/boardinfo.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<div class="w3-container w3-center">
		<h2 class="w3-center">${board_name}</h2>
		<table class="w3-table-all">
			<tr>
				<th>작성일:</th>
				<td>${board_title}</td>
				<th>작성자:</th>
				<td>${board_writer}</td>
				<th>조회수:</th>
				<td>${board_}</td>
			</tr>
			<tr>
				<th>${board_writer}</th>
				<td>${board_writer}</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${board_writer}</td>
			</tr>
			<tr>
				<th></th>
				<td>${board_writer}</td>
			</tr>

		</table>
	</div>
</body>
</html>