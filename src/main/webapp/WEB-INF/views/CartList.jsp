<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>장바구니</title>

<!-- 공통 시작 -->

	<link rel="Stylesheet" href="fancybox/jquery.fancybox-1.3.4.css"/>
<link rel="stylesheet" type="text/css" href="../MainMyPage.css">


<link rel="stylesheet" type="text/css" href="../CartList.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js" language="javascript"></script>
<script src="js/notice.js" language="javascript"></script>

<script type="text/javascript">

String.prototype.trim = function() {
	var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
	return this.replace(TRIM_PATTERN, "");
};

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/product/cart.do";
		f.submit();
	}

	function p(i, index,price) {
	//	alert(index);
		var obj = document.getElementsByName("count");
		var obj2 = document.getElementsByName("result");
		// alert( obj.length );
	
		
		if(i==-1 && obj[index].value == 1){ 
	      alert("더 이상 내릴 수 없습니다."); 
		          return false; 
		 } 
	//	alert(obj[index].value);
		obj[index].value=Number(obj[index].value) +i;
		obj2[index].value=Number(obj[index].value) * price;
		
	}
	var r=0;
	
	function chk(i) {
		var f = document.cartForm;
		
		
	//	alert(i);
	//	alert('${lists.size()}');
	
		if('${lists.size()}'==1){
			if(f.c1.checked){
				
				r+=Number(f.result.value);
				f.btnUp.disabled=true;
				f.btnDown.disabled=true;
			}else{
				r-=Number(f.result.value);
				f.btnUp.disabled=false;
				f.btnDown.disabled=false;
			}
			
		}else if(i==0){
			if(f.c1[0].checked){
				r+=Number(f.result[0].value);
				f.btnUp[0].disabled=true;
				f.btnDown[0].disabled=true;
			}else{
				r-=Number(f.result[0].value);
				
				
				f.btnUp[0].disabled=false;
				f.btnDown[0].disabled=false;
			}
		}else {
			
			if(f.c1[i].checked){
				r+=Number(f.result[i].value);
				f.btnUp[i].disabled=true;
				f.btnDown[i].disabled=true;
				
			}else{
				
				r-=Number(f.result[i].value);
				
				f.btnUp[i].disabled=false;
				f.btnDown[i].disabled=false;
			}
		}
		f.payPrice.value=r;
		f.payResult.value=r+2500;
	}	
	
	function cartOrder(val) {
		
		var f = document.cartForm;
		var str = "";
		
		if(val==1){
			if(f.c1.checked){
				str = f.cart_num.value;
				
			}
			
		}else{
			
			 for(var i=0; i<val; i++){
				if(f.c1[i].checked){
					
					 str += f.cart_num[i].value + "-";
				}
			}
		}
	//	alert(str);
		f.cartNum.value=str;
		
		
		f.action = "<%=cp%>/order/cartOrder.do";
		f.submit();
	}	
	
	
	function searchIdPwd(){
		location.href="<%=cp%>/join/searchIdPwd.do";
	}
	
	function login(){
		var f = document.loginForm;
		var id = f.id.value;
		var pwd = f.pwd.value;
        
        $.ajax({
        	url:'<%=cp%>/member/loginChk.jsp' ,
            type:'post',
            data: "id="+id+"&pwd="+pwd,
            
            success : function(data) {
            	if(data==0){
            		document.getElementById('loginChekMsg').style.color = "red";
            		loginChekMsg.innerHTML="아이디 또는 비밀번호를 정확히 입력하세요.";
            		id="";
            		pwd="";
            		
            	}
            	else{
            		f.action = "<%=cp%>/join/login_ok.do";
                    f.submit(); 
            	}
            }
        });
		
	}
	
	//검색부분 자바스크립트 
	function focusSearch() {
		var f = document.searchForm;
				
		f.searchValue.value="";
	}

	function blurSearch() {
		var f = document.searchForm;
		if(f.searchValue.value=="")
			f.searchValue.value="  ☞ 검색어를 입력하세요";
	}
	
	function searchOk() {
		
		var f = document.searchForm;
		 f.action = "<%=cp%>/pro/searchMain.do";
	     f.submit();
		
	}
	
	//toggle 함수 
	function loginToggle(){
		  $(".hidden_join").hide();
        $(".hidden_login").slideToggle("slow");

	}
	function joinToggle(){
		 $(".hidden_login").hide();
        $(".hidden_join").slideToggle("slow");

	}
	
	//회원가입 함수
	function join(val){
		
		var str = "<%=cp%>/join/join.do?r1="+val;
		location.href=str;


	}
	
	
	
