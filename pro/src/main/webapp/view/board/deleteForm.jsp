<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript">
	function delete_no() {
		//뒤로가기
		window.history.back();
	}
	function delete_yes() {
		// submit -> 삭제 
		document.f.submit(); //form document를 제출할거니?
	}
</script>
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">게시글 삭제</h2>
		<div class="w3-container" style="padding: 40px;">
		<form action="delete" method="post" name="f"
			enctype="multipart-formdata">
			<div class="form-group">
				<input type="hidden" name="boardNum" value="${param.boardNum}">
				<table class="w3-table w3-border ">
					<!-- boardNum을 받아올  -->
					<tr height="100px;">
						<th colspan="2" style="text-align: center;">글을 삭제하시겠습니까?</th>
					</tr>
					<tr>
						<td style="text-align: center" class="w3-input">
							<button type="button" class="btn btn-dark" onclick="delete_no()">취소</button>
							<button type="button" class="btn btn-dark" onclick="delete_yes()">확인</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
</body>
</html>