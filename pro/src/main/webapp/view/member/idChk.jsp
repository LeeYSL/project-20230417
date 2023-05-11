<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복검색</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<style type="text/css">
.able {
	color: green;
	font-size: 15px;
}

.disable {
	color: red;
	font-size: 20px;
}
</style>
</head>
<body>
	<form action="pwSearch" method="post" name="f"
		enctype="multipart-formdata">
		<h3 class="w3-center">아이디 중복확인</h3>
		<div class="w3-container">
			<div class="form-group">
				<table class="w3-table w3-border ">
					<tr>
						<td>아이디</td>
						<td>"${param.id}"</td>
					</tr>
					<tr>
						<td colspan="2"><div id="msg">"${msg}"</div></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center"><button
								onclick="self.close()" class="btn btn-dart">닫기</button>
				</table>
			</div>
		</div>
	</form>
	<script>
 if (${able}) {
	 opener.document.f.id.className += " able";
	 
	document.querySelector("#msg").setAttribute("class","able")
  } else {
	opener.document.f.id.value=""
	document.querySelector("#msg").setAttribute("class","disable")
  }
</script>
</body>
</html>