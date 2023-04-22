<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인삼공사</title>
</head>
<body>
	<h2 class="w3-center">게시판 글쓰기</h2>
	<div class="container">
		<form action="write" method="post" name="f"
			enctype="multipart-formdata">
			<div class="form-group">
				<table class="w3-table w3-border ">
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" class="w3-input"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" name="pass" class="w3-input"></td>
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
						<td><input type="file" name="file1" class="w3-input"
							id="file1">
					<tr>
						<td colspan="2" style="text-align: center"><a
							href="javascript:inputcheck()">[등록]</a></td>
					</tr>
				</table>
			</div>



		</form>
	</div>
</body>
</html>