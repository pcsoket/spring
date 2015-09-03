<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int i=1;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 게시판</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	

	<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>
<script>
$(document).ready(function(){
    $(".q1").click(function(){
        $(".a1").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q2").click(function(){
        $(".a2").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q3").click(function(){
        $(".a3").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q4").click(function(){
        $(".a4").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q5").click(function(){
        $(".a5").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q6").click(function(){
        $(".a6").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q7").click(function(){
        $(".a7").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q8").click(function(){
        $(".a8").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q9").click(function(){
        $(".a9").toggle(1000);
    });
});

$(document).ready(function(){
    $(".q10").click(function(){
        $(".a10").toggle(1000);
    });
});
</script>

<style type="text/css">
.a1 {
	display: none;
}
.a2 {
	display: none;
}
.a3 {
	display: none;
}
.a4 {
	display: none;
}
.a5 {
	display: none;
}
.a6 {
	display: none;
}
.a7 {
	display: none;
}
.a8 {
	display: none;
}
.a9 {
	display: none;
}
.a10 {
	display: none;
}


</style>


</head>
<body>

<div  style="width: 1000px; margin-left: 24%;">

	<div style="margin-left: 20px;">
		<font style="font-size: 23px;"><b>자주하는</font>&nbsp;<font style="font-size: 26px;color: #61DBF0">Q&A</b></font>
	</div>

	<div>
		<img style="width: 620px;" src="/god/resources/image/sound.png">
	</div>

<br/>
			
					
			<br/>
			
			<div style="border-top: solid 1px; color: #bdbdbd">
				<div class="q1">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black; cursor: pointer;">로그인이 되지 않고 계속 로그인 페이지가 새로 고침 됩니다</b>
				</div>
				
				 <div class="a1">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
                    　저희 GoodIdea의 로그인이 되지 않는 경우는 브라우저 쿠키 설정 오류일 가능성이 높으며<br><br>
                 　　　　사용하시는 브라우저에 맞게 쿠키 설정을 확인해 주시길 부탁 드리겠습니다.<br><br><br><br>
                 　　　　Microsoft Internet Explorer를 사용하는 경우, 브라우저 쿠키 설정 및 캐시, 쿠키 삭제하는 방법은 <br/><br/><br/><br/>
                 　　　　다음과 같습니다.<br><br><br><br>
                 　　　　* Internet Explorer 10.0 <br><br><br><br>
                 　　　　1. Internet Explorer 상단의 "도구" 메뉴에서 하단의 "인터넷 옵션"을 클릭합니다.<br><br>
                 　　　　2. "인터넷 옵션" 상자는 "일반" 탭으로 열립니다.<br><br>
                 　　　　3. "일반" 탭의 "검색 기록" 항목에서 "삭제..." 버튼을 클릭합니다.<br><br>
                 　　　　4. "검색 기록 삭제" 창이 나타나면 "임시 인터넷 파일" 및 "쿠키"가 선택되어 있는지 확인하고,<br><br>
                 　　　　"삭제" 버튼을 클릭합니다.<br><br>
                 　　　　5. "일반" 탭의 "검색 기록" 항목에서 "설정" 버튼을 클릭하여 "웹 페이지를 열 때마다"를 선택하고<br><br>
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확인을 클릭합니다.<br><br>
                 　　　　6. "보안" 탭을 클릭하여 "신뢰할 수 있는 사이트"와 "제한된 사이트"를 클릭합니다. <br><br>
              　　　　   아래 부분의 "기본 수준" 버튼을 각각 클릭합니다.<br><br>
                 　　　　7.  "개인 정보" 탭을 클릭하여 설정부분을 "보통" 또는 "약간 높음"으로 선택합니다.<br><br>
               　　　	 &nbsp;&nbsp;"사이트" 버튼을 클릭하여 "사이트 관리"에 지정된 사이트가 있다면 모두 [제거] 해주세요.<br><br>
                 　　　　8. 설정을 마친 후에는 브라우저를 닫았다가 다시 시작합니다.<br><br> <br><br>
