<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 목록 보기</title>
</head>
<body>
	<div class="w3-container">
		<h2>${boardName}</h2>
		<table class="w3-table-all">
			<c:if test="${boaedcount==0}">
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${boardcount > 0 }">
			<tr>
				<td colspan="5" style="text-align: right">글개수:${boardcount}</td>
			</tr>
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">작성자</th>
				<th width="17%">등록일</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum -1}" />
					<td style="text-align: left"><c:if test="${!empty b.file1}">
							<a href="../upload/board/${b.file1}">@</a>
						</c:if> <c:if test="${empty b.file1}"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
						<c:if test="${b.grplevel > 0 }">
							<c:forEach var="i" begin="1" end="${b.grplevel}">
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  </c:forEach> └
						</c:if> <a href="info?num=${b.num}">${b.title}</a>
						<%-- 댓글 갯수 badge로 표현 시작 --%>
						<%--b.cnt 가 0보다 크면 댓글을 달거다. --%>
						<c:if test="${b.commcnt > 0}">
						<a href="info?num=${b.num}#comment"> <%--#commcnt :info에 commcnt로 가 --%>
						<span class="w3-badge w3-blue w3-tiny">${b.commcnt}</span>
						</a>
						</c:if>
						</td>
					<td>${b.writer}</td>
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="t" />
					<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd" var="r" />
					<td><c:if test="${t==r}">
							<fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss" />
						</c:if> <c:if test="${t!=r}">
							<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm" />
						</c:if></td>

					<td>${b.readcnt}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" style="text-align: center;">
				<c:if test="${pageNum <=1 }">[이전]</c:if> <c:if
						test="${pageNum > 1 }">
						<a href="list?pageNum=${pageNum}">[이전]</a>
					</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==pageNum}">[${a}]</c:if>
						<c:if test="${a != pageNum }">
							<a href="list?pageNum=${a}">[${a}]</a>
						</c:if>
					</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
						test="${pageNum < maxpage}">
						<a href="list?pageNum=${pageNum + 1}">[다음]</a>
					</c:if></td>
			</tr>
			</c:if>
			
		</table>
	</div>
</body>
</html>