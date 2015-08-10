<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">

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
		

function upload() {
	
	var f = document.imgupload;

	 str = f.file2.value;
	 if(!str){
		 
		 alert("\n이미지를 선택 해주세요!!");
		 return;
	 }
	 window.opener.location.href='/god/upload_ok.action';
	 
	 f.submit();
	window.close();
	
	
}

</script>
<title> 프 로 필 사 진 등 록 </title>
</head>
<body>
<form name="imgupload" action="" method="post" enctype="multipart/form-data">
	<div align="center"><img id="img_preview" style="display:none;"/></div>
	<div>
	<input type="file" id="file1" name="file2" style="float: left; overflow: hidden;"/>
	<input type="button" value="등록하기" onclick="upload();" style="float: right; overflow: hidden;"/>
	</div>
	</form>	
</body>
</html>