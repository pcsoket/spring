<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src ="http://code.jquery.com/jquery-latest.js"></script>
<!-- javaScript 추가 -->
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


function sendIt() {
	
	f = document.write;
	
	str = f.userId.value;
	str = str.trim();
	if(!str){
		alert("\n아이디을 입력하세요.");
		f.userId.focus();
		return;
	}
	f.userId.value = str;
	
	str = f.userName.value;
	str = str.trim();
	if(!str){
		alert("\n이름을 입력하세요.");
		f.userName.focus();
		return;
	}
	f.userName.value = str;
	
	str = f.userPwd.value;
	str = str.trim();
	if(!str){
		alert("\n비밀번호을 입력하세요.");
		f.userPwd.focus();
		return;
	}
	
	f.userPwd.value = str;
	
	str = f.userPwd.value;
	str = str.trim();
	
	alert(str.length);
	
	if(str.length<=5){
		alert("\n 비밀번호6자리이상 입력하세요.");
		f.userPwd.focus();
		return;
	}
	
	f.userPwd.value = str;
	
	str1 = f.userPwd1.value;
	str1 = str1.trim();
	if(str!=str1){
		alert("\n비밀번호가 일치하지 않습니다.");
		f.userpwd1.focus();
		return;
	}
	
	str = f.code1.value;
	str = str.trim();
	if(!str){
		alert("\n주소를 입력하세요.");
		f.code.focus();
		return;
	}
	f.code1.value = str;
	
	str = f.userAddr3.value;
	str = str.trim();
	if(!str){
		alert("\n상세주소를 입력하세요.");
		f.userAddr3.focus();
		return;
	}
	f.userAddr3.value = str;
	
	str = f.phn1.value;
	
	if(!str){
		alert("\n국번을 선택해주세요.");
		f.phn1.focus();
		return;
	}
	
	str=f.phn2.value;
	str=str.trim();
	if(!str){
		alert("\n전화번호를 입력해주세요.");
		f.phn2.focus();
		return;
	}
	f.phn2.value=str;
	
	str=f.phn3.value;
	str=str.trim();
	if(!str){
		alert("\n전화번호를 입력해주세요.");
		f.phn3.focus();
		return;
	}
	f.phn3.value=str;
	
	str = f.userEmail.value;
	str = str.trim();
	if(!str){
		alert("\nEmail을 입력하세요.");
		f.userEmail.focus();
		return;
	}
	f.userEmail.value = str;
	
	 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	  if (exptext.test(str)!=true){
	  alert('이메일 형식이 올바르지 않습니다.');
	  f.userEmail.focus();
	  return;
	  }
	  f.userEmail.value = str;
	  
	f.action = "<%=cp %>/write_ok.action";
	
	f.submit();
	
}
//주소 검색 팝업창 추가-> jsp도 같이 추가
function searchData() {
	
	var popOption = "width=500, height=500,resizable=no,scrollbars=no, status=no, top=300,left=700;";
	window.open("<%=cp %>/zipcode.action","popup",popOption);
	
}

function idchk() {
	
	var f = document.write;
	var popOption = "width=350, height=300,resizable=no,scrollbars=no, status=no, top=300,left=700;";
	window.open("<%=cp %>/idchk.action?userId="+f.userId.value,"popup",popOption);
	
	
}

