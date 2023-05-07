<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기일정</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>

	<!-- //left 인클루드 끝 -->
	<!-- contetns 영역 -->
	<div id="contents">
		<!-- location menu -->
		<div class="page_location">
			<span><img src="/images/common/ico_home.gif" alt="Home" /></span> <span>GAME</span>
			<span class="active">경기일정 및 결과</span>
		</div>

		<h3 class="h3Txt">경기일정 및 결과</h3>
		<p class="subtxt">KGC인삼공사 프로배구단의 시즌일정 및 경기결과 안내입니다.</p>

		<div class="month_ctrl">
			<a href="?currDate=2023-02-01" class="cal_prev">이전월</a>
			<p class="date">2023. 03.</p>
			<a href="?currDate=2023-04-01" class="cal_next">다음월</a>

			<form name="go" action="?">
				<div class="sel_area">
					<select name="yy" onchange="form.submit();" title="연도선택"
						class="selec" style="width: 120px">
						<option value="2005">2005</option>
						<option value="2006">2006</option>
						<option value="2007">2007</option>
						<option value="2008">2008</option>
						<option value="2009">2009</option>
						<option value="2010">2010</option>
						<option value="2011">2011</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
						<option value="2023" selected='selected'>2023</option>
						<option value="2024">2024</option>
					</select> <select name="mm" onchange="form.submit();" title="월선택"
						class="selec" style="width: 90px">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03" selected='selected'>3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
			</form>
		</div>

		<script type="text/javascript" src="/common/js/jBox.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				// Tooltip above and centered, this is the default setting
				$('.DemoTooltipAbove').jBox('Tooltip', {
					offset : {
						x : 52,
						y : -5
					},
					pointer : 'left:0'
				});
			});
		</script>

		<!-- 달력 -->
		<div class="cal_tbl">
			<table cellspacing="0"
				summary="sunday, monday, tuesday, wednesday, thursday, friday, saturday"
				style="table-layout: fixed; word-break: breadk-all;">
				<caption>경기일정 및 결과</caption>
				<colgroup>
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="d_sun">SUN</th>
						<th scope="col">MON</th>
						<th scope="col">TUE</th>
						<th scope="col">WED</th>
						<th scope="col">THU</th>
						<th scope="col">FRI</th>
						<th scope="col">SAT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><div class='day'>
								<span class='sun'></span>
							</div></td>
						<td><div class='day'>
								<span></span>
							</div></td>
						<td><div class='day'>
								<span></span>
							</div></td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">1</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">2</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">3</div>
							</div>
						</td>
						<!-- <td class="home "> -->
						<!-- 홈경이일경우 home 추가 -->
						<td class="home">
							<!-- 홈경이일경우 home 추가 -->
							<div class="cal_wrap">
								<div class="day">4</div>
								<div class="info_area">
									<img src="/images/volleyball/logo_2005.png" alt="GS칼텍스"
										class="logo" />
									<!-- alt값 변경은 팀명으로 변동되는 값임 -->
									<a href="game_result.php?gd=2023-03-04" class="lose"><strong>[패]</strong>
										0 : 3 <img src="/images/common/ico_review.png" alt="경기리뷰"
										class="icon" /></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="">
							<div class="cal_wrap">
								<div class="day d_sun">5</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">6</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">7</div>
							</div>
						</td>

						<!-- <td class="home "> -->
						<!-- 홈경이일경우 home 추가 -->
						<td class="home">
							<!-- 홈경이일경우 home 추가 -->
							<div class="cal_wrap">
								<div class="day">8</div>
								<div class="info_area">
									<img src="/images/volleyball/logo_2006.png" alt="IBK기업은행"
										class="logo" />
									<!-- alt값 변경은 팀명으로 변동되는 값임 -->
									<a href="game_result.php?gd=2023-03-08" class="win"><strong>[승]</strong>
										3 : 2 <img src="/images/common/ico_review.png" alt="경기리뷰"
										class="icon" /></a>
								</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">9</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">10</div>
							</div>
						</td>

						<!-- <td class="away "> -->
						<!-- 홈경이일경우 home 추가 -->
						<td class="away">
							<!-- 홈경이일경우 home 추가 -->
							<div class="cal_wrap">
								<div class="day">11</div>
								<div class="info_area">
									<img src="/images/volleyball/logo_2004.png" alt="흥국생명"
										class="logo" />
									<!-- alt값 변경은 팀명으로 변동되는 값임 -->
									<a href="game_result.php?gd=2023-03-11" class="lose"><strong>[패]</strong>
										3 : 0 <img src="/images/common/ico_review.png" alt="경기리뷰"
										class="icon" /></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="">
							<div class="cal_wrap">
								<div class="day d_sun">12</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">13</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">14</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">15</div>
							</div>
						</td>

						<!-- <td class="away "> -->
						<!-- 홈경이일경우 home 추가 -->
						<td class="away">
							<!-- 홈경이일경우 home 추가 -->
							<div class="cal_wrap">
								<div class="day">16</div>
								<div class="info_area">
									<img src="/images/volleyball/logo_2001.png" alt="현대건설"
										class="logo" />
									<!-- alt값 변경은 팀명으로 변동되는 값임 -->
									<a href="game_result.php?gd=2023-03-16" class="win"><strong>[승]</strong>
										1 : 3 <img src="/images/common/ico_review.png" alt="경기리뷰"
										class="icon" /></a>
								</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">17</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">18</div>
							</div>
						</td>

					</tr>
					<tr>
						<td class="">
							<div class="cal_wrap">
								<div class="day d_sun">19</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">20</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">21</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">22</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">23</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">24</div>
							</div>
						</td>

						<td class="">
							<div class="cal_wrap">
								<div class="day">25</div>
							</div>
						</td>

					</tr>
					<tr>
						<td class="">
							<div class="cal_wrap">
								<div class="day d_sun">26</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">27</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">28</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">29</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">30</div>
							</div>
						</td>
						<td class="">
							<div class="cal_wrap">
								<div class="day">31</div>
							</div>
						</td>
						<td><div class='cal_wrap'>
								<div class='day m_next'></div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 달력 표시 설명 -->
		<div class="cal_desc">
			<span><img src="/images/common/ico_home_color.gif" alt="홈경기컬러" />
				: 홈경기</span> <span><img src="/images/common/ico_away_color.gif"
				alt="원정컬러" /> : 원정경기</span> <span><img
				src="/images/common/ico_air.png" alt="경기중계" /> : 경기중계</span> <span><img
				src="/images/common/ico_review.png" alt="경기리뷰" /> : 경기리뷰</span>
			<ul>
				<li>지난 경기 점수 클릭 시 해당 경기의 상세기록을 확인하실 수 있습니다.</li>
				<li>TV 아이콘에 마우스 오버 시 중계방송사를 확인 하 실 수 있습니다.</li>
			</ul>
			<!-- <a href="/images/volleyball/2019-2020sch.xlsx" class="shed_download">2019-2020 전체일정 다운로드</a> -->
			<!-- <a href="/images/volleyball/2020-2021sch.zip" class="shed_download">2020-2021 전체일정 다운로드</a> -->
		</div>

	</div>
	<!-- //contetns 영역 -->

</body>
</html>