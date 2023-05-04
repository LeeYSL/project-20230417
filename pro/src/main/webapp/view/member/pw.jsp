<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- /jspstudy2/src/main/webapp/view/member/pw.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script type="text/javascript">
	function pwsend(showPass) {
		opener.document.f.pass.value = showPass; //부모창의 name이 f인 form 태그. name이 id인 태그의 value를 바꿔줌
		self.close();
	}
</script>
</head>
<body>
	<div class="container">
		<table class="table">
			<tr>
				<th>비밀번호</th>
				<td>**${showPass}</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="비밀번호 전송"
					onclick="pwsend('${showPass}');" class="btn btn-dark"></td>
			</tr>
		</table>
	</div>
</body>
</html>