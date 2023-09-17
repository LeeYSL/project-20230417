<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
<script type="text/javascript">

function searchAddress() {
	new daum.Postcode({
		oncomplete : function(data) { // oncomplete : 콜백함수
			$("#address").val(data.address);
		}
	}).open();
}
	//회원가입 버튼 눌렀을 때
	function input_check(f) {
		if (f.id.value.trim() == "") {
			alert("아이디를 입력하세요")
			f.id.focus()
			return false;
		}
		if (f.pass.value.trim() == "") {
			alert("비밀번호를 입력하세요")
			f.pass.focus()
			return false;
		}
		if (f.name.value.trim() == "") {
			alert("이름을 입력하세요")
			f.name.focus()
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
		var valid_id = /^(?=.*[a-zA-Z0-9]).{5,15}$/;
		if (valid_id.test(f.id.value) == false) {
			alert("아이디는 영문자,숫자 조합으로 5~15자리 사용해야 합니다")
			f.id.focus()
			return false;
		}
		var valid_pass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		if (valid_pass.test(f.pass.value) == false) {
			alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~15자리 사용해야 합니다")
			f.pass.focus()
			return false;
		}
		var valid_email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (valid_email.test(f.email.value) == false) {
			alert("이메일을 형식에 맞게 입력하세요")
			f.email.focus()
			return false;
		}

		//중복체크했는지 체크
		if (!f.id.classList.contains('able')) { //id가 able이라는 클래스를 포함하고있는지 
			alert("중복체크를 하세요.")
			return false;
		}

		return true;
	}

	//중복체크 버튼 눌렀을 때
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
			<form action="joinAdd" method="post" name="f"
				onsubmit="return input_check(this)" enctype="multipart-formdata">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<td>아이디</td>
							<td style="padding-right: 250px;"><input type="text"
								name="id" class="w3-input" placeholder="영문자,숫자 조합으로 5~15자리">
								<button type="button" class="btn btn-dark float-right"
									onclick="idChk()">아이디 중복체크</button></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pass" class="w3-input"
								placeholder="영문자+숫자+특수문자 조합으로 8~15자리"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" class="w3-input"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="number" name="tel" class="w3-input"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="adress" class="w3-input"
								id="address" onclick="searchAddress();"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" class="w3-input"
								placeholder="(알파벳,숫자)@(알파벳,숫자).(알파벳,숫자)"></td>
						</tr>
						<tr>
							<td>회원 유형</td>
							<td>
							<input type="radio" name="type" value="1">관리자 
							<input type="radio" name="type" value="2">선수 
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
								<button type="submit" class="btn btn-dark" onclick="join()">회원 추가</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>