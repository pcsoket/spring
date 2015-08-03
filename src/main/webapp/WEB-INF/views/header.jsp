<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Case</title>
  <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<div> <!-- 전체 틀 --> 
	<div class="container">
		<div style="padding-top: 5px; float: left;">
			<ul class="nav nav-tabs">
			    <li class="active"><a href="/god/shop.action">Shop</a></li>
			    <li><a href="/god/invent.action">Invent</a></li>
			  
		  	</ul>
		</div>
		
		
		<div align="right" style="height: 46px; vertical-align: bottom;">
		
			<div><a href="/god/mypage.action" >My page</a> Logout</div>
			
			<!-- c:forEach로 로그인했을경우 logout으로 바꾸기 -->
		</div>
		
		
		
		<!-- shop일 경우 -->
			
	  <div class="jumbotron" align="center">
	    <h3>GodShop</h3>      
	    <p>톡톡 튀는 아이디어상품을 구매해 보세요.</p>      
	    <a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-search"></span> Search</a>
	  </div>
	
			
		<!-- 아이디어일 경우 -->
	  <div class="jumbotron" align="center">
	    <h3>Good Idea</h3>      
	    <p>당신의 아이디어가 현실이 됩니다.</p>      
	    <a href="#" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-search"></span> Search</a>
	  </div>
	  
	  
	
	  
	
	</div>

</div> <!-- 전체 틀 -->
</body>
</html>
