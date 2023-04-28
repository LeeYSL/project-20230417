<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />OCTYPE html>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">상품등록</h2>
		<div class="w3-container">
			<form action="buy" method="post" name="f"
				enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<th>상품번호</th>
							<td><input type="text" id="pronum" class="w3-input"></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" id="proname" class="w3-input"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" id="proprice" class="w3-input"></td>
						</tr>
						<tr>
							<th>상세정보</th>
							<td><textarea rows="15" name="priceinfo" class="w3-input"></textarea></td>
						</tr>
						<tr>
							<th>재고</th>
							<td><input type="text" id="proprice" class="w3-input"></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="file" name="profile" class="w3-input"
								id="profile">
						<tr>
							<td colspan="2" style="text-align: center"><a
								href="javascript:inputcheck()">[등록]</a></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>