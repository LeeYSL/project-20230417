<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

			if (title === 'FAN') {
				title = '팬들에게';
			} else if (title === 'PLAYER') {
				title = '선수들에게';
			}
			$('#title').text(title);

			//게시글 작성 버튼 클릭 시 이벤트 호출
			$('.btn').on('click', function() {
				//로그인 안했으면 로그인창 뜨게해야함
				location.href = "${path}/board/writeForm";
			})
		});
	</script>
	<div id="container-1">
		<h2 id="title" class="w3-center"></h2>
		<div class="w3-container">
		<input type="hidden" name="sessionScope" value="${sessionScope.login}">
			<table class="w3-table-all">	
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					
				</tr>
				<c:forEach var="b" items="${list}">
					<tr>
						<td>${boardnum}</td>
						<c:set var="boardnum" value="${boardnum-1}" />
						<td width="50%"><c:if test="${!empty b.boardFile}">
								<a href="../upload/board/${b.boardFile}">@</a>
							</c:if> <c:if test="${empty b.boardFile}">
								&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if> <c:if test="${b.boardGrpLevel > 0}">
								<c:forEach var="i" begin="1" end="${b.boardGrpLevel > 0}">
									&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach> └ 
								</c:if> <a href="boardInfo?boardNum=${b.boardNum}">${b.boardTitle}</a>

						</td>
						<td>${b.memId}</td>
						<%-- 오늘 등록된 게시물 날짜 format대로 출력하기 --%>
						<td><fmt:formatDate value="${b.boardTime}" pattern="yyyy-MM-dd"/></td>
			            
						
					</tr>
				</c:forEach>

				<tr>
					<td colspan="5" style="text-align: right">
					</td>
					</tr>
				<tr>
					<td colspan="5" style="text-align: center;"><c:if
							test="${pageNum <=1 }">[이전]</c:if> <c:if test="${pageNum > 1 }">
							<a href="boardList?boardId=${boardId}&pageNum=${pageNum-1}">[이전]</a>
						</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a==pageNum}">[${a}]</c:if>
							<c:if test="${a != pageNum }">
								<a href="boardList?boardId=${boardId}&pageNum=${a}">[${a}]</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
							test="${pageNum < maxpage}">
							<a href="boardList?boardId=${boardId}&pageNum=${pageNum+1}">[다음]</a>
						</c:if></td>
				</tr>
				<tr>
					<td colspan="5" style="text-align: center;">
					  <c:if test="${sessionScope.login != null }">
						<button type="submit" class="btn btn-dark">게시글 작성</button></c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>