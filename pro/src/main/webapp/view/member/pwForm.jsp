<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<title>회원 탈퇴</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
</head>
<body>

	<h2 class="w3-center">비밀번호 찾기</h2>
	<div class="w3-container">
		<form action="pw" method="post" name="f"
			enctype="multipart-formdata">
			<div class="form-group">
				<table class="w3-table w3-border ">
					<tr>
						<td>이름</td>
						<td><input type="text" name="name_find" class="w3-input"></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id_find" class="w3-input"></td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email_find" class="w3-input"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center">
					<button type="button"class="btn btn-dark" onclick="pw_find()">비밀번호찾기</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>