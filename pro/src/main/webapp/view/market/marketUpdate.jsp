<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
<script type="text/javascript">
$(function() {
	//첨부파일 삭제 버튼 클릭 시 이벤트 호출
	$('#btnDelete1').on('click', function() {
		$('#file_desc1').text("");
		$('input[name="file"]').val("");
		$(this).hide();
	})
		$('#btnDelete2').on('click', function() {
		$('#file_desc2').text("");
		$('input[name="description"]').val("");
		$(this).hide();
	})
});
function input_check(f) {
	if (f.num.value.trim() == "") {
		alert("상품번호를 입력하세요")
		f.num.focus()
		return false;
	}
	if (f.name.value.trim() == "") {
		alert("상품명을 입력하세요")
		f.name.focus()
		return false;
	}
	if (f.price.value.trim() == "") {
		alert("가격을 입력하세요")
		f.price.focus()
		return false;
	}

	if (f.goodsImg.value.trim() == "") {
		alert("상품 사진을 등록하세요.")
		return false;
	}
	
	if (f.goodsDescription.value.trim() == "") {
		alert("상품 사진을 등록하세요.")
		return false;
	}
	return true;
}

</script>

</head>
<body>
	<div id="main_div">
		<h2 class="w3-center" >상품 수정</h2>
		<div class="w3-container" style="padding:40px;">
			<form action="update" method="post" name="f"
				onsubmit="return input_check(this)" enctype="multipart/form-data">
				<div class="form-group">
						<input type="hidden" name="code" value="${goods.goodsCode}">
					<table class="w3-table w3-border ">
						<tr>
							<th>재고수량</th>
							<td><input type="text" name="num" class="w3-input" value="${goods.goodsNum}"></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" name="name" class="w3-input" value="${goods.goodsName}"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="price" class="w3-input" value="${goods.goodsPrice}"></td>
						</tr>
						<tr>
							<th>상품사진</th>							
							<td>
								<c:if test="${!empty goods.goodsImg}">
									<span id="file_desc1">${goods.goodsImg}</span>
									<button type="button" id="btnDelete1">삭제</button>
								</c:if> 
								<input type="file" name="file" class="w3-input" id="file">
								<input type="hidden" name="goodsImg" value="${goods.goodsImg}">							
							</td>								
						</tr>
						<tr>
							<th>상품설명</th>
							<td>
								<c:if test="${!empty goods.goodsDescription}">
									<span id="file_desc2">${goods.goodsDescription}</span>
									<button type="button" id="btnDelete2">삭제</button>
								</c:if> 
								<input type="file" name="description"  class="w3-input">
								<input type="hidden" name="goodsDescription" value="${goods.goodsDescription}">
							</td>							
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark">상품수정</button>
								<a href="detail?code=${goods.goodsCode}">
									<button type="button" class="btn btn-dark">취소</button>
								</a>							
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>