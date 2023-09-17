<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>전체 구매 목록</title>
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
td {
	height: 60px;
}

</style>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
</head>
<body>

	<div id="container-1">
		<h2 class="w3-center">전체 구매 목록</h2>
		<div class="w3-container" style="padding:40px;">
			<form name="f" method="post" action="list">
				<table class="table table-hover">
					<tr>
						<th width="10%">아이디</th>
						<th width="20%">상품</th>
						<th width="5%">수량</th>
						<th width="10%">총금액</th>
						<th width="45%">배송지</th>
						<th width="10%">구매일</th>
					</tr>
					<c:forEach var="t" items="${tlist}">

						<tr>
							<td>${t.memId}</td>
							<td>
								<a href="../market/detail?code=${t.goodsCode}">							
									${t.goodsName}
								</a>
							</td>
							<td>${t.cartQuantity}</td>
							<td><fmt:formatNumber value="${t.goodsPrice * t.cartQuantity}" pattern="###,###" />원</td>
							<td>${t.memAddress}</td>
							<td><fmt:formatDate value="${t.orderDate}" pattern="yyyy-MM-dd"/></td>
						</tr>

					</c:forEach>
					<tr>
						<td colspan=" 6" style="text-align: center;"><c:if
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