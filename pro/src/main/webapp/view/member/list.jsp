<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<style type="text/css">
th {
	background: #343a40;
	color : white;
}
th, td {
	text-align: center;
}
a {
	text-decoration: none;
	color: black;
}

</style>
<script type="text/javascript">
	   function win_open(page) {
		   let op="width=500,height=350,left=50,top=150"
		   open(page,"",op)
	   }

</script>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
		<div id="container-1">
		<h2 class="w3-center">회원 리스트</h2>
		<div class="w3-container" style="padding:40px;">
			<form name="f" method="post" action="list">
				<table class="table table-hover">
					<tr>
						<th width="20%">아이디</th>
						<th width="20%">이메일</th>
						<th width="20%">전화번호</th>
						<th width="10%">포지션</th>
						<th width="20%">포인트</th>
						<th width="10%"></th>
					</tr>
					<c:forEach var="m" items="${list}">

						<tr>
							<td>${m.memId}</td>
							<td>${m.memEmail}</td>
							<td>${m.memPhone}</td>
							<td>${m.memPosition==1?"관리자":m.memPosition==2?"선수":"일반"}</td>
							<td><fmt:formatNumber value="${m.memPoint}" pattern="###,###" />원</td>
							<td>
								<button type="button" name="id" value="${m.memId}" class="btn btn-dark" onclick="win_open('dropForm?id=${m.memId}')">강제탈퇴</button>
							</td>

						</tr>

					</c:forEach>

					<tr>
						<td colspan="6" style="text-align: center;"><c:if
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