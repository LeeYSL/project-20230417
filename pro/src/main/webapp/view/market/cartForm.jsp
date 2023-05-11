<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<script type="text/javascript">
	function checkAll() {
		if ($("#check").is(":checked")) {
			$("input[type='checkbox']").prop("checked", true);
		} else {
			$("input[type='checkbox']").prop("checked", false);
		}
	}
	function cartRemove(code) {
		location.href = "${path}/market/delete?code="+code;
	}
	function cartAdd(code) {
		location.href = "${path}/market/buyForm?code="+code;
	}

</script>
	<div id="main_div">
		<h2 class="w3-center">장바구니</h2>
		<div class="w3-container">
			<form name="f" method="post" action="buyForm">
				<table class="table table-hover">
					<tr>
		<%-- 		<th><input type="checkbox" id="check" onchange="checkAll()"></th>   --%>		
						<th>상품</th>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>삭제</th>
						<th>구매</th>
					</tr>
					<c:forEach var="c" items="${cartlist}">

						<tr>
				<%--			<td><input type="checkbox" name="prochks" class="prochk"></td>   --%>		
							<td><img src="${path}/image/goods/${c.goodsImg}"
								class="goods"></td>
							<td><input type="hidden" name="name" value="${c.goodsName}">${c.goodsName}</td>
							<td><input type="text" value="1" name="quantity"
								style="width: 40px"></td>
							<td>${c.goodsPrice}</td>
							<td><button type="button" class="btn btn-dark"
									onclick="cartRemove(${c.goodsCode})">삭제</button></td>
							<td><button type="button" class="btn btn-dark"
									onclick="cartAdd(${c.goodsCode})">구매</button></td>
						</tr>

					</c:forEach>
									<tr>
					<td colspan="6" style="text-align: right"></td>
				</tr>

				<tr>
					<td colspan="6" style="text-align: center;"><c:if
							test="${pageNum <=1 }">
							[이전]
						</c:if> <c:if test="${pageNum > 1 }">
							<a href="cartForm?pageNum=${pageNum-1}">[이전]</a>
						</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a==pageNum}">[${a}]</c:if>
							<c:if test="${a != pageNum }">
								<a href="cartForm?pageNum=${a}">[${a}]</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
							test="${pageNum < maxpage}">
							<a href="cartForm?pageNum=${pageNum+1}">[다음]</a>
						</c:if></td>
				</tr>
			<%--			<tr>
						<td colspan="7" style="text-align: center">
							<button type="submit" class="btn btn-dark" onclick="purchase()">구매하기</button>
						</td>
					</tr>   --%>	

				</table>
			</form>
		</div>
	</div>
</body>
</html>