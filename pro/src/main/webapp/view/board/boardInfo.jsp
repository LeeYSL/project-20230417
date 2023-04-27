<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="main_div">
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
					<td><c:if test="${empty board_file1}">
						&nbsp;
					</c:if> <c:if test="${!empty board_file1}">
							<a href="../upload/board/${board_file1}">${board_file1}</a>
							<!-- 머슨말이지... -->
						</c:if></td>
				</tr>
				<tr>
					<td colspan="2" class="w3-center"><a
						href="replyForm?num=${b.num}">[답변]</a> <c:if
							test="${boardid !='1' || sessionScpoe.login == 'admin'}">
							<a href="updateForm?num=${b.num}">[수정]</a>
							<a href="deleteForm?num=${b.num}">[삭제]</a>
						</c:if> <a href="boardList">[목록]</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>