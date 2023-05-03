<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript">
	function inputcheck(f) {
		if (f.pass.value == "") {
			alert("비밀번호를 입력하세요");
			f.pass.fouse();
			return false;
		}
	}

</script>

<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">회원정보 수정</h2>
		<div class="w3-container">
			<form action="update" method="post" name="f"
				onsubmit="return inputcheck(this)">
				<div class="form-group">
					<table class="w3-table-all w3-border ">
						<tr>
							<td>아이디</td>
							<td>${mem_id}</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pass" class="w3-input"
								value="${mem_id}"></td>
						</tr>
						<tr>
							<td>변경할 비밀번호</td>
							<td><input type="password" name="pass1" class="w3-input"></td>
						</tr>
						<tr>
							<td>변경할 비밀번호 재확인</td>
							<td><input type="password" name="pass2" class="w3-input"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" class="w3-input"
								value="${mem_id}"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="tel" class="w3-input"
								value="${mem_id}"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="adress" class="w3-input"
								value="${mem_id}"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" class="w3-input"
								value="${mem_id}"></td>
						</tr>
						<tr>
							<td>회원 유형</td>
							<td>${mem_id}</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark" onclick="join()">수정완료</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>