<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.0.min.js'></script>
<script type="text/javascript">

//이미지 preview 추가
 $.fn.setPreview = function(opt){
	"use strict"
	var defaultOpt = {
			inputFile: $(this),
			img: null,
			w: 200,
			h: 200
			};
	$.extend(defaultOpt, opt);
	var previewImage = function(){
		if (!defaultOpt.inputFile || !defaultOpt.img)
			return;
		var inputFile = defaultOpt.inputFile.get(0);
		var img       = defaultOpt.img.get(0);
		
		// FileReader
		if (window.FileReader) {
			// image 파일만
			if (!inputFile.files[0].type.match(/image\//))
				return;
			// preview
			try {
				var reader = new FileReader();
				reader.onload = function(e){
					img.src = e.target.result;
					img.style.width  = defaultOpt.w+'px';
					img.style.height = defaultOpt.h+'px';
					img.style.display = '';
					}
				reader.readAsDataURL(inputFile.files[0]);
				} catch (e) {
					// exception...
					}
				// img.filters (MSIE)
				} else if (img.filters) {
					inputFile.select();
					inputFile.blur();
					var imgSrc = document.selection.createRange().text;
					img.style.width  = defaultOpt.w+'px';
					img.style.height = defaultOpt.h+'px';
					img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
					img.style.display = '';
					// no support
					} else {
						// Safari5, ...
						}
		};
		// onchange
		$(this).change(function(){
			previewImage();
			});
		};
		$(document).ready(function(){
			var opt = {
					img: $('#img_preview'),
					w: 200,
					h: 200
					};
			$('#file1').setPreview(opt);
			
});

//selected 속성 부여
$(document).ready(function()
 
{
 
	$("#phn1 > option[value='${phn1}']").attr("selected",true);
 
});

function sendIt() {
	
	var f=document.update;
	f.action="<%=cp%>/mupdated.action";
	f.submit();
	
}

//주소 검색 팝업창 추가-> jsp도 같이 추가
function searchData() {
	
	var popOption = "width=500, height=500,resizable=no,scrollbars=no, status=no, top=300,left=700;";
	window.open("<%=cp %>/zipcode.action","popup",popOption);
	
}

function deleted() {
	
	f=document.update;
	
	if(!confirm("탈퇴 하시겠습니까?")){
		  return; 
		 }
	  f.action = "<%=cp%>/deleted.action";
	  f.submit();
		  
}


</script>
<title> 회 원 정 보 변 경 </title>

<style type="text/css">

*{ margin:0;}

div{
}

#wrapBody{
width: 100%;
}

#headWrap{
width: 100%;
height: 200px;
}
.topShortcut{
width: 100%;
height: 30px;
}
.headMain{
width: 100%;
height: 120px;
}
.headMenu{
width: 100%;
height: 70px;
}

#leftMenu{
width: 200px;
height: 800px;
float: left;
}

#bodyWrap{
width: 1000px;
margin: 0 auto;
}

#bodyContent{
width: 700px;
height: 700px;
float: left;
}

#footer{
width: 100%;
height: 200px;
float: left;
}

.footerNotice{
height: 150px;
width: 100%;
}

.notice1{
padding-left: 20px; 
}

.basicInfo_boxtitle{
float: left;
width: 700px;
border-top: 2px solid #EAEAEA;
background-color:#ffd2d7;
}

.basicInfo_title{
padding-left: 20px;
float: left;
overflow:hidden;
width: 300px;
}

.basicInfo_content{ 
text-align: left;
}

.basicInfo_contentWrap{
border-top: 2px solid #EAEAEA;
}

.purchaseInfo_contentWrap{
border-top: 2px solid #EAEAEA;
}

.purchaseInfo_boxtitle{
background-color:#ffd2d7;
width: 700px;
}

.purchaseInfo_title{
padding-left: 20px;
float: left;
width: 300px;
}

.purchaseInfo_content{
padding-left: 20px;
text-align: left;
}

.bodytitle{
border-top: 2px solid #EAEAEA;
}

#loginfoBox{
width: 400px;
float: right;
}

</style>

