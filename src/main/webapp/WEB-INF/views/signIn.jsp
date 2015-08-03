<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src ="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function sendIt() {
	
	f = document.myForm;
	
	str = f.userId.value;
	str = str.trim();
	if(!str){
		alert("\n제목을 입력하세요.");
		f.userId.focus();
		return;
	}
	f.userId.value = str;
	
	str = f.userName.value;
	str = str.trim();
	if(!str){
		alert("\n제목을 입력하세요.");
		f.userName.focus();
		return;
	}
	f.userName.value = str;
	
	str = f.userPwd1.value;
	str = str.trim();
	if(!str){
		alert("\n제목을 입력하세요.");
		f.userPwd1.focus();
		return;
	}
	f.userPwd1.value = str;
	
	str1 = f.userPwd2.value;
	str = str.trim();
	if(!str){
		alert("\n제목을 입력하세요.");
		f.userpwd2.focus();
		return;
	}
	f.userId.value = str;
	
	f.submit();
	
}
</script>
<title> 회 원 가 입 </title>
<style type="text/css"></style>
</head>
<body>

<!-- 전체묶기 -->
<div style="width: 100%;  margin: 0 auto; padding-top: 15px;">
	<!-- 추가 -->
	<div style="width: 1024px; margin: 0 auto;" align="center">
	
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
		<form >
		<div align="center" style="width:650px; margin: 0 auto;">
			
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
				<div  style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>회원아이디</b></font><font color="red">*</font>
				</div>
				
				<div style="float: left; padding-left: 10px;">
					<input type="text" name="userId" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" onkeyup="chkid"/>
					${message}
			    </div>
		   </div>
			
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
				<div style="background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;">이름 </font>
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
					<input type="password" name="userPwd1" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
					<div align="left" style="float: left; margin-top: 9px;">
					<font size="2pt" style="font-family: 나눔바른펜;">비밀번호는 6~16자 입력 바랍니다.</font>
					</div>	
			    </div>
		   </div>
			
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
				<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>비밀번호확인</b> </font><font color="red">*</font>
				</div>
				
				<div style="float: left;padding-left: 10px;">
					<input type="password" name="userPwd2" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
			    </div>
		   </div>
		   
		   <div style="border-top: 2px solid #EAEAEA; overflow: hidden; width: 650px;">
			
				<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:120px; float:left; height:110pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>자택주소</b> </font>
				</div>
				
					<div style="height: 30px;">
						<div style="float: left; padding-left: 10px;">
							<input type="text" name="code1" style="margin-top:8px; float:left" size="10" maxlength="3" class="boxTF" />
					    </div>
					    
					    <div style="float: left; width: 10px; margin-top:8px;" > - </div>
					    
						<div style="float: left;"><input type="text" name="code2" style="margin-top:8px; float:left;" size="10" maxlength="3" class="boxTF" /></div>
						<div style="float: left; padding-left: 3px;"><input type="button" style="margin-top:8px;" value="주소 검색 " onclick=""/></div>
				    </div>
				    <div style="float: left; height: 30px; width: 450px;">
					    <div style="padding-left: 5px; float:left;">
							<input type="text" name="addr1" style="margin-top:8px;" size="20" maxlength="20" class="boxTF" />
					    </div>
					    <div style=" padding-left: 5px; float: left;" >
							<input type="text" name="addr2" style="margin-top:8px;" size="20" maxlength="20" class="boxTF" />
					    </div>
				    </div>
				    
				    <div align="left" style="height: 50px; float: left; width: 450px; font-size: 9pt;">
					    <br/>
					    	&nbsp;&nbsp;· 사은품 및 우편물이 배송될 주소입니다.<br/>
							&nbsp;&nbsp;· 정확한 주소를 표기해 주시기 바랍니다.<br/>
							&nbsp;&nbsp;·&nbsp;주소변경은 마이페이지에서 가능합니다.<br/>		
				    </div>
				    <br/>
				    <!-- style 변경 -->
				    	<div style="padding-left:5px; padding-top: 80px; height: 20px; width: 450px;">
				    		<div style="font-size: 9pt; float: left;">&nbsp;우편물 수령지</div>
				    		<div style="font-size: 9pt; float: left;"><input type="radio" name="radio" value="자택" />자택</div>
				    		<div style="font-size: 9pt; float: left;"><input type="radio" name="radio" value="직장"/>직장</div>
				    	</div>
				    
				   
				</div>
				
			
			
				<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
					<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
						<font color="#8b4513" style="font-family: 나눔바른펜;">연락처 </font><font color="red">*</font>
					</div>
					
					<div style="float: left;padding-left: 10px;">
						<input type="text" name="userPwd2" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
				    </div>
		   		</div>
		   		
		   		<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
					<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
						<font color="#8b4513" style="font-family: 나눔바른펜;">이메일주소 </font><font color="red">*</font>
					</div>
					
					<div style="float: left;padding-left: 10px;">
						<input type="text" name="userPwd2" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
				    </div>
		   		</div>
		   		
		   		<div style="border-top: 2px solid #EAEAEA; overflow: hidden;"></div>
				
		
		
		</div>
		</form>
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
	</div>
</div>
<!-- 전체묶기 -->

</body>
</html>