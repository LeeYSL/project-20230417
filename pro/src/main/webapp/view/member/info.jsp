<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript">
	function deleteForm() {	
		var op = "width=500, height=250, left=50, top=150";
		open("deleteForm","",op);
	}

</script>
</head>
<body>
	<div id="main_div">
		<h2 class="w3-center">회원 상세 정보</h2>
		<div class="w3-container">
			<form action="updateForm" method="post" name="f"
				enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table-all w3-border ">
						<tr>
							<td>아이디</td>
							<td>${mem.memId}</td>
						</tr>
						<tr>  
							<td>비밀번호</td>
							<td>${mem.memPw}</td>
						</tr>
					   	<tr>
							<td>이름</td>
							<td>${mem.memName}</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>${mem.memPhone}</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>${mem.memAdress}</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>${mem.memEmail}</td>
						</tr>
						<tr>
							<td>회원 유형</td>
							<td>${mem.memPosition}</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark" onclick="update()">수정</button>
								<button type="button" class="btn btn-dark" onclick="deleteForm()">탈퇴</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>