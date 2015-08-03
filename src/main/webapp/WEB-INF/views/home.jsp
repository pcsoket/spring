<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<style type="text/css">
.main{
	width: 1000px;
	height: 100px;
	margin: 0 auto;
	
}
.left{
	 
	/* border: solid 1px; */ 
	width: 498px;

}

.right{

	 
	/* border: solid 1px;  */
	width: 497px;
	float: left;
	overflow: hidden;
}
</style>
	<title>Home</title>
</head>
<body>

<div class="main">
	<div>top</div>
	<div>
		<div class="left" style="float: right; overflow: hidden;">
			<div><a href="ideamain.action">idea</a></div>
		</div>
		<div class="right">
			<div><a href="shop.action">shop</a></div>		
		</div>
	</div>
</div>

</body>
</html>
