<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js">
	<script type="text/javascript">
		function idsend(showId) {
			  opener.document.f.id.value=showId; //부모창의 name이 f인 form 태그. name이 id인 태그의 value를 바꿔줌
			   self.close();
		}
 	</script>
</head>
<body>
	<div class="container">
		<table class="table">
			<tr>
		  		<th>아이디</th>
		    	<td>${showId}</td>
		    </tr>
		  	<tr>
		  		<td colspan="2">
		     	<input type="button" value="아이디 전송" onclick="idsend('${showId}');" class="btn btn-dark">
		  		</td>
		  	</tr>
		</table>
	</div>
</body>
</html>

