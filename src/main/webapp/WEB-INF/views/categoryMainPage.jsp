<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://"></script>
<script type="text/javascript">
	$(document).ready(function(){
		alert();
		var current =0;
		var slide_length = $('.slide_ul>li').length;
		var btn_ul = '<ul class="slide_btn"></ul>';
		$('.slide_ul>li').hide();
		$('.slide_ul>li').first().show();
		
		$(btn_ul).prependTo($('slide'))
		for (var i=0; i<slide_length;i++){
			var child = '<li><a href=""#none'>'+i+'</a></li>';
			$(child).appendTo($('.slide_btn'));
		}
		
		$('.slide_btn > li > a').first().addClass('active');
		$('.slide_btn > li > a').on('click',slide_stop);
		
		//자동 슬라이드 함수
		function autoplay() {
			if(current == slide_length-1){
				current=0;
			}else{
				current++;
			}
			$('.slide_ul>li').stop().fadeOut(900);
			$('.slide_ul>li').eq(current).stop().fadeIn(700);
			$('.slide_btn > li > a').removeClass('active');
			$('.slide_btn > li > a').eq().addClass('active');
			
		}
		setInterval(autoplay,2000);
		
	})
</script>
<title>categoryMainPage</title>
</head>
<body>
<div style="display: block;">
	<div class="slidetabs" align="center" style="background-color: #B5B2FF; overflow: hidden; position: relative; height: 566px;">
		<ul class="slide_ul" style="width: auto; position: relative;">
			<li data-background-color="#D931C1" data-group="tab1" style="float: none; list-style: none; position: absolute; width: 1000px; z-index: 0; display: none;">
				<div>
				<a href="#">
					<img align="bottom" src="<%=cp%>/resources/Megan_Fox.jpg" style="width: 100px; height: 100px;"  alt="금일 추천 상품" />
				</a>
				</div>
			</li>
			<li data-background-color="#a941C2" data-group="tab1" style="float: none; list-style: none; position: absolute; width: 1000px; z-index: 0; display: none;">
				<div>
				<a href="#">
					<img align="bottom" src="<%=cp%>/resources/Megan_Fox.jpg" style="width: 100px; height: 100px;"  alt="금일 추천 상품" />
				</a>
				</div>
			</li>
			<li data-background-color="#b941C3" data-group="tab2" style="float: none; list-style: none; position: absolute; width: 1000px; z-index: 0; display: none;">
				<div>
				<a href="#">
					<img align="bottom" src="<%=cp%>/resources/Megan_Fox.jpg" style="width: 100px; height: 100px;"  alt="금일 추천 상품" />
				</a>
				</div>
			</li>
			<li data-background-color="#1941C4" data-group="tab3" style="float: none; list-style: none; position: absolute; width: 1000px; z-index: 0; display: none;">
				<div>
				<a href="#">
					<img align="bottom" src="<%=cp%>/resources/Megan_Fox.jpg" style="width: 100px; height: 100px;"  alt="금일 추천 상품" />
				</a>
				</div>
			</li>	
		</ul>
	</div>
</div>
</body>
</html>