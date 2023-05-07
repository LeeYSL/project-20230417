<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript">
   function input_check(f) {
	   if(f.id.value.trim() == '') {
		   alert("아이디를 입력하세요")
		   f.id.focus()
		   return false
	   }
	   if(f.pass.value.trim() == '') {
		   alert("비밀번호를 입력하세요")
		   f.pass.focus()
		   return false
	   }
   
	   return true
   }
   function win_open(page) {
	   let op="width=500,height=350,left=50,top=150"
	   open(page,"",op)
   }

</script>
</head>
<body> 
	<div id="main_div">
		<h2 class="w3-center">로그인</h2>
		<div class="w3-container">
			<form action="login" method="post" name="f" 
				enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" class="w3-input"></td>
							<td rowspan="2" style="padding-top: 40px;">
								<button type="submit" class="btn btn-dark" style="padding: 20px;">로그인</button>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pass" class="w3-input"></td>
						</tr>
						<tr>
							<td colspan="3" class="w3-center">
								<button type="button" onclick="win_open('idForm')"
									class="btn btn-dark">아이디찾기</button>
								<button type="button" onclick="win_open('pwForm')"
									class="btn btn-dark">비밀번호찾기</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>