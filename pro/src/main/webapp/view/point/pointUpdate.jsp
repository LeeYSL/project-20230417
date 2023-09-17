<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 수정</title>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
<script type="text/javascript">
$(function() {
	//첨부파일 삭제 버튼 클릭 시 이벤트 호출
	$('#btnDelete1').on('click', function() {
		$('#file_desc1').text("");
		$('input[name="file"]').val("");
		$(this).hide();
	})
});
function input_check(f) {
	if (f.code.value.trim() == "") {
		alert("포인트 코드를 입력하세요")
		f.code.focus()
		return false;
	}
	if (f.name.value.trim() == "") {
		alert("포인트명을 입력하세요")
		f.name.focus()
		return false;
	}
	if (f.price.value.trim() == "" ) {
		alert("가격을 입력하세요")
		f.price.focus()
		return false;
	}
	if (f.pointImg.value.trim() == "") {
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
		<h2 class="w3-center" >포인트 수정</h2>
		<div class="w3-container" style="padding:40px;">
			<form action="update" method="post" name="f"
				onsubmit="return input_check(this)" enctype="multipart/form-data">
				<div class="form-group">
				<input type="hidden" name="code" value="${point.pointCode}">
					<table class="w3-table w3-border ">				
						<tr>
							<th>포인트명</th>
							<td><input type="text" name="name" class="w3-input"  value="${point.pointName}"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" name="price" class="w3-input"  value="${point.pointPrice}"></td>
						</tr>
						<tr>
							<th>포인트 사진</th>
							<td>
								<c:if test="${!empty point.pointImg}">
									<span id="file_desc1">${point.pointImg}</span>
									<button type="button" id="btnDelete1">삭제</button>
								</c:if> 
								<input type="file" name="file" class="w3-input" id="file">
								<input type="hidden" name="pointImg" value="${point.pointImg}">							
							</td>	
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark">포인트등록</button>
								<a href="pointBuy?code=${point.pointCode}">
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