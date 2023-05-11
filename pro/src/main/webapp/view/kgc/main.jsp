<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--메인수정 --%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kgc 인삼공사</title>

<!-- SWIPER 외부 라이브러리 연결-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
 
<style>
.swiper {
	height: 450px;
	position: relative;
	z-index:0;
}

.swiper .swiper-slide {
	width: 80%;
	height: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.swiper .swiper-slide .w3-quarter {
	width: 100%;
}

.swiper .swiper-slide .w3-quarter img {
	width: 35%;
}

.swiper .swiper-slide .w3-quarter h3 {
	font-family: "Segoe UI", Arial, sans-serif;
	font-weight: 400;
	margin: 5px 0;
}
.w3-container-news {
	height :70px;
}
#news{
	text-align: center;
	padding-top: 25px;
}

</style>
</head>
<body>

<!-- Image Header -->
<div class="w3-display-container w3-animate-opacity">
  <img src="${path}/image/kgcimg1.jpg" alt="boat" style="width:100%;min-height:350px;max-height:600px;">
</div>


<!-- Team Container -->
<div class="w3-container w3-padding-64 w3-center" id="team">

<!-- Slider main container start -->
    <div class="swiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/1.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>이 소 영</h3>
            <p>아웃사이드 히터</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/3.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>염 혜 선</h3>
            <p>세터</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/4.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>이 예 솔</h3>
            <p>아포짓</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/5.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>노 란</h3>
            <p>리베로</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/6.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>박 은 진</h3>
            <p>미들 블로커</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/7.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>고 민 지</h3>
            <p>리베로</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/9.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>서 유 경</h3>
            <p>리베로</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/11.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>박 혜 민</h3>
            <p>아웃사이드 히터</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/12.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>한 송 이</h3>
            <p>미들 블로커</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/13.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>박 은 지</h3>
            <p>세터</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/14.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>김 채 나</h3>
            <p>세터</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/15.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>이 선 우</h3>
            <p>아웃사이드 히터</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/16.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>고 의 정</h3>
            <p>아웃사이드 히터</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/17.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>정 호 영</h3>
            <p>미들 블로커</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/18.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>이 지 수</h3>
            <p>미들 블로커</p>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="w3-quarter">
            <img src="${path}/image/playerImg/20.jpg" alt="Boss"
              class="w3-circle w3-hover-opacity">
            <h3>최 효 서</h3>
            <p>리베로</p>
          </div>
        </div>
      </div>

      <!-- Slider 하단 버튼-->
      <div class="swiper-pagination"></div>

      <!-- Slider 이전, 다음 버튼-->
      <div class="swiper-button-prev">
        <div class="material-icons"></div>
      </div>
      <div class="swiper-button-next">
        <div class="material-icons"></div>
      </div>
    </div>
    <!-- Slider main container end-->
  </div>

<!-- Work Row 뉴스기사? -->
<div class="w3-row-padding w3-padding-64 w3-theme-l1 w3-center" id="work">
<h2>NEWS</h2>
<br>

<div class="w3-quarter">
<div class="w3-card w3-white">
  <a href="https://mksports.co.kr/view/2023/334771" target="blank"><img src="../image/news5.jpg" alt="Snow" style="width:100%"></a>
  <div class="w3-container-news">
  <p id="news">“10일 검사 후 재활 일정 잡는다”…KGC 캡틴 이소영, 다음 시즌 출발 함께 할 수 있을까</p>
  </div>
  </div>
</div>

<div class="w3-quarter">
<div class="w3-card w3-white">
  <a href="http://www.newsworker.co.kr/news/articleView.html?idxno=201983" target="blank"><img src="../image/news4.jpg" alt="Snow" style="width:100%"></a>
  <div class="w3-container-news">
   <p id="news">여자배구 사상 첫 아시아쿼터...V리그에 히잡 쓴 선수 뜬다</p>
  </div>
  </div>
</div>

<div class="w3-quarter">
<div class="w3-card w3-white">
  <a href="https://sports.news.naver.com/news?oid=410&aid=0000935364" target="blank"><img src="../image/news3.jpg" alt="Snow" style="width:100%"></a>
  <div class="w3-container-news">
   <p id="news">신인 유일 올스타→女 최초 리베로 신인왕은 말했다…“더 열심히 준비하겠습니다”</p>
  </div>
  </div>
</div>

<div class="w3-quarter">
<div class="w3-card w3-white">
  <a href="https://news.sbs.co.kr/news/endPage.do?news_id=N1007158800&plink=ORI&cooper=NAVER" target="blank"><img src="../image/news1.jpg" alt="Snow" style="width:100%"></a>
  <div class="w3-container-news">
   <p id="news">여자배구 KGC인삼공사, FA 한송이 · 염혜선과 재계약</p>
  </div>
  </div>
</div>

</div>


<script>
	$('.w3-circle').on('click', function() {
		//swiper의 이미지를 클릭하면 선수단으로 이동
		location.href="player";
	});

	new Swiper('.swiper', {
		//자동 재생
		autoplay : {
			delay : 3000, //재생 시간
       disableOnInteraction: false,
		},
		loop : true, //반복
		slidesPerView : 3, //한 페이지에 보여줄 항목 개수 지정
		spaceBetween : 0, //슬라이드끼리의 간격
		centeredSlides : true, //슬라이드 가운데정렬
		pagination : { //하단 버튼
			el : '.swiper-pagination',
			clickable : true
		},
		navigation : { //이전, 다음 버튼
			prevEl : '.swiper-button-prev',
			nextEl : '.swiper-button-next'
		}
	})
</script>
</body>
</html>