<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.select.Elements"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수단</title>
<link rel="stylesheet" href="${path}/css/main.css?ver=20230810">
</head>
<body>
	<div id="container-1">
			<h3 class="h3Txt">선수</h3>
			<div id="list-1">
				<dl>
					<dt>
						Opposite<br>(Spiker)
					</dt>
					<dd>
						<ul>
							<li><a href="profile?num="+${profileNum}><img id="profileimg"
									src="${path}/image/profile1/0.jpg" alt="No.0 메가왓티 퍼티위" /><span
									class="bg_name"><em>No.0</em><strong>메가왓티퍼티위</strong></span></a></li>
							<li><a href="profile?num=4"><img id="profileimg"
									src="${path}/image/profile1/1.jpg" alt="No.4 이예솔" /><span
									class="bg_name"><em>No.4</em><strong>이예솔</strong></span></a></li>
						</ul>
					</dd>
				</dl>
			</div>
			<!-- //RIGHT -->
			<!-- LEFT -->
			<div id="list-1">
				<dl>
					<dt>
						Outside<br>Hitter
					</dt>
					<dd>
						<ul>
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/2.jpg" alt="No.1 이소영" /><span
									class="bg_name"><em>No.1</em><strong>이소영</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/3.jpg" alt="No.11 박혜민" /><span
									class="bg_name"><em>No.11</em><strong>박혜민</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/4.jpg" alt="No.15 이선우" /><span
									class="bg_name"><em>No.15</em><strong>이선우</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/5.jpg" alt="No.16 고의정" /><span
									class="bg_name"><em>No.16</em><strong>고의정</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
						</ul>
					</dd>
				</dl>
			</div>
			<div id="list-1">
				<dl>
					<dt>
						Middle<br>Blocker
					</dt>
					<dd>
						<ul>
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/6.jpg" alt="No.6 박은진" /><span
									class="bg_name"><em>No.6</em><strong>박은진</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/7.jpg" alt="No.12 한송이" /><span
									class="bg_name"><em>No.12</em><strong>한송이</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/8.jpg" alt="No.17 정호영" /><span
									class="bg_name"><em>No.17</em><strong>정호영</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/9.jpg" alt="No.18 이지수" /><span
									class="bg_name"><em>No.18</em><strong>이지수</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
						</ul>
					</dd>
				</dl>
			</div>
			<!-- //CENTER -->
			<!-- SETTER -->
			<div id="list-1">
				<dl>
					<dt>
						Setter<br>&nbsp;
					</dt>
					<dd>
						<ul>
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/10.jpg" alt="No.3 염혜선" /><span
									class="bg_name"><em>No.3</em><strong>염혜선</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/11.jpg" alt="No.13 박은지" /><span
									class="bg_name"><em>No.13</em><strong>박은지</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/12.jpg" alt="No.14 김채나" /><span
									class="bg_name"><em>No.14</em><strong>김채나</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/13.jpg" alt="No.19 김현지" /><span
									class="bg_name"><em>No.19</em><strong>김현지</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
						</ul>
					</dd>
				</dl>
			</div>

			<div id="list-1">
				<dl>
					<dt>
						Libero<br>&nbsp;
					</dt>
					<dd>
						<ul>
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/14.jpg" alt="No.5 노란" /><span
									class="bg_name"><em>No.5</em><strong>노란</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/15.jpg" alt="No.7 고민지" /><span
									class="bg_name"><em>No.7</em><strong>고민지</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/16.jpg" alt="No.9 서유경" /><span
									class="bg_name"><em>No.9</em><strong>서유경</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
							<li><a href="profile"><img id="profileimg"
									src="${path}/image/profile1/17.jpg" alt="No.20 최효서" /><span
									class="bg_name"><em>No.20</em><strong>최효서</strong></span></a></li>
							<!-- 이미지사이즈 180*204px -->
						</ul>
					</dd>
				</dl>
			</div>
		</div>

</body>
</html>


