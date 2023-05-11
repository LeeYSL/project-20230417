<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<script type="text/javascript">
		$(function() {
			//게시글 작성 버튼 클릭 시 이벤트 호출
			$('#btn').on('click', function() {
				location.href = "${path}/market/marketForm";
			})
		});
//		$(function(){
//			$('#cart').on('click', function() {
//				loaction.href = "${path}/market/cart";
	//		})
//		});
		function cartAdd(code) {
			location.href = "${path}/market/cart?code="+code;
		}
	</script>
	<div id="container-1">
		<div class="w3-container w3-center">
			<h2 class="w3-center">마켓</h2>


			<c:set var="i" value="0" />
			<c:set var="j" value="5" />
			<table class="w3-table-all">
				<c:forEach var="g" items="${list}">
					<c:if test="${i%j==0}">
						<tr>
					</c:if>
					<td width="20%">
						<div class="goodsdiv w3-center">
							<img src="${path}/image/goods/${g.goodsImg}" class="goodsimg">
							<div class="w3-center">${g.goodsName}</div>
							<div class="w3-center">${g.goodsPrice}</div>
							<c:if test="${sessionScope.login != null}">
								<div>
									<button type="button" class="btn btn-dark w3-center" id="cart"
										onclick="cartAdd(${g.goodsCode})">장바구니 추가</button>
								</div>
							</c:if>
						</div>
					</td>
					<c:if test="${i%j == j-1}">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1}" />
				</c:forEach>


				<tr>
					<td colspan="5" style="text-align: right"></td>
				</tr>

				<tr>
					<td colspan="5" style="text-align: center;"><c:if
							test="${pageNum <=1 }">
							[이전]
						</c:if> <c:if test="${pageNum > 1 }">
							<a href="marketList?pageNum=${pageNum-1}">[이전]</a>
						</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a==pageNum}">[${a}]</c:if>
							<c:if test="${a != pageNum }">
								<a href="marketList?pageNum=${a}">[${a}]</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
							test="${pageNum < maxpage}">
							<a href="marketList?pageNum=${pageNum+1}">[다음]</a>
						</c:if></td>
				</tr>

				<c:if test="${sessionScope.login == 'admin' }">
					<tr>
						<td colspan="5" style="text-align: right">
							<button type="submit" class="btn btn-dark" id="btn">게시글
								작성</button>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>