</script>
<title> 회 원 가 입 </title>
<style type="text/css"></style>
</head>
<body>
<!-- 모든 회원 DTO userXXX 통일 formname : myform->write, formmethod "post 추가" -->
<!-- 전체묶기 -->
<div style="width: 100%;  margin: 0 auto; padding-top: 15px;">
	<!-- 추가 -->
	<div style="width: 1024px; margin: 0 auto;" align="center">
	<form name="write" method="post" enctype="multipart/form-data">
	<div align="center" style="margin: 0 auto;">
		
		<div>
			<div style="color:#8b4513; font:bold; font-size: 35pt; padding-bottom: 10px;"><font style="font-family: 나눔손글씨 붓;">회원가입</font></div>
		</div>
		
		
		<div>
			<div class="border" style="width:660px; border: solid 1px; border-color: #ffd2d7;"></div>
			<!-- 추가 -->
			<div style="text-align: left; margin-left: 20%;"><font size="2pt" style="font-family: 나눔손글씨 붓; color: red;"><b>*  필수입력사항</b></font></div>
		</div>	
		<br/>	
		<div align="center" style="width:650px; margin: 0 auto;">
			<!-- 이미지 등록 추가 -->
	 <div style="border-top: 2px solid #EAEAEA; overflow: hidden; height:220px;">
			
				<div  style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height: 220px;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>프로필 사진</b></font><font color="red">*</font>
				</div>
				<div style="float: left;">
					<div align="center"><img id="img_preview" style=" display:none;"/></div>
					<input type="file" id="file1" name="file2" style="float: left; overflow: hidden;"/>
				</div>
		   </div> 
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
				<div  style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>회원아이디</b></font><font color="red">*</font>
				</div>
				
				<div style="float: left; padding-left: 10px;">
					<input type="text" id="userId" name="userId"  style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF"/>
					<div style="float: left; padding-left: 3px;"><input style="margin-top: 8px;" type="button" value="중복아이디" onclick="idchk();"/></div>
			    </div>
		   </div>
			
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
				<div style="background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>이름</b></font><font color="red">*</font>
				</div>
				
				<div style="float: left; padding-left: 10px;">
					<input type="text" name="userName" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
			    </div>
		   </div>
			
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
				<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>비밀번호</b> </font><font color="red">*</font>
				</div>
				
				<div style="float: left;padding-left: 10px;">
					<input type="password" name="userPwd" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
					<div align="left" style="float: left; margin-top: 9px;">
					<font size="2pt" style="font-family: 나눔바른펜;">&nbsp;&nbsp;비밀번호는 6~16자 입력 바랍니다.</font>
					</div>	
			    </div>
		   </div>
			
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
				<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>비밀번호확인</b> </font><font color="red">*</font>
				</div>
				<div style="float: left;padding-left: 10px;">
					<input type="password" name="userPwd1" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
			    </div>
		   </div>
		   
		   <div style="border-top: 2px solid #EAEAEA; overflow: hidden; width: 650px;">
			
				<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:120px; float:left; height:150pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>자택주소</b></font><font color="red">*</font>
				</div>
				<input type="hidden" value="zip"/>
					<div style="height: 30px;">
						<div style="float: left; padding-left: 10px;">
							<input type="text" name="code1" id="code1" style="margin-top:8px; float:left" size="10" maxlength="3" class="boxTF" />
					    </div>
					    
					    <div style="float: left; width: 10px; margin-top:8px;" > - </div>
					    
						<div style="float: left;"><input type="text" name="code2" id="code2"  style="margin-top:8px; float:left;" size="10" maxlength="3" class="boxTF" /></div>
						<div style="float: left; padding-left: 3px;"><input type="button" style="margin-top:8px;" value="주소 검색 " onclick="searchData();"/></div>
				    </div>
				    <div style="float: left; height: 30px; width: 450px;">
					    <div style="padding-left: 5px; float:left; overflow: hidden;">
							<input type="text" name="userAddr2" id="userAddr1" style="margin-top:8px;" size="40" maxlength="40" class="boxTF" />
					    </div>
		
				    </div>
				    
				    <div style="float: left; height: 30px; width: 450px;">
				    	<div style=" padding-left: 5px; float: left; " >
							<input type="text" name="userAddr3" style="margin-top:8px;" size="40" maxlength="40" class="boxTF" />
					    </div>
				    </div>
			
				    <div align="left" style="height: 70px; float: left; width: 450px; font-size: 9pt;">
					   
					    	&nbsp;&nbsp;· 사은품 및 우편물이 배송될 주소입니다.<br/>
							&nbsp;&nbsp;· 정확한 주소를 표기해 주시기 바랍니다.<br/>
							&nbsp;&nbsp;·&nbsp;주소변경은 마이페이지에서 가능합니다.<br/>		
				    </div>
				    
				    <!-- style 변경 -->
				    	<!-- <div style="padding-left:5px; margin-top:10px; padding-top: 80px; height: 50px; width: 450px;">
				    		<div style="font-size: 9pt; float: left;">&nbsp;우편물 수령지</div>
				    		<div style="font-size: 9pt; float: left;"><input type="radio" name="radio" value="자택" checked="checked" />자택</div>
				    		<div style="font-size: 9pt; float: left;"><input type="radio" name="radio" value="직장"/>직장</div>
				    	</div> -->
				    
				</div>
				
				<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
					<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
						<font color="#8b4513" style="font-family: 나눔바른펜;">연락처 </font><font color="red">*</font>
					</div>
					
					<div style="float: left;padding-left: 10px;">
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
					- <input name="phn2" type="text"  maxlength="4" class="text" style="width:55px;">
					- <input name="phn3" type="text"  maxlength="4" class="text" style="width:55px;">
				    </div>
		   		</div>
		   		
		   		<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
					<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
						<font color="#8b4513" style="font-family: 나눔바른펜;">이메일주소 </font><font color="red">*</font>
					</div>
					<div style="float: left;padding-left: 10px;">
					<!-- 한글 입력 방지 코딩 추가 -->
						<input type="text" id="userEmail" name="userEmail" style=" margin-top:8px; float:left;" size="25" maxlength="20" class="boxTF" onkeyup ="this.value=this.value.replace(/[^a-zA-Z0-9@.]/g,'')"/>
				    </div>
		   		</div>
		   		<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
					<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:50px; float:left; height:160px;">
						<font color="#8b4513" style="font-family: 나눔바른펜;">자기소개</font>
					</div>
					
					<div align="center" style="float: left;padding-left: 10px;">
						<textarea name="userSelf" rows="10" cols="50"></textarea>
				    </div>
		   		</div>
		   		<div style="border-top: 2px solid #EAEAEA; overflow: hidden;"></div>
			</div>
		<br/>
		<div>
			<div class="border" style="width:660px; border: solid 1px; border-color: #ffd2d7;"></div>
		</div>
	<br/>
		<!-- 버튼 위치 변경 -->
		<div align="center" style="margin: 0 auto;">
			<div  style="margin: 0 auto;">
				<button type="button" style="width: 50px; height: 40px; background-color:#ffd2d7; border: 1px solid;" onclick="sendIt();">가입</button>
				<button type="button" style="width: 50px; height: 40px; background-color:#ffd2d7; border: 1px solid;" onclick="/shop.action">취소</button>
			</div>
		</div>
	</div>
		</form>
	</div>
</div>
<!-- 전체묶기 -->

</body>
</html>