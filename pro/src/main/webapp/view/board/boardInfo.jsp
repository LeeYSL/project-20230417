<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript">
	function win_open() {
		let op = "width=500,height=350,left=50,top=150"
		open(page, "", op)
	}
</script>
</head>
<body>
	<div id="main_div" style="padding-bottom: 400px;">
		<div class="w3-container w3-center">
			<h2 class="w3-center">${board_name}</h2>
			<table class="w3-table-all" style="height: 100px">
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
					<td colspan="2" class="w3-center"><c:if
							test="${boardid !='1' || sessionScpoe.login == 'admin'}">
							<c:if
								test="${sessionScope.login != null && sessionScope.login ==b.memId }">
								<a href="updateForm?boardNum=${b.boardNum}" class="btn btn-dark">수정</a>
							</c:if>
							<c:if
								test="${sessionScope.login != null && sessionScope.login ==b.memId}">
								<a href="deleteForm?boardNum=${b.boardNum}" class="btn btn-dark">삭제</a>
							</c:if>
						</c:if> <a href="boardList?boardId=${b.boardId}" class="btn btn-dark">목록</a></td>
				</tr>
			</table>
			<form action="comment" method="post">
				<input type="hidden" name="boardNum" value="${b.boardNum}">
				<input type="hidden" name="MemId" value="${b.memId}">
				<table class="w3-table-all">
					<tr>
						<th>
						<td>${sessionScope.login}</td>
						<c:if test="${sessionScope.login != null}">
							<th><input type="text" name="comment" class="w3-input">
						</c:if>
						<c:if test="${sessionScope.login != null}">
							<th><button type="submit" class="btn btn-dark"
									style="margin-top: 5px;">댓글등록</button>
						</c:if>
					</tr>
				</table>
			</form>
			<div>
		       <form action="commupdate" method="post">
				<table class="w3-table-all">

					<tr>
						<th colspan="3" class="w3-center" style="text-align: center;">댓글
							목록</th>
					</tr>
					<c:forEach var="c" items="${commList}">
						<tr>
							<th>작성자:${c.memId}</th>
							<th>
							  <input type="text" name="commentContent" value="${c.commentContent}" class="w3-input">
							  <input type="hidden" name="boardNum" value="${param.boardNum}" >
							  <input type="hidden" name="commentNum" value="${c.commentNum}" >
							</th>
							<th class="w3-right">
							<c:if test="${sessionScope.login != null && sessionScope.login ==c.memId }">
									<a class="btn btn-dark"
										href="commdel?boardNum=${param.boardNum}&commentNum=${c.commentNum}">삭제</a>
								</c:if> 
								<c:if test="${sessionScope.login != null && sessionScope.login ==c.memId }">
									<button type="submit" class="btn btn-dark">수정</button>
								</c:if></th>

						</tr>

					</c:forEach>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>