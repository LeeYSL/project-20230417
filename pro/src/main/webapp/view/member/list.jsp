<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<%--/jspstudy2/src/main/webapp/view/member/list.jsp
	1. 관리자만 사용가능 페이지 => 검증
		- 로그아웃상태 : 로그인이 필요합니다. 메세지 출력. loginForm.jsp 페이지 이동
		- 로그인 상태 : 일반사용자 로그인시 "관리자만 가능합니다." 메세지 출력 main.jsp 페이지 이동
	2. db에서 모든 회원정보를 조회. List<Member> 객체로 리턴
		List<Member> MemberDao.list()
	3. List 객체를 화면에 출력하기
	
	=> 문제 : 아이디 클릭시 info.jsp 페이지 호출되도록 프로그램 수정하기.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>

	<div class="container">

		<h2 id="center">회원목록</h2>
		<form name="f" method="post" action="mailForm">
			<table class="table table-hover">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>전화</th>
					<th>전체선택<br>	
				</tr>
					<tr>
						<td>${m.name}</td>
						<td>${m.gender==1?"남":"여"}</td>
						<td>${m.tel}</td>
						<td><a href="updateForm?id=${m.id}">수정</a> <c:if
								test="${m.id != 'admin'}">
								<a href="deleteForm?id=${m.id}">강제탈퇴</a>
							</c:if></td>
						<td><input type="checkbox" name="idchks" class="idchk"
							value="${m.id}"></td>
					</tr>
	
			</table>
		</form>
	</div>
</body>
</html>
