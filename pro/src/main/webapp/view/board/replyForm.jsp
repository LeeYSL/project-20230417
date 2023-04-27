<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 답글 쓰기</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>

	<div id="main_div">
	<form action="reply" method="post" name="f">

		<table class="w3-table-all">
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="writer" class="w3-input">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" class="w3-input"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" class="w3-input"
					value="RE:${board.title}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="15" class="w3-input"
						id="conente"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="w3-center"><a
					href="javascript:document.f.submit()">[답변글등록]</a></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>