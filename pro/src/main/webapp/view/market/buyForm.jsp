<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>굿즈구매</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript">

function input_check(f) {
	//상품금액이 포인트보다 크면 submit안되게 조건 추가
	if(parseInt(f.cash.value) > parseInt(f.point.value)){
		alert("포인트가 부족하여 결제 불가능합니다.")
		return false;
	}
	return true;
}


</script>
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">굿즈구매</h2>
		<div class="w3-container">
			<form action="buy" method="post" name="f"
				onsubmit="return input_check(this)" enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table w3-border ">

						<tr>
							<th>구매상품</th>
							<%--	<td><c:forEach items="${list}" var="c">${c.goodsCode} &lt;수량:${c.cartQuantity}&gt;<br></c:forEach></td>
						 --%>
							<td><input type="hidden" name="goodsname" class="w3-input"
								value="${goods.goodsCode}">${goods.goodsName}</td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="text" name="quantity" class="w3-input"
								value="${cart.cartQuantity}" readonly></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" class="w3-input"
								value="${mem.memName}"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel" class="w3-input"
								value="${mem.memPhone}"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="address" class="w3-input"
								value="${mem.memAdress}"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" class="w3-input"
								value="${mem.memEmail}"></td>
						</tr>
		<%-- 			<tr>
							<th>결제수단</th>
							<td><input type="radio" name="pay" checked value="1">카드
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="pay" checked value="2">계좌이체</td>
						</tr>--%>
						<tr> 
							<th>상품금액</th>
							<td><input type="text" name="cash" class="w3-input"
								value="${goods.goodsPrice}" readonly></td>
						</tr>	
						<tr> 
							<th>내 포인트</th>
							<td><input type="text" name="point" class="w3-input"
								value="${mem.memPoint}" readonly></td>
						</tr>
						<tr>
							<th>결제 후 포인트</th>
							<td><input type="text" name="afterPoint" class="w3-input"
								value="${mem.memPoint - goods.goodsPrice }" readonly></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark" onclick="payment()">결제하기</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>