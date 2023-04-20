<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="join" method="post" name="f" 
         onsubmit="return input_check(this)">
<div class="container">
	<h2 id="center">회원가입</h2>
	<div class="col-2">
		<div class="form-group">
			<label for="id">아이디</label>
				<input type="text" class="form-control" name="id" id="id">
				<button type="button" class="btn btn-dark float-right" onclick="idchk()">중복확인</button>
			<label for="pass">비밀번호</label>
				<input type="text" class="form-control" name="pass1" id="pass1">
				<input type="text" class="form-control" name="pass2" id="pass2">
				
		</div>
	
	</div>
</div>
</form>
</body>
</html> 