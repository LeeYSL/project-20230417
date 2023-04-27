<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="${path}/css/main.css">


</head>
<body>
<script type="text/javascript">
	$('#title').text = "${param.id}";

	function write(){
		//로그인 안했으면 로그인창 뜨게해야함
	}
</script>
	<div id="main_div">
	<h2 id="title" class="w3-center">게시판 리스트</h2>
	<div class=w3-container>
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
		<tr>
			<td colspan="5" style="text-align: right">
				<button type="button" class="btn btn-dark" ><a href="${path}/board/writeForm">게시글 작성</a></button>
			</td>
		</tr>
	</table>
	</div>
</div>
</body>
</html>