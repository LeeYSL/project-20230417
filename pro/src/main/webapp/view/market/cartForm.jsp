<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
OCTYPE html>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript">
	function checkAll() {
		if ($("#check").is(":checked")) {
			$("input[type='checkbox']").prop("checked", true);
		} else {
			$("input[type='checkbox']").prop("checked", false);
		}
	}
</script>
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">장바구니</h2>
		<div class="w3-container">
			<form name="f" method="post" action="buyForm">
				<table class="table table-hover">
					<tr>
						<th><input type="checkbox" id="check"
							onchange="checkAll()"></th>
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>가격<br>
						<th>삭제<br>
					</tr>
					<tr>
						<td><input type="checkbox" name="prochk" class="prochk"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button type="button" class="btn btn-dark"
								onclick="pro_delete()">삭제</button></td>
					</tr>
					<tr>
						<td colspan="6" style="text-align: center">
							<button type="submit" class="btn btn-dark" onclick="buy()">구매하기</button>
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>
</html>