<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<script type="text/javascript">
function Remove(code) {
	location.href = "${path}/member/delete?id="+code;
}

</script>
		<div id="container-1">
		<h2 class="w3-center">회원 리스트</h2>
		<div class="w3-container">
			<form name="f" method="post" action="list">
				<table class="table table-hover">
					<tr>
						<th>아이디</th>
						<th>이메일</th>
						<th>포지션</th>
						<th>포인트</th>
		<%--				<th>강제탈퇴</th> --%>
					</tr>
					<c:forEach var="m" items="${list}">

						<tr>
							<td>${m.memId}</td>
							<td>${m.memEmail}</td>
							<td>${m.memPosition==1?"관리자":m.memPosition==2?"선수":"일반"}</td>
							<td>${m.memPoint}</td>
	<%-- 				<td><button type="button" class="btn btn-dark"
									onclick="Remove(${m.memId})">탈퇴</button></td> --%>	
						</tr>

					</c:forEach>
					<tr>
						<td colspan="5" style="text-align: right"></td>
					</tr>

					<tr>
						<td colspan="5" style="text-align: center;"><c:if
								test="${pageNum <=1 }">
							[이전]
						</c:if> <c:if test="${pageNum > 1 }">
								<a href="list?pageNum=${pageNum-1}">[이전]</a>
							</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a==pageNum}">[${a}]</c:if>
								<c:if test="${a != pageNum }">
									<a href="list?pageNum=${a}">[${a}]</a>
								</c:if>
							</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
								test="${pageNum < maxpage}">
								<a href="list?pageNum=${pageNum+1}">[다음]</a>
							</c:if></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>