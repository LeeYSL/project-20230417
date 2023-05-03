<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
	
	
<script type="text/javascript">
     function inputcheck(f) {
    	 if(f.pass.value=='') {
    		 alert("비밀번호를 입력하세요")
    		 f.pass.focus()
    		 return flase
    	 }
	}
  
     </script>
     </head>
     <body>
     <div class="container">
     <form action="delete" method="post" onsubmit="return inputcheck(this)">
       <input type="hidden" name="id" value="${param.id}" >
       <h2 id="center">회원비밀번호 입력</h2>
       <table class="table">
       <tr><th>비밀번호</th>
       <td><input type="password" name="pass" class="form-control"></td></tr>
       <tr><td colspan="2" style="text-align: center"><button type="submit" class="btn btn-dark">탈퇴하기</button></td></tr>    
       </table></form></div></body></html>