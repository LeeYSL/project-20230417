<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 class="w3-center">아이디 찾기</h2>

	<div class="w3-container">
		<form action="id" method="post" name="f"
			enctype="multipart-formdata">
			<div class="form-group">
				<table class="w3-table w3-border ">

					<tr>
						<td>이름</td>
						<td><input type="text" name="name_find" class="w3-input"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email_find" class="w3-input"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center" class="w3-input">
							<button type="button" class="btn btn-dark" onclick="id_find()">아이디찾기</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>