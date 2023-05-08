<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<script type="text/javascript">
		$(function() {
			//게시글 작성 버튼 클릭 시 이벤트 호출
			$('.btn').on('click', function() {
				//로그인 안했으면 로그인창 뜨게해야함
				location.href = "${path}/market/marketForm";
			})
		});
	</script>
	<div id="main_div">
		<div class="w3-container w3-center">
			<h2 class="w3-center">마켓</h2>
			<div class="w3-container">
				<table class="w3-table-all">
					<tr>
						<c:forEach var="g" items="${list}">
							<td width="25%">${c.marketTitle}</td>
						</c:forEach>
					</tr>
				</table>
				<table>
					<tr>
						<td colspan="5" style="text-align: right">
							<button type="submit" class="btn btn-dark">게시글 작성</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>