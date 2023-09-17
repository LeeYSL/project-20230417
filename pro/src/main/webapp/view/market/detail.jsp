<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
</head>
<body>
	<div id="container-1">
		<div class="w3-container w3-center">
			<h2 class="w3-center" style="padding: 40px;">상세페이지</h2>
			<table class="w3-table-all">
				<tr>
					<td style="width: 500px; text-align: center"><img
						src="../goods/file/${goods.goodsImg}"
						style="width: 500px; height: 500px;"></td>
					<td style="width: 300px; padding-top: 100px; padding-right: 30px;">
						<table class="w3-table-all" style="height: 300px;">
							<tr style="height: 20%">
								<td style="text-align: center">상품명</td>
								<td style="text-align: center">${goods.goodsName}</td>
							</tr>
							<tr style="height: 20%">
								<td style="text-align: center">가격</td>
								<td style="text-align: center"><fmt:formatNumber
										value="${goods.goodsPrice}" pattern="###,###" />원</td>
							</tr>
							<tr style="height: 40%">
								<td colspan="2">
									<form action="../market/cartAdd">
										<input type="hidden" name="code" value="${goods.goodsCode}">
										<table class="w3-table-all" style="border: none; background:#d3d3d3; height: 100px; " >
											<tr>
												<td style="text-align: center;  background:#d3d3d3; ">수량</td>
												<td style="text-align: center; background:#d3d3d3; "><select name="quantity"
													class="w3-select">
														<c:forEach begin="1" end="10" var="i">
															<option>${i}</option>
														</c:forEach>
												</select></td>

												<td style="text-align: center; background:#d3d3d3; "><input type="submit"
													class="btn btn-dark w3-center" value="장바구니 넣기"></td>
											</tr>

										</table>
									</form>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="text-align: center">
									<input type="button" value="상품목록" class="btn btn-dark w3-center"
										onclick="location.href='marketList'">
										<c:if test="${sessionScope.loginMem.memPosition == '1' }">
											<input type="button" value="상품수정" class="btn btn-dark w3-center"
												onclick="location.href='marketUpdate?code=${goods.goodsCode}'">								
										</c:if>	
								</td>						
							</tr>
						</table>

					</td>
				</tr>
				<tr>
					<td colspan="2"
						style="text-align: center; background: #343a40; color: white;">상품정보</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><img
						src="../goods/file/${goods.goodsDescription}"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>