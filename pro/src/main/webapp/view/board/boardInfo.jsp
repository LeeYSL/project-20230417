<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<td>${board}</td>
			</tr>
			<tr>
				<th>작성자:</th>
				<td>${board_writer}</td>
			</tr>
			<tr>
				<th>조회수:</th>
				<td>${board}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${board_title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${board_content}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${empty board_file1}">
						&nbsp;
					</c:if>
					<c:if test="${!empty board_file1}">
						 <a href="../upload/board/${board_file1}">${board_file1}</a> <!-- 머슨말이지... -->
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>