<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 거래내역</title>
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
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
</head>
<body>
		<div id="container-1">
		<h2 class="w3-center">포인트 거래내역</h2>
		<div class="w3-container" style="padding:40px;">
			<form name="f" method="post" action="list">
				<table class="table table-hover">
					<tr>
						<th width="5%">번호</th>
						<th width="20%">날짜</th>
						<th width="30%">이유</th>
						<th width="15%">증가</th>
						<th width="15%">감소</th>
						<th width="15%">총포인트</th>
					</tr>
					<c:forEach var="a" items="${list}">

						<tr>
							<td>${boardnum}</td>
							<c:set var="boardnum" value="${boardnum-1}" />
							<td><fmt:formatDate value="${a.accountDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
							<td>
								<c:if test="${a.accountReason== null}">가입 축하금 30,000원</c:if>
								<c:if test="${a.accountPlus> 0}">${a.accountReason} 충전</c:if>
							<c:if test="${a.accountMinus> 0}">${a.accountReason} 구매</c:if></td>
							<td><fmt:formatNumber value="${a.accountPlus}" pattern="###,###" />원</td>
							<td><fmt:formatNumber value="${a.accountMinus}" pattern="###,###" />원</td>
							<td><fmt:formatNumber value="${a.accountTotal}" pattern="###,###" />원</td> 
						</tr>

					</c:forEach>

					<tr>
						<td colspan="6" style="text-align: center;"><c:if
								test="${pageNum <=1 }">
							[이전]
						</c:if> <c:if test="${pageNum > 1 }">
								<a href="pointAccount?pageNum=${pageNum-1}">[이전]</a>
							</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a==pageNum}">[${a}]</c:if>
								<c:if test="${a != pageNum }">
									<a href="pointAccount?pageNum=${a}">[${a}]</a>
								</c:if>
							</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
								test="${pageNum < maxpage}">
								<a href="pointAccount?pageNum=${pageNum+1}">[다음]</a>
							</c:if></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>