</script>

<style type="text/css">
.hidden_login{margin:0 auto;width:750px;display: none;height:120px;}
.hidden_login_left{float:right;}
.hidden_join{margin:0 auto;width:750px;display: none;height:100px;}
.hidden_join_left{float:right;}
</style>
</head>
<body>

<!-- 헤더시작-->

<div id ="header">

	<!-- 메인헤더 시작 -->

	<div class="main_header" style="text-align:center; margin:0 auto;">
	
		<!-- 로고 시작 -->
		<div class="main_logo">
			<h1><a href="<%=cp%>/pro/main.do">
				<img src="../ex1/main_logo.jpg" alt="메인로고"/>
			</a></h1>
		</div>
		<!-- 로고 끝 -->
		
		<!-- 검색바  -->
		<form action="" name="searchForm">
		
			<div class="search" style="font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);">
				<input type="text" value="&nbsp;&nbsp;☞ 검색어를 입력하세요" name="searchValue" onfocus="focusSearch();" onblur="blurSearch();"
				style="width:447px; height:32px; border:1px solid; border-color:#aaa;
				font-size:13pt;  color:#666; background:#fff; float:left; overflow:hidden;
				font-family:nanumFont , sans-serif;
				src:url('font/nanum.eot');
				src: url('font/nanum.woff') format('woff'),
     		    url('font/nanum.ttf') format('truetype');text-shadow:none; 
				backgroud:url(ex1/main_bg);">
						
			</div>
			
			<div class="search button">
				<input type="button" value="검색" name="" onclick="searchOk();"
				style="width:48px; height:34px; border:1px solid; border-color:#aaa;
				font-size:11pt;color:#fff; background:#a30404; float:left; overflow:hidden;
				margin-left:6px;
				font-family:nanumFont , sans-serif;
			src:url('font/nanum.eot');
			src: url('font/nanum.woff') format('woff'),
         	url('font/nanum.ttf') format('truetype');text-shadow:none; 
			backgroud:url(ex1/main_bg);"/>
			</div>
		</form>
		<!-- 검색바 끝 -->
		
		<!-- 마이페이지 버튼 -->
		

