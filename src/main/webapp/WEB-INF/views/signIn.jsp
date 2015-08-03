<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"></style>
</head>
<body>

<!-- 전체묶기 -->
<div style="width: 100%;  margin: 0 auto; padding-top: 15px;">
	<div align="center" style="margin: 0 auto;">
		
		<div>
			<div style="color:#8b4513; font:bold; font-size: 35pt; padding-bottom: 10px;"><font style="font-family: 나눔손글씨 붓;">회원가입</font></div>
		</div>
		
		
		<div>
			<div class="border" style="width:660px; border: solid 1px; border-color: #ffd2d7;"></div>
		</div>
		
<br/>
		
		<div align="center" style="width:650px; margin: 0 auto;">
			
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
				<div  style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;">회원아이디 </font><font color="red">*</font>
				</div>
				
				<div style="float: left; padding-left: 10px;">
					<input type="text" name="userId" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
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
					<input type="text" name="userPwd1" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
			    </div>
		   </div>
			
			<div style="border-top: 2px solid #EAEAEA; overflow: hidden;">
			
				<div style="vertical-align:middle; background-color:#ffd2d7; width: 200px; line-height:30px; float:left; height:30pt;">
					<font color="#8b4513" style="font-family: 나눔바른펜;"><b>비밀번호확인</b> </font><font color="red">*</font>
				</div>
				
				<div style="float: left;padding-left: 10px;">
					<input type="text" name="userPwd2" style="margin-top:8px; float:left" size="25" maxlength="20" class="boxTF" />
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
						<div style="float: left; padding-left: 3px;"><input type="button" style="margin-top:8px;" value="우편번호"/></div>
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
				    
				    	<div style="padding-left:5px; height: 20px; width: 450px;">
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
		
		<br/>
		
		<div>
			<div class="border" style="width:660px; border: solid 1px; border-color: #ffd2d7;"></div>
		</div>
	
	<br/>

		<div align="center" style="">
			<div  style="float:left; ">
				<button type="button" style="width: 50px; height: 40px; background-color:#ffd2d7; border: 1px solid #EAEAEA;" onclick="/home.action">가입</button>

			</div>
			<div  style="float:left;">
				<input type="button" style="width: 50px; height: 40px; background-color:#ffd2d7; border: 1px solid #EAEAEA;" onclick="/header.action">취소</input>
			</div>
		</div>
		
	</div>

</div>
<!-- 전체묶기 -->
</body>
</html>