　　　　				 * Internet Explorer 9.0  <br><br><br><br>
                 　　　　1. Internet Explorer 상단의 "도구" 메뉴에서 하단의 "인터넷 옵션"을 클릭합니다.<br><br>
                 　　　　2. "인터넷 옵션" 상자는 "일반" 탭으로 열립니다.<br><br>
                 　　　　3. "일반" 탭의 "검색 기록" 항목에서 "삭제..." 버튼을 클릭합니다.<br><br>
                 　　　　4. "검색 기록 삭제" 창이 나타나면 "임시 인터넷 파일" 및 "쿠키"가 선택되어 있는지 확인하고,<br><br>
                 　　　　"삭제" 버튼을 클릭합니다.<br><br>
                 　　　　5. "일반" 탭의 "검색 기록" 항목에서 "설정" 버튼을 클릭하여 "웹 페이지를 열 때마다"를 선택하고<br><br> 
                 　　　　확인을 클릭합니다.<br><br>
                 　　　　6. "보안" 탭을 클릭하여 "신뢰할 수 있는 사이트"와 "제한된 사이트"를 클릭합니다. <br><br>
                 　　　　아래 부분의 "기본 수준" 버튼을 각각 클릭합니다.<br><br>
                 　　　　7.  "개인 정보" 탭을 클릭하여 설정부분을 "보통" 또는 "약간 높음"으로 선택합니다.<br><br>
                 　　　　&nbsp;"사이트" 버튼을 클릭하여 "사이트 관리"에 지정된 사이트가 있다면 모두 [제거] 해주세요.<br><br>
			     　　　　8. 설정을 마친 후에는 브라우저를 다시 시작합니다.<br><br><br><br><br><br>
                 　　　　Google의 크롬을 사용하시는 경우, 브라우저 쿠키 설정 및 캐시, 쿠키 삭제 방법은 다음과 같습니<br><br>
                 　　　　다.<br><br> <br><br>
                 　　　　* PC용 Google 크롬<br><br> <br><br>
                 　　　　1. 상단 주소창 오른쪽 아이콘(마우스 오버시 "크롬 맞춤설정 및 제어" 라고 표시 됩니다.)을 클릭합<br><br>
                 　　　　니다.<br><br>
                 　　　　2. 아래쪽의 "설정"을 선택합니다.<br><br>
                 　　　　3. 하단의 "고급설정표시" 를 클릭하면 추가 설정 내용이 펼쳐집니다. <br><br>
                 　　　　4. 개인정보 항목의 "콘텐츠 설정..." 버튼을 클릭하여 "로컬 데이터 설정허용(권장)"을 선택한 후,<br><br>
                 　　　　완료 클릭합니다.<br><br>
                 　　　　5. 동일하게 개인정보 항목의  "인터넷 사용정보 삭제..." 버튼을 클릭합니다.<br><br>
                 　　　　6. "캐시 삭제" 및 "쿠키 및 기타 사이트, 플러그인 데이터 삭제"를 선택합니다.<br><br>
                 　　　　7. "인터넷 사용정보 삭제"를 클릭합니다.<br><br>
                 　　　　8. 브라우저를 종료하고 다시 시작합니다.<br><br><br><br><br>
                 　　　　쿠키 설정 문제가 아니라면, 번거로우시더라도 아래의 사항을 차례로 확인해 주시기 바랍니다. <br><br><br><br>
                 　　　　1. SSL(보안접속)  설정 <br><br><br><br>
                 　　　　① 도구 → 인터넷 옵션 → 고급 탭 클릭<br><br>
                 　　　　② SSL 2.0 사용, SSL 3.0 사용에 모두 체크<br><br><br><br>
                 　　　　2. 신뢰할 수 있는 사이트 삭제<br><br><br><br>
                 　　　　① 도구 → 인터넷 옵션 → 보안 탭 클릭 <br><br>
                 　　　　② 보안 설정 화면에서 신뢰할 수 있는 사이트 클릭 -> 오른쪽의 사이트 버튼 클릭<br><br>
                 　　　　③ 웹사이트 목록에서 funshop.co.kr 이 들어간 모든 사이트 제거<br><br><br><br><br><br>
                 　　　　3.  제한된 사이트 삭제 <br><br><br><br>
                 　　　　① 도구 → 인터넷 옵션 → 보안 탭 클릭 <br><br>
                 　　　　② 보안 설정 화면에서 제한된 사이트 클릭 -> 오른쪽의 사이트 버튼 클릭<br><br>
                                   
                	</font>
                </div>

			</div>
			
			<div style="border-top: solid 1px; color: #bdbdbd;">
				<div class="q2">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black;cursor: pointer;">결제 수단별 취소 방법</b>
				</div>
				
				 <div class="a2">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
                    　1. 신용카드 , 실시간계좌이체<br>
                    　　　　- 주문상태가 "결제완료" 단계일 경우 고객님께서 직접 취소처리 가능합니다.<br>
                    　　　　- (마이플레이트 > 주문내역 및 배송조회 >  취소원하는 주문건 클릭 > 배송지 정보 아래 주문취소 클<br>
                    　　　　릭)<br>
                    　　　　- 각 결제수단 별로 환급되는 기간 다름<br><br>
                    　　　　2. 무통장 입금(가상계좌)<br>
                    　　　　- 주문건 상태가 "입금예정" 상태인 경우 입금하지 않고 24시간이 지나면 자동으로 취소 처리됩니다.<br>
                    　　　　- 주문건의 상태가 "결제완료"이더라도 직접취소 불가<br>
                    　　　　- 1:1상담 게시판 혹은 전화상담으로 요청<br><br>
                    　　　　3. 공통 : 주문건 상태가 "결제완료" 이외 상태의 주문건들은 <br>
                    　　　　단 한 건이라도 업체배송준비,GoodIdea발송준비 단계에서는 직접취소 불가하기 때문에 1:1<br>
                   　　　　상담 혹은 유선상 요청 바랍니다.<br>
                    </font>
                 </div>

			</div>
			
			<div style="border-top: solid 1px; color: #bdbdbd;">
				<div class="q3">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black;cursor: pointer;">장바구니에 담아둔 상품은 언제까지 주문가능하나요?</b>
				</div>
				
				 <div class="a3">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
                    　장바구니에 담으신 상품은 30일 후 자동 삭제 됩니다.<br><br>
                    　　　　다만 상품을 장바구니에 담아두어도 실질적인 주문이 아니므로 품절되어 주문이 불가능할 수 있습니
                    　　　　다.
                    </font>
                 </div>

			</div>
			
			<div style="border-top: solid 1px; color: #bdbdbd;">
				<div class="q4">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black;cursor: pointer;">GoodIdea 이용중에 로그인 상태가 풀립니다.</b>
				</div>
				
				 <div class="a4">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
                    　고객님께서 사용하시는 브라우저가 인터넷 익스플로러10 이라면 아래와 같은 경우 문제가 발생할 수
                    　　　　도 있습니다.<br><br>
                    　　　　인터넷 익스플로러10 은 기존 브라우저와는 다르게 한 사이트에 대하여 동시에 2개 이상의 창 혹은 
                    　　　　탭을 열어놓고 사용중하나의 창이나 탭을 종료하면 로그인 상태가 풀리는 현상이 있습니다.<br><br>
                    　　　　GoodIdea를 여러개의 창 혹은 탭을 이용하여 사용중이시라면 로그인 이후 창을 종료하지 마
                    　　　　시거나 혹 종료하신다면 모든 창을 닫고 다시 로그인하여 하나의 탭에서만 이용 부탁 드립니다.<br>
                    　　　　

                    </font>
                 </div>

			</div>
			
			<div style="border-top: solid 1px; color: #bdbdbd;">
				<div class="q5">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black;cursor: pointer;">묶음배송 가능한가요?</b>
				</div>
				
				 <div class="a5">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
						　각각의 주문건의 발송처가 펀샵 혹은 업체로 동일하고, 주문일이 같다 하더라도
						<br>　　　　2개 이상의 주문건을 묶음배송 해 드리기 어렵습니다.
						<br>　　　　
						<br>　　　　각각의 주문건이 발송 전인 경우, 주문을 취소하고 다시 재 구매 하시면
						<br>　　　　한 번에 물건을 받으실 수 있습니다. 
						<br>
						<br>　　　　배송 단계가 결제완료 단계인 경우에는 고객님께서 직접 [주문/배송조회] 에서
						<br>　　　　주문취소가 가능하시며, 그 외의 경우 [1:1 고객상담]에 문의 바랍니다.

                    </font>
                 </div>
			</div>
			
			<div style="border-top: solid 1px; color: #bdbdbd;">
				<div class="q6">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black;cursor: pointer;">제품을 구입하면 포인트가 쌓이나요?</b>
				</div>
				
				 <div class="a6">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
					　제품 구매에 따른 별도의 포인트 적립 제도는 없습니다.
                    </font>
                 </div>
			</div>
			
			<div style="border-top: solid 1px; color: #bdbdbd;">
				<div class="q7">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black;cursor: pointer;">기본 A/S 정책</b>
				</div>
				
				 <div class="a7">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
					　국내에서 안정적으로 A/S센터를 운영하고 있는 상품의 경우 해당상품의 A/S정책에 따르며, 
						<br>　　　　그 외 상품의 경우 초기불량을 제외하면 A/S가 어렵습니다. 
                    </font>
                 </div>
			</div>
			
			<div style="border-top: solid 1px; color: #bdbdbd;">
				<div class="q8">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black;cursor: pointer;">퀵 서비스는 왜 하지 않습니까?</b>
				</div>
				
				 <div class="a8">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
					　'퀵 서비스'를 하지 않는 이유에 관해 질문을 자주 주십니다.
					<br>
					<br>　　　　예전에는 저희가 수입하는 제품이 대부분이었다면, 
					<br>　　　　최근에는 타 업체에서 바로 발송하는 제품이 많아 지다 보니 이런 저런 문제가 생겨나고 있습니다. 
					<br>
					<br>　　　　시스템과 인원이 미비하다 보니, 유선상으로 한분 한분 '되는 부분, 안되는 부분' 설명을 드리기에는
					<br>　　　　정상적인 배송업무에 차질이와서 부득이 하지 않기로 하였습니다. 
					<br>
					<br>　　　　퀵으로 제품을 받으셨다가, 마음에 안드신다고 퀵으로 반송을 하시기도 하고, 
					<br>　　　　퀵 배송이 늦어지면, 저희 담당자들은 다른 분들의 배송 작업을 하지 못하고, 해당 퀵 서비스사와 많
					<br>　　　　은 시간을 할애해야 함으로... 
					<br>　　　　등등 말씀드리기 어려운 문제들이 있습니다.
					<br>
					<br>　　　　그러한 까닭으로 담당인원이나 시스템이 충실해지기까지는 부득이 서비스를 중단하기로 하였습니
					<br>　　　　다.
					<br>　　　　단골 고객분들께는 죄송하지만, 형평성 또한 고려하지 않을 수가 없어서, 예외를 두고 있지 않습니
					<br>　　　　다.
					<br>
					<br>　　　　당분간은 이점 헤아려 주시어 널리 양해 부탁드립니다.
					<br>   

                    </font>
                 </div>
			</div>
			
			<div style="border-top: solid 1px; color: #bdbdbd;">
				<div class="q9">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black;cursor: pointer;">GoodIdea 운영시간은 어떻게 되나요?</b>
				</div>
				
				 <div class="a9">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
					　운영시간 <br><br>
					　　　　온라인 :  평일 오전 10:00 ~ 오후 16:00 (토/일/공휴일 휴무)<br>
					　　　　점심시간은 오전 11:30~오후 13:00까지 입니다.<br><br>
					　　　　월요일~금요일 : 오전 11시 ~ 오후 9시<br>
					　　　　토요일 : 오전 11시 ~ 오후 8시<br>
					　　　　일요일 : 오전 11시 ~ 오후 6시<br><br>
					　　　　매장번호 : 1588-5959 <br>

                    </font>
                 </div>
			</div>
			
			
			<div style="border-top: solid 1px; border-bottom: solid 1px; color: #bdbdbd;">
				<div class="q10">
					<img src="/god/resources/image/q1.png">
					　<b style="color: black">지금까지 구입했던 상품을 확인할 수 있나요?</b>
				</div>
				
				 <div class="a10">
					<div style="border-bottom: solid 1px; color: #bdbdbd"></div>
					<img src="/god/resources/image/a1.png"><font style="color: black">
					　`마이페이지 > 주문내역 및 배송조회` 에서 확인 가능합니다.  


                    </font>
                 </div>
			</div>
		
		
		<br/><br/><br/><br/>

</div>

</body>
</html>