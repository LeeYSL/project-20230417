<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
	<div class="container">
		<form action="id" method="post" name="f" enctype="multipart-formdata">
			<div class="form-group">
				<table class="w3-table w3-border ">

					<tr>
						<th colspan="2">글을 삭제하시겠습니까?</th>
					</tr>
					<tr>
						<td style="text-align: center" class="w3-input">
							<button type="button" class="btn btn-dark" onclick="delete_no()">취소</button>
						</td>
						<td style="text-align: center" class="w3-input">
							<button type="button" class="btn btn-dark" onclick="delete_yes()">확인</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>