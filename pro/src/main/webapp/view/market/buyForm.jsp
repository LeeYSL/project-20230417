<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>굿즈구매</title>
<link rel="stylesheet" href="${path}/css/main.css">
<%--
<script type="text/javascript">
	function checkInfo() {
		if($("#checkinfo").is(":checked")) {		
		}	
	}
</script>
 --%>
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">굿즈구매</h2>
		<div class="w3-container">
			<form action="buy" method="post" name="f"
				enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<th colspan="2" style="text-align: right"><input
								type="checkbox" class="w3-right" id="checkinfo"
								onclick="checkInfo()"> 내 정보 가져오기
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						</tr>
						
						<tr>
							<th>구매상품</th>
							<td><c:forEach items="${list}" var="c">${c.goodsCode} &lt;${c.goodsCode}&gt;,</c:forEach></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" class="w3-input" value="${mem.memName}"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel" class="w3-input" value="${mem.memPhone}"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="adress" class="w3-input" value="${mem.memAdress}"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" class="w3-input" value="${mem.memEmail}"></td>
						</tr>
						<tr>
							<th>배송시 요청사항</th>
							<td><input type="text" name="request" class="w3-input"></td>
						</tr>
						<tr>
							<th>결제수단</th>
							<td><input type="radio" name="pay" checked value="1">카드
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="pay" checked value="2">계좌이체</td>
						</tr>
						<tr>
							<th>최종 결제 금액</th>
							<td>총 상품금액 ${c.goodsPrice} - 적립금 <input type="text" name="point" class="w3-input" value="${mem.memPoint}" style="width:150px">
						<%-- <button type="button" class="btn btn-dark" onclick="point()">포인트
									사용</button>--%>
							</td>
						</tr>
						<tr>
							<th>총 결제 금액</th>
							<td>${goods_price}<!-- 다시해야함 --></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="button" class="btn btn-dark" onclick="payment()">결제하기</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>