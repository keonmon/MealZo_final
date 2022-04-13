<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp" %> 
<%@ include file="../include/sidemenu/sidemenu.jsp" %>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
</head>
<script>
$(document).ready(function(){
    $("#goodbye").click(function(){
    	alert("회원탈퇴가 완료되었습니다");
    });
});
</script>
<article>
<form class="byeform" method="post">
<center><h2>그동안 이용해 주셔서 감사합니다</h2>
<input type="button" value="메인으로 이동" class="submit" id="goodbye"
onClick="location.href='/mobileMain'"/></center>
</form>
</article>
	

<%@ include file="../include/headerfooter/mobileFooter.jsp" %>