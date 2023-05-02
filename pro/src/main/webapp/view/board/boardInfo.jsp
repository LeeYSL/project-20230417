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
			<table class="w3-table-all" style="height: 400px">
				<tr>
					<th>작성일:</th>
					<td>${boardTime}</td>
				</tr>
				<tr>
					<th>작성자:</th>
					<td>${memId}</td>
				</tr>
				<tr>
					<th>조회수:</th>
					<td>${boardReadCnt}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${boardTitle}</td>
				</tr>
				<tr style="height: 400px">
					<th>내용</th>
					<td>${boardContent}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><c:if test="${empty boardFile}">
						&nbsp;
					</c:if> <c:if test="${!empty boardFile}">
							<a href="../upload/board/${boardFile}">${boardFile}</a>
							<!-- 머슨말이지... -->
						</c:if></td>
				</tr>
				<tr>
					<td colspan="2" class="w3-center"><a
						href="replyForm?num=${boardNum}">[답변]</a> <c:if
							test="${boardid !='1' || sessionScpoe.login == 'admin'}">
							<a href="updateForm?num=${boardNum}">[수정]</a>
							<a href="deleteForm?num=${boardNum}">[삭제]</a>
						</c:if> <a href="boardList">[목록]</a></td>
				</tr>
			</table>

			<table class="w3-table-all">
				<tr>
					<th>작성자 : ${memId}</th>
					<th><input type="text" name="comment" class="w3-input">
					</th>
					<th><button type="button" class="btn btn-dark"
							style="margin-top: 5px;">댓글등록</button>
				</tr>
			</table>
			<table class="w3-table-all">
				<tr>
					<th colspan="3" class="w3-center">댓글 목록</th>
				</tr>
				
				<tr>
					<th>작성자 : ${memId}</th>
					<th>${commentContent}</th>
					<th ><button type="button" class="btn btn-dark"
							style="margin-top: 5px;margin-left:1355px; padding-left:25px; padding-right:25px;">삭제</button>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>