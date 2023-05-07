<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>

	<div id="main_div">
		<form action="update" method="post" enctype="multipart/form-data"
			name="f">
			<div class="w3-container w3-center">
				<h2 class="w3-center">${board_name}</h2>
				<table class="w3-table-all">
					<tr>
						<th>작성자:</th>
						<td><input type="text" value="${b.memId}"
							class="w3-input"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" value="${b.boardTitle}"
							class="w3-input"></td>
					</tr>
					<tr style="height: 400px">
						<th>내용</th>
						<td><textarea rows="15" class="w3-input">${b.boardContent}</textarea></td>

							
					</tr>
					<tr>
						<!-- 몬말인지.... -->
						<td>첨부파일</td>
						<td style="text-align: left"><c:if test="${!empty b.boardFile}">
								<div id="file_desc">${b.boardFile}
									<a href="javascript:file_delete()">[첨부파일 삭제]</a>
								</div>
							</c:if> <input type="file" name="file1"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center" ><a href="javascript:document.f.submit()" class="btn btn-dark"  >게시물수정</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>