<c:choose>
		
	<c:when test="${empty sessionScope.loginInfo.id }" >
		
		<div class="login">
			<input type="button" name="" value="회원가입" onclick="joinToggle();"
			style="width:100px; height:36px; background:#444; font-size:11pt; color:#fff;
			border:1px solid; border-color: #ccc; float:right; overflow:hidden;
			margin-left:5px;
			font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);" 
			/>
				
		</div>
		
		<div class="try">
			<input type="button" name="" value="로그인" class="lo" onclick="loginToggle();"
			style="width:100px; height:36px; background:#888; font-size:11pt; color:#fff;
			border:1px solid; border-color: #ccc; float:right; overflow:hidden;
			font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);"/>
		</div>

	</c:when>
	<c:otherwise>
			<c:choose>
				<c:when test="${sessionScope.loginInfo.chk == 1}" >
				
					
			<div style="width:187px; height:34px; background:#fff; color:#333;
			border: 1px solid #ccc;	
			font-size:13pt; text-align:center; float:right;
			src:url('font/nanum.eot');
			src: url('font/nanum.woff') format('woff'),
  	       url('font/nanum.ttf') format('truetype');text-shadow:none;
			">	
				
			
			<div style="float:left; padding-left:10px; width:34px; height:34px; overflow:hidden;">
			<div style="border-right:1px solid #ccc; width:32px; height:34px;  float:left; overflow:hidden;">
		
			<img style="  margin:5px 10px 0 0 ;
			float:left; overflow:hidden;
			width: 23px;
			height: 23px;
			background: #ccc;
			border-radius: 23px;				
			" src="${sessionScope.loginInfo.profileImg}">
		
			</div>
			</div>
			
			
			<input type="button" value="My Page" onclick="javascript:location.href='<%=cp %>/join/sMypage.do'"
		style="padding-top:2px;float:left; text-align:center;
		       border:1px solid #333;  width:140px; height:32px;
		       	border:0;
				background:#fff;
				color:#333; font-size:12pt; font-weight: bold;">

			</div>
			
		
				</c:when>
				<c:otherwise>
					
			<div style="width:187px; height:34px; background:#fff; color:#333;
			border: 1px solid #ccc;	
			font-size:13pt; text-align:center; float:right;
			src:url('font/nanum.eot');
			src: url('font/nanum.woff') format('woff'),
  	       url('font/nanum.ttf') format('truetype');text-shadow:none;
			">	
				
			
			<div style="float:left; padding-left:10px; width:34px; height:34px; overflow:hidden;">
			<div style="border-right:1px solid #ccc; width:32px; height:34px;  float:left; overflow:hidden;">
		
			<img style="  margin:5px 10px 0 0 ;
			float:left; overflow:hidden;
			width: 23px;
			height: 23px;
			background: #ccc;
			border-radius: 23px;				
			" src="${sessionScope.loginInfo.profileImg}">
		
			</div>
			</div>
			
			
			<input type="button" value="My Page"onclick="javascript:location.href='<%=cp %>/join/bMypage.do'"
		style="padding-top:2px;float:left; text-align:center;
		       border:1px solid #333;  width:140px; height:32px;
		       	border:0;
				background:#fff;
				color:#333; font-size:12pt; font-weight: bold;">

			</div>
			
			
				</c:otherwise>
			</c:choose>
		</c:otherwise>
</c:choose>
		
		<!-- 마이페이지 버튼 끝 -->
		
	</div>

	<!-- 메인헤더 끝 -->

</div>


<!-- 헤더 끝 -->

<!-- 로그인 Toggle 부분 -->
<div class="hidden_login">
<div class="hidden_login_left">
<form name="loginForm">

<div style="width:240px">

<p style="font-size:12pt;">아 이 디&nbsp;&nbsp;: 

<input type="text" name="id"
	style="background:#fff; color:#333; text-align:center; width: 150px; 
	height: 20px; margin:0 0 5px 8px; font-size:11pt; border:1px solid #ccc;
	font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);"> <br/>
</p>

</div>



비밀번호 :

 <input type="password" name="pwd"
 	style="background:#fff; color:#333; text-align:center; width: 150px;
 	height: 20px; margin:0 0 5px 9px; font-size:11pt; border:1px solid #ccc;
 	font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);"><br/>


<input type="button" value="확인" onclick="login();"
 	style="background:#a40404; color:#fff; text-align:center; width: 60px; margin-right:10px;
 	height: 30px;  font-size:11pt; border:1px solid #ccc;
 	float:right; oveflow:hidden;
 	font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);">


<input type="button" value="계정 찾기" onclick="searchIdPwd();"
 	style="background:#111; color:#fff; text-align:center; width: 88px;
 	height: 30px;  font-size:11pt; border:1px solid #ccc;
 	float:right; margin-right:4px; oveflow:hidden;
 	font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);">

</form>
<div style="padding-top: 30px;"><span id="loginChekMsg" style="font-size:9pt; text-align: right; width: 250px; height: 10px; display: block;"></span> </div>
</div>
</div>

<!-- 회원가입 Toggle 부분 -->

<div class="hidden_join">
<div class="hidden_join_left">
	<form name="joinForm">
	
	
	 <input type="button" name="pwd" value="판매자 회원가입" name="r1" onclick="join(1);"
	 	style="background:#111; color:#fff; text-align:center; width: 150px;
	 	height: 34px; width:205px; font-size:11pt; border:1px solid #ccc; margin-top:10px; margin-bottom:4px;
	 	font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);">
	 	<br/>
	
	 <input type="button" name="pwd" value="소비자 회원가입" name="r1" onclick="join(2);"
	 	style="background:#a40404; color:#fff; text-align:center; width: 150px;
	 	height: 34px; width:205px; font-size:11pt; border:1px solid #ccc;
	 	font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);"><br/>
	
	
	</form>
