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
<script type="text/javascript">

function input_check(f) {
	if (f.code.value.trim() == "") {
		alert("포인트 코드를 입력하세요")
		f.code.focus()
		return false;
	}
	if (f.name.value.trim() == "") {
		alert("상품명을 입력하세요")
		f.name.focus()
		return false;
	}
	if (f.price.value.trim() == "" ) {
		alert("가격을 입력하세요")
		f.price.focus()
		return false;
	}
	if (f.file.value.trim() == "") {
		alert("포인트 사진을 등록하세요.")
		return false;
	}

		if (isNaN(f.code.value) == true) {
			alert("포인트 코드는 숫자만 가능합니다.")
			f.code.focus()
			return false;
		}
	return true;
}

</script>

</head>
<body>
	<div id="main_div">
		<h2 class="w3-center" >상품등록</h2>
		<div class="w3-container" style="padding:40px;">
			<form action="point" method="post" name="f"
				onsubmit="return input_check(this)" enctype="multipart/form-data">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<th>상품코드</th>
							<td><input type="text" name="code" class="w3-input code"></td>
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
							<th>상품사진</th>
							<td><input type="file" name="file" class="w3-input"
								id="file"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark">상품등록</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>