<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전</title>
<script type="text/javascript">
	$(document).ready(function(){
		var $images1 = $("#container1 img");
		
		showGallery($images1,5,250,250); 
	});
	
	function showGallery($images,count,width,height){
		var length = $images.length;
		
		for(var i=0;i<length;i++) {
			var $img = $images.eq(i);
			
			var x = 100+((i%count)*width);
			var y = 100+(parseInt(i/count)*height);
			
			$img.css({
				left:x,
				top:y
			});
		}
	}
</script>

<style type="text/css">
.pagenumstyle {
	padding: 30px;
}

th {
	background: #343a40;
	color: white;
}

th, td {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

#container-1 {
	position : relative;
}
div.image-container{
	position : relative;
	border:none;
	height: 500px;
}
div.image-container img {
	position: absolute;
	left:0;
	top:0;
	width: 180px;
}
</style>
<script type="text/javascript">
		$(function() {
			//게시글 작성 버튼 클릭 시 이벤트 호출
			$('#btn').on('click', function() {
				location.href = "${path}/point/pointForm";
			})
		});
		function pointAdd(code) {
			location.href = "${path}/point/pointBuy?code="+code;
		};
	</script>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="container-1">
			<h2 class="w3-center">포인트 충전</h2>
		<div class="w3-container w3-center" style="padding:40px;">

			<div class="image-container" id="container1">
				<c:forEach var="point" items="${list}">
				<a href="${path}/point/pointBuy?code=${point.pointCode}">
					<img src="../upload/point/${point.pointImg}">
				</a>
				</c:forEach>	
			</div>
<%--
			<c:set var="i" value="0" />
			<c:set var="j" value="5" />
				<table class="w3-table-all">
					<c:forEach var="point" items="${list}">
						<c:if test="${i%j==0}">
							<tr>
						</c:if>
						<td width="20%">
							<div class="goodsdiv w3-center">
								<img src="../upload/point/${point.pointImg}" class="goodsimg">
								<input type="hidden" name="pointCode" value="${point.pointCode}">
								<div class="w3-center">
									<fmt:formatNumber value="${point.pointPrice}" pattern="###,###" />
									원
								</div>
								<c:if test="${sessionScope.login != null}">
									<div>
										<button type="button" class="btn btn-dark w3-center"
											id="point" onclick="pointAdd(${point.pointCode})">포인트
											구매</button>
									</div>
								</c:if>
							</div>
						</td>
						<c:if test="${i%j == j-1}">
							</tr>
						</c:if>
						<c:set var="i" value="${i+1}" />
					</c:forEach>

				</table>



--%>
				<div class="pagenumstyle">
					<c:if test="${pageNum <=1 }">
							[이전]
						</c:if>
					<c:if test="${pageNum > 1 }">
						<a href="pointList?pageNum=${pageNum-1}">[이전]</a>
					</c:if>
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==pageNum}">[${a}]</c:if>
						<c:if test="${a != pageNum }">
							<a href="pointList?pageNum=${a}">[${a}]</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageNum >= maxpage}">[다음]</c:if>
					<c:if test="${pageNum < maxpage}">
						<a href="pointList?pageNum=${pageNum+1}">[다음]</a>
					</c:if>

				</div>
				
			<div class="pagenumstyle">
				<c:if test="${sessionScope.login == 'admin' }">

					<button type="submit" class="btn btn-dark" id="btn">상품 등록</button>

				</c:if>
			</div>
		</div>
	</div>
</body>
</html>