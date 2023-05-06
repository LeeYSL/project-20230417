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
	$(function() {
		//게시판 목록 이름을 파라미터의 ID로 변경
		let title = '${param.boardId}'; //같은변수명 재사용X , 값 변경 가능
		//const test = ""; //같은 변수명 재사용X , 값 변경 불가능
		//var test2 = ""; //같은 변수명 재사용 , 값 변경 가능
		
		if(title === 'FAN') {
			title = '팬들에게';
		} else if(title === 'PLAYER') {
			title = '선수들에게';
		}
		$('#title').text(title);
		
		//게시글 작성 버튼 클릭 시 이벤트 호출
		$('.btn').on('click', function() { 
			//로그인 안했으면 로그인창 뜨게해야함
			location.href="${path}/board/writeForm";
		})
	});

</script>
	<div id="main_div">
	<h2 id="title" class="w3-center"></h2>
	<div class="w3-container">
	<table class="w3-table-all">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>${b.boardNum}</td>
			<td>${b.boardTitle}</td>
			<td>${b.memId}</td>
			<%-- 오늘 등록된 게시물 날짜 format대로 출력하기 --%>
			<td>${b.boardTime}</td>
			<td>${b.boardReadCnt}</td>

		</tr>
		<tr>
			<td colspan="5" style="text-align: right">
				<button type="submit" class="btn btn-dark" ">게시글 작성</button>
			</td>
		</tr>
	</table>
	</div>
</div>
</body>
</html>