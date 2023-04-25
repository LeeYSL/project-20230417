<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
function write(){
	//로그인 안했으면 로그인창 뜨게해야함
}
</script>
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
		<tr>
			<td colspan="5" style="text-align: right">
				<button type="button" class="btn btn-dark" onclick="write()"><a href="writeForm.jsp">게시글 작성</a></button>
			</td>
		</tr>
	</table>

</body>
</html>