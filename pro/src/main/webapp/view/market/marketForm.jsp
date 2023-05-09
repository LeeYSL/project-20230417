<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<script type="text/javascript">
		$(function() {
			$('.btn').on('click', function() {
				location.href = "${path}/market/marketInfo";
			})
		})
	</script>
	<div id="main_div">
		<h2 class="w3-center">상품등록</h2>
		<div class="w3-container">
			<form action="market" method="post" name="f"
				enctype="multipart/form-data">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<th>상품번호</th>
							<td><input type="text" name="num" class="w3-input"></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" name="name" class="w3-input"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="price" class="w3-input"></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="file" class="w3-input"
								id="file"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark">등록</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>