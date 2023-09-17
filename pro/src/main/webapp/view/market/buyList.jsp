<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>구매목록</title>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
<script type="text/javascript">
	function checkAll() {
		if ($("#check").is(":checked")) {
			$("input[type='checkbox']").prop("checked", true);
		} else {
			$("input[type='checkbox']").prop("checked", false);
		}
	}
</script>
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
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">구매목록</h2>
		<div class="w3-container" style="padding:40px;">
			<form name="f" method="post" action="buyForm">
				<table class="table table-hover">
					<tr>
						<th width="10%"></th>
						<th width="20%">상품</th>
						<th width="10%">가격</th>
						<th width="5%">수량</th>
						<th width="45%">배송지</th>
						<th width="10%">구매일</th>
					</tr>
					<c:if test="${oderCount > 0}">
					<c:forEach var="b" items="${buylist}">
					<tr>	
						<td>
							<a href="../market/detail?code=${b.goodsCode}">
								<img src="../goods/file/${b.goodsImg}" style="width: 50px; height: 50px;">
							</a>
						</td>							
						<td>
							<a href="../market/detail?code=${b.goodsCode}">
								${b.goodsName}
							</a>
						</td>
						
						<td><fmt:formatNumber value="${b.goodsPrice}" pattern="###,###" />원</td>
						<td>${b.cartQuantity}</td>
						<td>${b.memAddress}</td>
						<td><fmt:formatDate value="${b.orderDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			
				<tr>
					<td colspan="6" style="text-align: center;"><c:if
							test="${pageNum <=1 }">
							[이전]
						</c:if> <c:if test="${pageNum > 1 }">
							<a href="buyList?pageNum=${pageNum-1}">[이전]</a>
						</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a==pageNum}">[${a}]</c:if>
							<c:if test="${a != pageNum }">
								<a href="buyList?pageNum=${a}">[${a}]</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
							test="${pageNum < maxpage}">
							<a href="buyList?pageNum=${pageNum+1}">[다음]</a>
						</c:if></td>
				</tr>
				</c:if>
										<c:if test="${oderCount ==  0}">
											<tr>
												<th colspan="6" style="text-align: center;background: white; color:black;" >구매 내역이 없습니다.</th>
											</tr>
										</c:if>
				</table>
			</form>
		</div>
	</div>
</body>
</html>