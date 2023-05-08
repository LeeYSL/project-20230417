<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 상세보기</title>
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
		<div class="w3-container w3-center">
		<h2 class="w3-center">상품정보</h2>
			<form action="buy" method="post" name="f"
				enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<th>상품번호</th>
							<td>${c.goodsCode}</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td>${c.goodsName}</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>${c.goodsPrice}</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<c:if test="${empty c.goodsImg}">
									&nbsp;
								</c:if> 
								<c:if test="${!empty c.goodsImg}">
									<a href="../upload/marktet/${c.goodsImg}">${c.goodsImg}</a>
									<!-- 머슨말이지... -->
								</c:if>
							</td>
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