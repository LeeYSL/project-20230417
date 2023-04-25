<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript">
	function allchkbox(chk){
		if(chk.checked) {
			document.querySelectorAll(".prochk").forEach((prochk)=>{
				prochk.setAttribute("checked","checked")
			})
		} else {
			document.querySelectorAll(".prochk").forEach((prochk)=>{
				prochk.removeAttribute("checked")
			})
		}
	}
</script>
</head>
<body>
 
	<div class="container">
		<h2 class="w3-center">장바구니</h2>
		<br> <br>
		<form name="f" method="post" action="cartForm" onsubmit="return input_check(this)">
			<table class="table table-hover">
				<tr>
					<th><input type="checkbox" name="allchk"
						onchange="allchkbox(this)"></th>
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
						<button type="button" class="btn btn-dark" onclick="pro_buy()">구매하기</button>
					</td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>