</div>
</div>

<!-- My page 공통 시작 -->


<div id ="content">

	<div class="container">
	
	<div class="null_place"></div>
	
		<div class="mypage_list">

		<div class="mypage_list_top">
		
			<!-- 이미지 불러야할 곳 -->
			
		<div style="width:530px; height:60px; padding:5px 0;
			font-size:23pt; 
			src:url('font/nanum.eot');
			src: url('font/nanum.woff') format('woff'),
  	       url('font/nanum.ttf') format('truetype');text-shadow:none;
			">		
			<div style="margin:0 auto; width:530px" >
				<p style="padding-top:2px; text-align:center;">
			<img style="
			margin:2px 5px 3px 3px;
			width: 50px;
			height: 50px;
			background: #ccc;
			border-radius: 50px;
				
			" src="${sessionScope.loginInfo.profileImg}">
		${sessionScope.loginInfo.name}님 안녕하세요 </p>
			</div>
			</div>
		
		</div>	
			
						
			<div class="blog_button">
			
				<input type="button" value="배송현황" onclick="javascript:location.href='<%=cp%>/order/orderList.do';"
				style="background:#fff; border:1px solid; border-color:#ccc;
				text-align:center; width:114px; height:36px; margin-left:5px;
				color:#333; font-size:13pt; float:left; padding-bottom:6px;
				font-family:nanumFont , sans-serif;
				src:url('font/nanum.eot');
				src: url('font/nanum.woff') format('woff'),
	   		    url('font/nanum.ttf') format('truetype');text-shadow:none; 
				backgroud:url(ex1/main_bg);">
					
				
				<input type="button" value="장바구니" onclick="javascript:location.href='<%=cp%>/cart/cartList.do';"
				style="background:#fff; border:1px solid; border-color:#ccc;
				text-align:center; width:114px; height:36px; margin-left:5px;
				color:#333; font-size:13pt; float:left; padding-bottom:6px;
				font-family:nanumFont , sans-serif;
				src:url('font/nanum.eot');
				src: url('font/nanum.woff') format('woff'),
	   		    url('font/nanum.ttf') format('truetype');text-shadow:none; 
				backgroud:url(ex1/main_bg);">
				
				<input type="button" value="프로필 수정" onclick="javascript:location.href='<%=cp%>/join/updated.do'"
				style="background:#fff; border:1px solid; border-color:#ccc;
				text-align:center; width:114px; height:36px; margin-left:5px;
				color:#333; font-size:13pt; float:left; padding-bottom:6px;
				font-family:nanumFont , sans-serif;
				src:url('font/nanum.eot');
				src: url('font/nanum.woff') format('woff'),
	   		    url('font/nanum.ttf') format('truetype');text-shadow:none; 
				backgroud:url(ex1/main_bg);">
				
				
				<input type="button" value="로그아웃" onclick="javascript:location.href='<%=cp%>/join/logout.do'"
				style="background:#fff; border:1px solid; border-color:#ccc;
				text-align:center; width:114px; height:36px; margin-left:5px;
				color:#333; font-size:13pt; float:left; padding-bottom:6px;
				font-family:nanumFont , sans-serif;
				src:url('font/nanum.eot');
				src: url('font/nanum.woff') format('woff'),
	   		    url('font/nanum.ttf') format('truetype');text-shadow:none; 
				backgroud:url(ex1/main_bg);">
			
			
			</div>
			
		</div>


<!-- 공통 끝 -->
<form name="cartForm">

