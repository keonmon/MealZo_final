<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title> 
</head> 
<body> 

<!-- 모바일 메인으로 갈지 & 웹 메인으로 갈지 여기서 판단 --> 
<script type="text/javascript"> 
	if( (navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i)) 
			|| (navigator.userAgent.match(/iPad/i)) || (navigator.userAgent.match(/Windows CE/i)) 
			|| (navigator.userAgent.match(/Symbian/i)) || (navigator.userAgent.match(/BlackBerry/i)) 
			|| (navigator.userAgent.match(/Android/i)) ){ 
		window.location.href='mobileMain'; 
	}else{ 
		window.location.href='webMain'; 
	} 
</script> 
		
</body> 
</html>
