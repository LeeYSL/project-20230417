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
				//로그인 안했으면 로그인창 뜨게해야함
				location.href = "${path}/market/marketForm";
			})
		});
		$(function(){
			$('#cart').on('click', function() {
				loaction.href = "${path}/market/cart";
			})
		});
	</script>
	<div id="main_div">
		<div class="w3-container w3-center">
			<h2 class="w3-center">마켓</h2>
			<div class="w3-container">
				<c:set var="i" value="0" />
				<c:set var="j" value="4" />
				<table class="w3-table-all">
					<c:forEach var="g" items="${list}">
							<c:if test="${i%j==0}">
								<tr>
							</c:if>
						<td width="25%">
							<div class="goodsdiv w3-center">
								<img src="${path}/upload/goods/${g.goodsImg}" class="goodsimg">
								<div class="w3-center">${g.goodsName}</div>
								<div class="w3-center">${g.goodsPrice}</div>
								<div>
									<button type="button" class="btn btn-dark w3-center" id="cart">장바구니 추가</button>
								</div>
							</div>
						</td>
						<c:if test="${i%j == j-1}">
							</tr>
						</c:if>
						<c:set var="i" value="${i+1}" />
						</c:forEach>
					
				</table>
				<table>
					<tr>
						<td colspan="5"   style="text-align:right">
							<button type="submit" class="btn btn-dark" id="btn">게시글 작성</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>