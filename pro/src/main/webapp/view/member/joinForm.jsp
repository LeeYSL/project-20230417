<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">회원가입</h2>
		<div class="w3-container">
			<form action="join" method="post" name="f"
				enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" class="w3-input">
								<button type="button" class="btn btn-dark float-right"
									onclick="idchk()">중복체크</button></td>
						</tr>
						<tr>
							<td rowspan="2">비밀번호</td>
							<td><input type="text" name="pass1" class="w3-input"></td>
						</tr>
						<tr>
							<td><input type="text" name="pass2" class="w3-input"></td>
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
							<td colspan="2" style="text-align: center">
								<button type="button" class="btn btn-dark" onclick="join()">회원가입</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>