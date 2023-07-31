<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓</title>
<script type="text/javascript">
	$(document).ready(function(){
		var $images1 = $("#container1 img");
		
		showGallery($images1,5,250,250); 
	});
	
	function showGallery($images,count,width,height){
		var length = $images.length;
		
		for(var i=0;i<length;i++) {
			var $img = $images.eq(i);
			
			var x = 20+((i%count)*width);
			var y = 70+(parseInt(i/count)*height);
			
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
	color : white;
}
th, td {
	text-align: center;
}
a {
	text-decoration: none;
	color: black;
}
.goodsimg {
	width: 200px;
	height: 200px;
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
				location.href = "${path}/market/marketForm";
			})
		});
		function cartAdd(code) {
			location.href = "${path}/market/cart?code="+code;
		};
		function detail(code) {
			loaction.href="${path}/market/detail?code="+code;
		};
	</script>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
	<div id="container-1">
			<h2 class="w3-center">마켓</h2>
		<div class="w3-container w3-center" style="padding:40px;">

			<div class="image-container" id="container1">
				<c:forEach var="g" items="${list}">
				<a href="detail?code=${g.goodsCode}">
					<img src="../goods/file/${g.goodsImg}" class="goodsimg" onMouseOver="this.src='${path}/image/logo/marketdetail.png'"
								onMouseOut="this.src='../goods/file/${g.goodsImg}'" border="0">
				</a>
				</c:forEach>	
			</div>
<%--
			<c:set var="i" value="0" />
			<c:set var="j" value="5" />
			<table class="w3-table-all">
				<c:forEach var="g" items="${list}">
					<c:if test="${i%j==0}">
						<tr>
					</c:if>
					<td width="20%">
						<div class="goodsdiv w3-center">
						<a href="detail?code=${g.goodsCode}">
							<img src="../goods/file/${g.goodsImg}" class="goodsimg" onMouseOver="this.src='${path}/image/logo/marketdetail.png'"
								onMouseOut="this.src='../goods/file/${g.goodsImg}'" border="0">

							</a>
							
							<input type="hidden" name="goodsCode" value="${g.goodsCode}">
							<div class="w3-center">${g.goodsName}</div>
							<div class="w3-center"><fmt:formatNumber value="${g.goodsPrice}" pattern="###,###" />원</div>
							
								<div>
									<button type="button" class="btn btn-dark w3-center" id="cart"
										onclick="cartAdd(${g.goodsCode})">장바구니 추가</button>
								</div>
							
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
				<c:if
							test="${pageNum <=1 }">
							[이전]
						</c:if> <c:if test="${pageNum > 1 }">
							<a href="marketList?pageNum=${pageNum-1}">[이전]</a>
						</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a==pageNum}">[${a}]</c:if>
							<c:if test="${a != pageNum }">
								<a href="marketList?pageNum=${a}">[${a}]</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
							test="${pageNum < maxpage}">
							<a href="marketList?pageNum=${pageNum+1}">[다음]</a>
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