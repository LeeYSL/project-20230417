<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>

<script type="text/javascript">
	function inputcheck(f) {
		//$('#pass').value()
		if (f.pass.value == '') {
			alert("비밀번호를 입력하세요")
			f.pass.focus()
			return false
		}
	}
</script>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="main_div">
		<div class="container">
			<form action="delete" method="post"
				onsubmit="return inputcheck(this)">
				<h2 class="w3-center">회원비밀번호 입력</h2>
				<table class="table">
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pass" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center"><button
								type="submit" class="btn btn-dark">탈퇴하기</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>