</head>
<body>
<div id = "wrapBody"><!-- 전체묶음 -->
<!-- 헤더시작 -->
	<div id="headWrap">
		<div class="topShortcut">
			<div id="loginfoBox">
			<c:choose>
			<c:when test="${empty logInfo}">
			<a href="<%=cp%>/login.action">Login</a>
			</c:when>
			<c:otherwise>
			<a href="<%=cp%>/logout.action">Logout</a>  <a href="">myPage</a>  
			</c:otherwise>
			</c:choose>
			</div>
		</div>
		
		<div class="headMain"></div>
		<div class="headMenu"></div>
	</div>
<!-- 헤더끝 -->	


	<div id="bodyWrap"><!-- leftMenu 와 bodyContent묶음 -->
<!-- 왼쪽메뉴시작 -->
		<div id="leftMenu">
		
			<dl class="leftFirst">
	   			<dt><strong>나의 쇼핑 내역</strong></dt>
				<dd><a href="<%=cp%>/myPage.action">회원정보수정</a></dd>
	            <dd><a onclick="deleted();">탈퇴</a></dd>
	        </dl>
	
			<dl class="leftSecond">
			

	            <dt><strong>나의 쇼핑 내역</strong></dt>
	            <dd><a href="">주문/배송조회</a></dd>
	            <dd><a href="">취소/반품/교환 신청</a></dd>
	            <dd><a href="">취소/반품/교환 현황</a></dd>
	            <dd><a href="">환불/입금내역</a></dd>
	            <dd><a href="">증빙서류 발급</a></dd>
	            
	   		</dl>
	   		
		</div>
<!-- 왼쪽메뉴끝 -->


