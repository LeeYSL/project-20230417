<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복검색</title>

<style type="text/css">
   .able { color:green; font-size: 15px;}
   .disable { color:red; font-size: 20px;}
</style>
<body>
<div class="w3-container">
<table> <tr><td>아이디</td><td>"${param.memId}"</td></tr>
  <tr><td colspan="2"><div id="msg">"${msg}"</div></td></tr>
  <tr><td colspan="2"><button onclick="self.close()"
        class="btn btn-primary">닫기</button>

</table>    
</div>
<script>
 if (${able}) {
	 opener.document.f.id.style.color="green"
	 
	document.querySelector("#msg").setAttribute("class","able")
  } else {
	opener.document.f.id.value=""
	document.querySelector("#msg").setAttribute("class","disable")
  }
</script></body></html>