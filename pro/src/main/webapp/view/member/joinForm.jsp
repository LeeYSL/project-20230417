<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function idChk() {
		if (document.f.id.value == '') {
			alert("아이디를 입력하세요")
			f.id.focus()
		} else {
			let op = "width=500,height=200,left=50,top=150"
			open("idChk?id=" + document.f.id.value, "", op) //f이름을 가진 form 안에 name이 id인 값을 담아서 idChk로 id라는 변수에 담아서 이동
		}

	}
</script>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">회원가입</h2>
		<div class="w3-container">
			<form action="join" method="post" name="f" onsubmit="return input_check(this)"
				enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<td>아이디</td>
							<td style="padding-right: 360px;">
								<input type="text" name="id" class="w3-input">
								<button type="button" class="btn btn-dark float-right"
									onclick="idChk()">중복체크</button></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pass" class="w3-input"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" class="w3-input"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="tel" class="w3-input"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="adress" class="w3-input"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" class="w3-input"></td>
						</tr>
						<tr>
							<td>회원 유형</td>
							<td><input type="text" name="type" class="w3-input"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark" onclick="join()">회원가입</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>