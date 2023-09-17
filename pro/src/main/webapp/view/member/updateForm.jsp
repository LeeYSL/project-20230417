<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
<script type="text/javascript">
   function inputcheck(f) {
	   if(f.pass.value.trim() == "") {
		   alert("현재 비밀번호를 입력하세요");
		   f.pass.focus();
		   return false;
	   }
	   if(f.pass1.value.trim() == "") {
		   alert("변경 비밀번호를 입력하세요");
		   f.pass1.focus();
		   return false;
	   }
	   if(f.pass2.value.trim() == "") {
		   alert("변경 비밀번호를 재확인 하세요");
		   f.pass2.focus();
		   return false;
	   }
	
	   if (f.name.value.trim() == "") {
			alert("이름을 입력하세요")
			f.name.focus();
			return false;
		}

		if (f.tel.value.trim() == "") {
			alert("전화번호를 입력하세요")
			f.tel.focus()
			return false;
		}
		if (f.adress.value.trim() == "") {
			alert("주소를 입력하세요")
			f.adress.focus()
			return false;
		}
		if (f.email.value.trim() == "") {
			alert("이메일을 입력하세요")
			f.email.focus()
			return false;
		}
		  if(f.pass1.value.trim() != f.pass2.value.trim()) {
			   alert("변경 비밀번호가 일치하지 않습니다.");
			   f.pass1.focus();
			   return false;
		  }
		return true;
	   
   }
</script>

</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">회원정보수정</h2>
		<div class="w3-container">
			<form action="update" method="post" name="f"
				onsubmit="return inputcheck(this)">
				<div class="form-group">
					<table class="w3-table-all w3-border ">
						<tr>
							<td>아이디</td>
							<td>${mem.memId}</td>
						</tr>
						<tr>
							<td>현재비밀번호</td>
							<td><input type="password" name="pass" class="w3-input"></td>
						</tr>
						<tr>
							<td>변경비밀번호</td>
							<td><input type="password" name="pass1" class="w3-input"></td>
						</tr>
						<tr>
							<td>변경비밀번호 재확인</td>
							<td><input type="password" name="pass2" class="w3-input"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" class="w3-input"
								value="${mem.memName}"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="tel" class="w3-input"
								value="${mem.memPhone}"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="adress" class="w3-input"
								value="${mem.memAdress}"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" class="w3-input"
								value="${mem.memEmail}"></td>
						</tr>
						<tr>
							<td>회원 유형</td>
							<td>${mem.memPosition}</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark" >수정완료</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>