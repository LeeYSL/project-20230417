<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
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

	<h3 class="w3-center" style="padding:50px; text-align: center;">강제 탈퇴</h3>
	<div class="w3-container">
		<div class="form-group" style="margin-bottom: 20px;">
			<table style="text-align: center;">
				<tr style="text-align: center;">
					<td style="text-align: center;">${msg}</td>
				</tr>
			</table>
			<div style="margin: 100px 0px 20px 200px;">
			<button onclick="self.close()" class="btn btn-dark" >닫기</button>
		</div>
		</div>
	</div>
</body>
</html>