<input type="hidden" name="cartNum">
<div id ="content">

	<div class="container">
	
		<div class="container1">
           
            <div id="blog1">
            <div class="title_num">번호</div>
            <div class="title_pronum">상품번호</div>
			<div class="title_proinfo">상품정보</div>
			<div class="title_count">수량</div>
            <div class="title_proprice">판매단가</div>
			<div class="title_payresult">합계</div>
			<div class="title_del">삭제</div>
			
         <c:forEach var="dto" items="${lists}" varStatus="status">
         
	<input type="hidden" name="cart_num" value="${dto.cart_num}">
            
            <div class="pro_num">
			<input type="checkbox" name="c1" value="${dto.cart_num}" onclick="chk('${status.index}');">
			</div>
            
            <div class="pro_pronum">${dto.product_num}</div>
			<div class="pro_proinfo">
			<img alt="" src="${dto.saveFileName}" width="60" height="60" border="0" style="float: left; padding-left: 15px;"/>
 			
 			<div 
 			style="display:table-cell;vertical-align:middle; width: 120px; height:26px; float: right; overflow: hidden; margin-right: 140px; margin-top: 18px; margin-bottom:16px;" >			
			상품명 :&nbsp;${dto.product_name}
			</div>
			</div>
			
			<div class="pro_count">
				<input type="text" id="count" name ="count" value="${dto.count}" style="height: 30px; width: 25px; border: 0px; font-size: 11pt;" >
				<div 
				style="display:table-cell;vertical-align:middle; width: 20px; float: right; overflow: hidden; margin-right: 4px; margin-top:1px; margin-bottom: 1px;"  >
			<%--     <img src="../ex1/플러스.PNG" name="btnUp" onclick="p(1,'${status.index}','${dto.price}');" style="width: 20px; height: 20px;" alt="플러스">
				<img src="../ex1/마이너스.PNG" name="btnDown" onclick="p(-1,'${status.index}','${dto.price}');" style="width: 20px; height: 20px;" alt="마이너스">
			 --%>	
			 
			 	<buttion name="btnDown" onclick="p(-1,'${status.index}','${dto.price}');" style="width: 20px; height: 20px;" alt="마이너스">
				<img src="../ex1/마이너스.PNG">
				</buttion>
			  
				</div>
			</div>
            <div class="pro_proprice">${dto.price}</div>
			<div class="pro_payresult">

	<input type="text" id="result" name ="result" readonly="readonly" value="${dto.count*dto.price}" style="width:40px; height: 30px;border: 0px; font-size: 11pt" >
			</div>
			<div class="pro_del">
			<a href="<%=cp%>/cart/delete.do?cart_num=${dto.cart_num}">
			<img src="../ex1/휴지통.PNG" style="width: 50px; height: 50px;" alt="삭제">
			</a>
			</div>
			
		</c:forEach>
		<c:if test="${lists.size()!=0}">
		<div style="float: left; padding-left: 500px;">
		총 상품금액 : 2500 (배송비) + 
		<input type="text" value=" " style="width:30px; border: 0px;" readonly="readonly" name = "payPrice"> 원 = 
		<input type="text" value=" " style="width:100px;  border: 0px;" readonly="readonly" name = "payResult">
		<input type="hidden" name="zz" value="z"><br>
		<div style="float: right;">
		<input type="button" value="쇼핑하기" class="jb-footer-1"
		onclick="javascript:location.href='<%=cp %>/pro/main.do';"/>
		<input type="button" class="jb-footer-1" value="주문하기"
		onclick="cartOrder('${lists.size()}');"/>
		
		</div>
		
		</div>
		</c:if>
		<c:if test="${lists.size()==0}">
			<div style="font-size:16pt; width: 898px;  height: 287px; padding-top: 250px; 
			background-color : #EAEAEA; margin-left: 1px; text-align: center; ">
			
			장바구니가 비었습니다.<br/>
			<div style="float: left; margin-left: 370px; margin-top:10px;">
		<input type="button" value="쇼핑하러 가기" 
		style=" width : 150px;  height : 60px;  float : left;
      margin:5px; border: 1px solid #bcbcbc;
      float :left;  overflow : hidden;  background:#a40404;
	  font-size:13pt;  color:#fff;   
	  font-family:nanumFont , sans-serif;
	src:url('font/nanum.eot');
	src: url('font/nanum.woff') format('woff'),
         url('font/nanum.ttf') format('truetype');text-shadow:none; 
	backgroud:url(ex1/main_bg);"
		onclick="javascript:location.href='<%=cp %>/pro/main.do';"/>
		</div>
			</div>
		
		</c:if>
		
		
			</div>
		</div>
	</div>
</div>
			

</form>

</div>
</div>

</body>
</html>









