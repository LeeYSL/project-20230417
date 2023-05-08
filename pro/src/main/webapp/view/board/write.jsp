<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
       <script>
    if(${dao.insert(board)}) {
    	response.sendRedirect("${list}");
    }else
      alert("게시물 등록 실패")
      location.href="writeForm" 
   </script>
  
   