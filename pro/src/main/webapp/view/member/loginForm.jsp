<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	   if(remember.checked) {
		   document.cookie="remember="+document.f.id.value
	   } else {
		   document.cookie="remember= "
	   }	   
	   return true
   }
   function win_open(page) {
	   let op="width=500,height=350,left=50,top=150"
	   open(page,"",op)
   }
   window.onload = function(){
	  let cookies = document.cookie.split(";")
	  for(let c of cookies) {
		  k = c.substr(0, c.indexOf("="))
		  v = c.substr(c.indexOf("=")+1)
		  if(k=='remember') {
			  document.f.id.value=v
			  if(v.trim() != "")
			     remember.checked = "checked"
		      else   
			     remember.checked = ""
			  break
		  }
	  }
   }
</script>
</head>
<body>
	<h2 class="w3-center">로그인</h2>
	<div class="container">
		<form action="join" method="post" name="f"
			enctype="multipart-formdata">
			<div class="form-group">
				<table class="w3-table w3-border ">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" class="w3-input"></td>
						<td rowspan="2" style="text-align: center">
							<button type="button" style="padding: 20px;" >로그인</button>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" name="pass" class="w3-input"></td>
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
</body>
</html>