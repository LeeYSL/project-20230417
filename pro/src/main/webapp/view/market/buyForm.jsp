<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>굿즈구매</title>
<link rel="stylesheet" href="${path}/css/main.css"> 
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"> </script>

      	
<script type="text/javascript">

function input_check(f) {
	//상품금액이 포인트보다 크면 submit안되게 조건 추가
	if(parseInt(f.price.value) > parseInt(f.point.value)){
		alert("포인트가 부족하여 결제 불가능합니다.")
		return false;
	}
	return true;
}

function searchAddress() {
	new daum.Postcode({
        oncomplete: function(data) { // oncomplete : 콜백함수
        	$("#address").val(data.address);
        }
    }).open();
}

</script>


<style type="text/css">
	th, td {
		height: 50px;
		border: 0.1px solid #343a40;
	}
	th {
		background: #a9a9a9;
		width: 30%;
	}
	td {
		width: 70%;
	}
	
</style>
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">굿즈구매</h2>
		<div class="w3-container" style="padding:40px;">
			<form action="buy" method="post" name="f"
				onsubmit="return input_check(this)" enctype="multipart-formdata">
				<div class="form-group" style="padding-left: 350px;">
							<input type="hidden" name="name" value="${goods.goodsName}">
					<table class="w3-table-all"style="width:700px;" >

						<tr>
							<th>구매상품</th>
							<td><input type="hidden" name="goodsname" class="w3-input"
								value="${goods.goodsCode}">${goods.goodsName}</td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="hidden" name="quantity" class="w3-input"
								value="${cart.cartQuantity}">${cart.cartQuantity} 개</td>
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
						<%--
						<tr>
							<th>주소</th>
							<td><input type="text" name="address" class="w3-input"
								value="${mem.memAdress}"></td>
						</tr>
						 --%>
							<tr>
								<th>주소</th>
								<td><input name="address" class="w3-input"  id="address"  placeholder="주소"
										onclick="searchAddress();" value="${mem.memAdress}" />
								</td>
								
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
							<td>
								<input type="hidden" name=price class="w3-input"
								value="${goods.goodsPrice * cart.cartQuantity}">
								<fmt:formatNumber value="${goods.goodsPrice * cart.cartQuantity}" pattern="###,###" />원
							</td>
						</tr>	
						<tr> 
							<th>내 포인트</th>
							<td><input type="hidden" name="point" class="w3-input"
								value="${mem.memPoint}">
							<fmt:formatNumber value="${mem.memPoint}" pattern="###,###" />원	
							</td>
						</tr>
						<tr>
							<th>결제 후 포인트</th>
							<td><input type="hidden" name="afterPoint" class="w3-input"
								value="${mem.memPoint - goods.goodsPrice }">
								<fmt:formatNumber value="${mem.memPoint - goods.goodsPrice}" pattern="###,###" />원
							</td>
						</tr>
					</table>
						
				</div>
							<div style="text-align: center; padding-top:30px;">
								<button type="submit" class="btn btn-dark" onclick="payment()">포인트 결제하기</button>
								
						</div>
			</form>
		</div>
	</div>
</body>
</html>