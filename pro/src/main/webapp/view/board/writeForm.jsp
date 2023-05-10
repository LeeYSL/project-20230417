<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<script type="text/javascript">
	$(function() {
		$('.btn').on('click',function() {
			location.href="${path}/board/boardInfo";
		})
	})
</script>


	<div id="main_div">
		<h2 class="w3-center">게시판 글쓰기</h2>
		<div class="w3-container">
		<%--form action="write" : 내용을 wirte로 전송한다 --%>
			<form action="write" method="post" name="f" 
				enctype="multipart/form-data">
				<div class="form-group">
					<table class="w3-table w3-border ">
						<tr>
							<td>작성자</td>
							<td>${sessionScope.login}</td> <!--${sessionScope.login}:아이디 가져오기 login은 멤버컨트롤러에서 정했었음  -->
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" class="w3-input"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="15" name="content" class="w3-input"
									id="content"></textarea></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="file" name="file" class="w3-input"
								id="file">
						<tr>
							<td colspan="2" style="text-align: center">
							  
								<button type="submit" class="btn btn-dark">등록</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>