<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기록실</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<div id="contents">
<!-- location menu -->
<div class="page_location">
    <span class="active">기록실</span>
</div>

<p class="subtxt">경기 결과</p>
<form name="form" action="">
    <fieldset>
        <select name="sg" onchange="form.submit();" title="시즌선택" style="width:220px" class="selec">
                            <option value="019" >- 도드람 2022-2023 V-리그</option>
                            <option value="018" >- 도드람 2021-2022 V-리그</option>
                            <option value="017" >- 도드람 2020-2021 V-리그</option>
                            <option value="016" >- 도드람 2019-2020 V-리그</option>
                            <option value="015" >- 도드람 2018-2019 V-리그</option>
                            <option value="014" >- 도드람 2017-2018 V-리그</option>
                            <option value="013" >- NH농협 2016-2017 V-리그</option>
                            <option value="012" >- NH농협 2015-2016 V-리그</option>
                            <option value="011" selected='selected'>- NH농협 2014-2015 V-리그</option>
                            <option value="010" >- NH농협 2013-2014 V-리그</option>
                            <option value="009" >- NH농협 2012-2013 V-리그</option>
                            <option value="008" >- NH농협 2011-2012 V-리그</option>
                            <option value="007" >- NH농협 2010-2011 V-리그</option>
                            <option value="006" >- NH농협 2009-2010 V-리그</option>
                            <option value="005" >- NH농협 2008-2009 V-리그</option>
                            <option value="004" >- NH농협 2007-2008 V-리그</option>
                            <option value="003" >- HILLSTATE 2006-2007 V-리그</option>
                            <option value="002" >- KT&G 2005-2006 V-리그</option>
                            <option value="001" >- KT&G 2005 V-리그</option>
                    </select>
    </fieldset>
</form>

    <h4 class="h4Txt mt0">팀순위</h4>
    <div class="tbl1 record" >
        <table cellspacing="0" summary="순위, 팀명, 경기수, 승, 패, 승점, 정보가 있습니다.">
            <caption>팀순위표</caption>
            <colgroup>
                <col width="80px" /><col width="206px" /><col width="109px" /><col width="93px" /><col width="100px" />
                <col width="100px" /><col width="141px" /><col width="*" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">순위</th>
                <th scope="col">팀명</th>
                <th scope="col">경기수</th>
                <th scope="col">승</th>
                <th scope="col">패</th>
                <th scope="col">승점</th>
            </tr>
               </thead>
            <tbody>
                        <tr class="">
                <td>1</td>
                <td><p><img class=logoimg src="../../image/logo/logo_pink.png" alt="흥국생명" class="logo" />흥국생명</p></td> <!-- alt값은 팀명에 따라 변경됨 -->
                <td>36</td>
                <td>27</td>
                <td>9</td>
                <td>82</td>
           
                            <tr class="">
                <td>2</td>
                <td><p><img class=logoimg src="../../image/logo/logo_HD.png" alt="현대건설" class="logo" />현대건설</p></td> <!-- alt값은 팀명에 따라 변경됨 -->
                <td>36</td>
                <td>24</td>
                <td>12</td>
                <td>70</td>
         
                            <tr class="">
                <td>3</td>
                <td><p><img class=logoimg src="../../image/logo/logo_pass.png" alt="한국도로공사" class="logo" />한국도로공사</p></td> <!-- alt값은 팀명에 따라 변경됨 -->
                <td>36</td>
                <td>20</td>
                <td>16</td>
                <td>60</td>
  
                            <tr class="current">
                <td>4</td>
                <td><p><img class=logoimg src="../../image/logo/logo_kgc.png" alt="KGC인삼공사" class="logo" />KGC인삼공사</p></td> <!-- alt값은 팀명에 따라 변경됨 -->
                <td>36</td>
                <td>19</td>
                <td>17</td>
                <td>56</td>
         
                            <tr class="">
                <td>5</td>
                <td><p><img class=logoimg src="../../image/logo/logo_gs.png" alt="GS칼텍스" class="logo" />GS칼텍스</p></td> <!-- alt값은 팀명에 따라 변경됨 -->
                <td>36</td>
                <td>16</td>
                <td>20</td>
                <td>48</td>
             
                            <tr class="">
                <td>6</td>
                <td><p><img class=logoimg src="../../image/logo/logo_IBK.png" alt="IBK기업은행" class="logo" />IBK기업은행</p></td> <!-- alt값은 팀명에 따라 변경됨 -->
                <td>36</td>
                <td>15</td>
                <td>21</td>
                <td>48</td>
                
                            <tr class="">
                <td>7</td>
                <td><p><img class=logoimg  src="../../image/logo/logo_AI.png" alt="페퍼저축은행" class="logo" />페퍼저축은행</p></td> <!-- alt값은 팀명에 따라 변경됨 -->
                <td>36</td>
                <td>5</td>
                <td>31</td>
                <td>14</td>
             
                            </tbody>
        </table>
    </div>

</body>
</html>