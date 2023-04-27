<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응원가</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<h2 class="w3-center">공식 응원가</h2>
<br>
<br>
<div class="container">
	<form action="pw" method="post" name="f"enctype="multipart-formdata">
		<div class="form-group w3-table w3-border">	
				<div class="w3-half ">
				<a href="teamsong.wav"><img src="${path}/image/kgclogo1.jpg" style="width:60%"></a>
			
				</div>
				<div class="w3-half w3-center"><br>
					우리 모두 하나가 되어 인삼공사 함께 외쳐라<br>
					인삼공사의 승리를 위하여 하나 되어 외쳐보리라<br>
					인삼공사의 승리를 위하여 우리 모두 외쳐보리라<br>
					<br>
					우리 모두 하나가 되어 인삼공사 함께 외쳐라<br>
					인삼공사의 승리를 위하여 하나 되어 외쳐보리라<br>
					인삼공사의 승리를 위하여 우리 모두 외쳐보리라<br>
					<br>
					인! 삼! 공! 사! 승! 리! 한! 다!<br>
					<br>
					우리 모두 하나가 되어 인삼공사 함께 외쳐라<br>
					인삼공사의 승리를 위하여 하나 되어 외쳐보리라<br>
					인삼공사의 승리를 위하여 우리 모두 외쳐보리라<br>
				</div>

			
		</div>
	</form>
</div>
</body>
</html>