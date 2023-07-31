<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트구매</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> 
     <script>
    function kakaopay(code){ 
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp52331688'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'KGC인삼04프로배구단',
            amount : ${point.pointCode},
            buyer_email : '${mem.memEmail}',
            buyer_name : '${mem.memName}',
            buyer_tel : '${mem.memPhone}',          
        }, function(rsp) {
            if ( rsp.success ) {
            	$.ajax({
            		url:'${path}/point/kakao',
            		style : 'POST',
            		dataType : 'json',
            		data : {
            			'code' : "${point.pointCode}",
            			'pointPrice' : "${point.pointPrice}", 
            			'memId' : "${mem.memId}",
            			'memPoint' : "${mem.memPoint}",
            			"name" : "${point.pointName}"
            			
            		}
            	});
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        alert(msg);
                        location.href="<%=request.getContextPath()%>/point/pointAccount";
                    } else {
                        msg = '결제에 실패하였습니다.';
                        msg += ' 내용 : ' + rsp.error_msg;
                        //실패시 이동할 페이지
                        location.href="<%=request.getContextPath()%>/point/pointBuy?code=${point.pointCode}";
                        alert(msg);
                    }
                });                
    	});
    };
    </script>
    
 <%-- 
      <script>
    function kakaopay(code){ 
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp52331688'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'KGC인삼04프로배구단',
            amount : ${point.pointCode},
            buyer_email : '${mem.memEmail}',
            buyer_name : '${mem.memName}',
            buyer_tel : '${mem.memPhone}',          
           // buyer_addr : '12',
            //buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
 
            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/point/pointAdd/", 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid,
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우                   
                    if ( everythings_fine ) {
               
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        alert(msg);
                        location.href="<%=request.getContextPath()%>/point/pointBuy?code=${point.pointCode}";
                        
                    } else {
                        msg = '결제에 실패하였습니다.';
                        msg += ' 내용 : ' + rsp.error_msg;
                        //실패시 이동할 페이지
                        location.href="<%=request.getContextPath()%>/point/pointBuy?code=${point.pointCode}";
                        alert(msg);
                    }
                });                
                location.href='<%=request.getContextPath()%>/point/pointAccount?Id=${mem.memId}';
                alert("결제가 완료되었습니다.");
            } else {
                msg = '결제에 실패하였습니다.';
                msg += ' 내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/point/pointBuy?code=${point.pointCode}";
                alert(msg);
            }
        });        
    });
    };
    </script> 
 
 --%>    
</head>
<body>
	<div id="container-1">
		<div class="w3-container w3-center">
			<h2 class="w3-center" style="padding: 40px;">포인트 구매</h2>
			<table class="w3-table-all" >
				<tr style="border: 0.1px solid white;">
					<td style="width: 50%; text-align: center; border: none;"><img
						src="../upload/point/${point.pointImg}"
						style="width: 300px; height: 300px;"></td>
					<td style="width: 50%;  padding-right: 30px;">
					
							<input type="hidden" name="email" value="${mem.memEmail}"> 
							<input type="hidden" name="name" value="${mem.memName}">
							<input type="hidden" name="tel" value="${mem.memPhone}">
							<input type="hidden" name="memPoint" value="${mem.memPoint}">
							<input type="hidden" name="pointPrice" value="${point.pointPrice}">		
							<input type="hidden" name="code" value="${point.pointCode}">
							<input type="hidden" name="name" value="${point.pointName}">
							<table class="w3-table-all" style="height: 300px;">
								<tr style="height: 25%">
									<td style="text-align: center">상품명</td>
									<td style="text-align: center">${point.pointName}</td>
								</tr>
								<tr style="height: 25%">
									<td style="text-align: center">가격</td>
									<td style="text-align: center">
										<fmt:formatNumber value="${point.pointPrice}" pattern="###,###" />원</td>
								</tr>							
								<tr style="height: 25%">
									<td colspan="2" style="text-align: center; background: #d3d3d3;">
									
									<button type="button" class="btn btn-dark w3-center" id="point"
										onclick="kakaopay(${point.pointCode})">포인트 구매</button>																				
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center"><input
										type="button" value="상품목록" class="btn btn-dark w3-center"
										onclick="location.href='pointList'">

									</td>
								</tr>
							</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>