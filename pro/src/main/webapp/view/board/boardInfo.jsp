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
<script type="text/javascript">
function win_open() {
	   let op="width=500,height=350,left=50,top=150"
	   open(page,"",op)
}
</script>
</head>
<body> 
	<div id="main_div">
		<div class="w3-container w3-center">
			<h2 class="w3-center">${board_name}</h2>
			<table class="w3-table-all" style="height: 400px">
				<tr>
					<th>작성일:</th>
					<td>${b.boardTime}</td>
				</tr>
				<tr>
					<th>작성자:</th>
					<td>${b.memId}</td>
				</tr>
				<tr>
					<th>조회수:</th>
					<td>${b.boardReadCnt}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${b.boardTitle}</td>
				</tr>
				<tr style="height: 400px">
					<th>내용</th>
					<td>${b.boardContent}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><c:if test="${empty b.boardFile}">
						&nbsp;
					</c:if> <c:if test="${!empty b.boardFile}">
							<a href="../upload/board/${b.boardFile}">${b.boardFile}</a>
							<!-- 머슨말이지... -->
						</c:if></td>
				</tr>
				<tr>
					<td colspan="2" class="w3-center"><a
						href="replyForm?num=${b.boardNum}" class="btn btn-dark" >답변</a> <c:if
							test="${boardid !='1' || sessionScpoe.login == 'admin'}">
							<a href="updateForm?boardNum=${b.boardNum}" class="btn btn-dark">수정</a>
							<a href="deleteForm?boardNum=${b.boardNum}" class="btn btn-dark" >삭제</a>
						</c:if> <a href="boardList?boardId=${b.boardId}" class="btn btn-dark">목록</a></td>
				</tr>
			</table>
			<form action="comment" method="post">
				<table class="w3-table-all">
					<tr>
						<th>작성자 : ${sessionScope.login}</th>
						<th><input type="text" name="comment" class="w3-input">
						</th>
						<th><button type="submit" class="btn btn-dark"
								style="margin-top: 5px;">댓글등록</button>
					</tr>
				</table>
				<table class="w3-table-all">
					<tr>
						<th colspan="3" class="w3-center">댓글 목록</th>
					</tr>

					<tr>
						<th>작성자 : ${c.memId}</th>
						<th>${c.commentContent}</th>
						<th><button type="button" class="btn btn-dark"
								style="margin-top: 5px; margin-left: 1355px; padding-left: 25px; padding-right: 25px;" onclick="win_open()">삭제</button>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>
</html>