<!-- 마이페이지내용 -->
		<div id="bodyContent">
		<form name="update" method="post" action="" enctype="multipart/form-data" >
			<div class="bodytitle">
			회원정보변경
			</div>
			<div class="notice1">
				<ul class="notice_list1">
					<li>${dto.userId}는 회원님의 개인정보를 신중히 취급하며, 회원님의 동의 없이는 기재하신 회원정보가 공개되지 않습니다.</li>
					<li>보다 다양한 서비스를 받으시려면 정확한 정보를 항상 유지해 주셔야합니다.</li>
					<li>타인의 개인정보를 도용한 피해방지 및 개인 셀러의 개인정보보호를 위해 범용 공인 인증서를 통한 본인확인 과정을 실시하고 있습니다.<br>범용 공인 인증서를 통한 본인 인증이 되어야 판매활동이 가능합니다.</li>
					<li>행정구역이 변경되어 사용할 수 없는 주소는 회원정보에서 삭제됩니다.</li>
				</ul>
			</div>
			
			<div id="basicInfo">
				<div class="basicInfo_boxtitle">
				${dto.userId}님의 기본정보
				</div>
			<div class="basicInfo_contentWrap">
 					<div class="basicInfo_title">프로필 사진</div> 
					<div style="width: 150px; height: 100px;" class="basicInfo_content"> 
					<img style=" width: 100px; height: 110px;" id="img_preview" src="${dto.userPimg}"/> 
 					<font style="color: black;"><input type="file" id="file1"  name="file2"/></font></div>
				</div> 
				<div class="basicInfo_contentWrap">
					<div class="basicInfo_title">아이디</div>
					<div class="basicInfo_content"><input type="text" name="userId" value="${dto.userId}" readonly="readonly"/></div>
				</div>
				<div class="basicInfo_contentWrap">
					<div class="basicInfo_title">이름</div>
					<div class="basicInfo_content"><input type="text" name="userName" value="${dto.userName}" readonly="readonly"/></div>
				</div>
				<div class="basicInfo_contentWrap">
					<div class="basicInfo_title">비밀번호</div><div class="basicInfo_content"><input name="userPwd" type="password" value="${dto.userPwd}"></div>
				</div>
				<!-- <div class="basicInfo_contentWrap">
					<div class="basicInfo_title">생년월일</div><div class="basicInfo_content">{dto.name}</div>
				</div> -->
				<%-- <div class="basicInfo_contentWrap">
					<div class="basicInfo_title">연락처</div><div class="basicInfo_content"><input name="userTel" type="text" value="${dto.userTel}"></div>
				</div> --%>
				<div class="basicInfo_contentWrap">
					<div class="basicInfo_title">이메일주소</div><div class="basicInfo_content"><input name="userEmail" type="text" value="${dto.userEmail}"></div>
				</div>
				<div class="basicInfo_contentWrap">
					<div class="basicInfo_title">자기소개</div><div class="basicInfo_content"><textarea name="userSelf" rows="10" cols="50">${dto.userSelf}</textarea></div>
				</div>
			</div>
				
			<div id="purchaseInfo">
				<div class="purchaseInfo_boxtitle">
				${dto.userId}님의 배송 정보
				</div>
				<div class="purchaseInfo_contentWrap" style="height: 100px;">
					<div class="purchaseInfo_title">주소</div>
					<div class="purchaseInfo_content">
					<div style="float: left; padding-left: 10px;">
							<input type="text" name="code1" id="code1" value="${code1}" style="margin-top:8px; float:left" size="10" maxlength="3" class="boxTF" />
					    </div>
					    
					    <div style="float: left; width: 10px; margin-top:8px;" > - </div>
					    
						<div style="float: left;"><input type="text" name="code2" id="code2" value="${code2}"  style="margin-top:8px; float:left;" size="10" maxlength="3" class="boxTF" /></div>
					<div style="float: left; padding-left: 3px;"><input type="button" style="margin-top:8px;" value="주소 검색 " onclick="searchData();"/></div>
				</div>
				<br/>
					<div class="purchaseInfo_content" style="float: right; margin-right: 100px;">
					<div>
					<input type="text" id="userAddr2" name="userAddr2" class="" readonly="readonly" style="width:265px;" value="${dto.userAddr2}"/>
					</div>
					<div>
					<input type="text" name="userAddr3" class=""  style="width:265px;" value="${dto.userAddr3}"/>
					</div>
					</div>
				</div>
				<div class="purchaseInfo_contentWrap">
					<div class="purchaseInfo_title">전화번호</div>
					<div class="purchaseInfo_content">
					<select id="phn1" name="phn1" title="국번선택" style="width:55px;">
					<option value="">선택</option>
						<option value='010'>010</option>
						<option value='011'>011</option>
						<option value='016'>016</option>
						<option value='017'>017</option>
						<option value='018'>018</option>
						<option value='019'>019</option>
						<option value='070'>070</option>
				</select>
					- <input name="phn2" type="text" value="${phn2}" maxlength="4" class="text" style="width:55px;">
					- <input name="phn3" type="text" value="${phn3}" maxlength="4" class="text" style="width:55px;">
				</div>
				</div>
				<div class="purchaseInfo_contentWrap">
					<div class="purchaseInfo_title">이메일수신여부</div>
					<div class="purchaseInfo_content">
						<div class="radio_wrap">
							<label for="emailY">
								<input type="radio" name="emailRcvYN" id="emailY" checked value="Y">
								수신동의
							</label>
							<label for="emailN">
								<input type="radio" name="emailRcvYN" id="emailN"  value="N">
								수신안함
							</label>
						</div>
					
					</div>
				</div>
				<div class="purchaseInfo_contentWrap">
					<div class="purchaseInfo_title">SMS수신여부</div>
					<div class="purchaseInfo_content">
						<div class="radio_wrap">
								<label for="SMSY">
									<input type="radio" name="SMSRcvYN" id="SMSY" checked value="Y">
									수신동의
								</label>
								<label for="SMSN">
									<input type="radio" name="SMSRcvYN" id="SMSN"  value="N">
									수신안함
								</label>
							</div>
						</div>
					</div>
				</div>
		</form>
		<div style="margin-top: 50px;">
		<div style="border-top: 2px solid #EAEAEA; "></div>
		</div>
		<div align="center" style="margin-top: 10px;">
		<input type="submit" value="수정완료" onclick="sendIt();"/>
		</div>	
		</div>
	</div><!-- bodyWrap끝 -->
<!-- 마이페이지끝 -->
	<div id="footer">
		<div align="center" class="footerNotice">
		
		</div>
		<div align="center" class="copyright">
			<p>Copyright SK planet. All rights reserved.</p>
		</div>
	</div>
</div><!-- 전체박스끝 -->
</body>
</html>