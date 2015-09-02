<%@ page contentType="text/html; charset=UTF-8"%>
<% 

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-image: url(/god/resources/image/main1.png); width:1920px;">

<!-- hold1 -->
<div style="width: 100%;">
	
	<!-- hold2 -->
	<div style="margin-top: 250px; margin-left: 24%;">
		
		<!-- hold3 -->
		<div style="float: left; overflow: hidden; margin-top: 85px;">
			<div style="color: white; font-size: 43pt; margin-bottom: 5px;">
				<b>당신</b>의
			</div>
			
			<div style="color: white; font-size: 43pt; margin-bottom: 5px;">
				<b>아이디어</b>를
			</div>
			
			<div style="color: white; font-size: 43pt;">
				<b>제품</b>으로!
			</div>
			
			<div>
				 <a href="<%=cp %>/category.action">
				 <button type="button" style="margin-top: 180px; width: 166px; height: 156px; margin-left: 30px;">
				 shop</button></a>
			</div>
		</div>
		
		<!-- hold3 -->
		
		<!-- hold4 -->
		<div style="margin-left:40px; float: left; overflow: hidden;">
			<img src="<%=cp%>/resources/image/main.png">
		</div>
		<!-- hold4 -->
		
		<!-- hold5 -->
		<div style="float: left; overflow: hidden; margin-top: 85px; margin-left: -200px;">
		
			<div style="color: white; font-size: 16pt; margin-bottom: 7px; margin-top: 20px;">
				<b>Make Your Idea!</b><br/>
				메이커스, 디자이너들은 다 모여라				
			</div>
			
			<div style="color: white; font-size: 16pt; margin-bottom: 7px;">
				<b>──</b>
			</div>
			
			<div style="color: white; font-size: 16pt;">
				<b>대한민국 NO.1 아이디어 개발 플랫폼</b><br/>
				당신의 아이디어를 멋진 제품으로 만들어드립니다.
			</div>
			
			<div>
				 <a href="<%=cp %>/ideaMain.action">
				 <button type="button" style="margin-top: 240px; width: 166px; height: 156px; margin-left: 30px;">
				 invent</button></a>	
			</div>
		
		</div>
		<!-- hold5 -->	
	
	</div>
	<!-- hold2 -->

</div>
<!-- hold1 -->

</body>
</html>