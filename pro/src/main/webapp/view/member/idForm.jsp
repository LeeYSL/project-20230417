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
	<div class="container">
		<form action="join" method="post" name="f"
			enctype="multipart-formdata">
			<div class="form-group">
				<table class="w3-table w3-border ">

					<tr>
						<td>이름</td>
						<td><input type="text" name="name_find"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email_find"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>