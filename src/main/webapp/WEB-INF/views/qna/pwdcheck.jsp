<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>
<%@ include file="../include/user/customerCenter_sidemenu.jsp" %>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2>비밀번호 확인</h2>
<br><br>
<br><br>
<form name="formm" method="post" action="nmqnaView">
	<input type="hidden" name="pwd" value="${pwd}">
	<input type="hidden" name="nqseq" value="${nqseq}">
	<fieldset  style="margin:0; margin:0 auto; padd0ing:0;">
		<label style="font-size:1.4em;">비밀번호 확인</label>&nbsp;&nbsp;
		<input type="text" name="checkpwd" size="60" style="width:200; height:25px; margin-bottom:20px; border:3px solid green;"><br>
	</fieldset>
	<div class="clear"></div>
	<div id="buttons" style="float:right; margin-bottom:40px; margin-right:140px;" >
		<input type="button" value="확인" class="submit4" onClick="checknmPwd('${nqseq}')"> 
	    <input type="button" value="취소" class="cancel4" onClick="location.href='nmqnaForm'">
	 </div>
</form>
</article>
<div id="message3" style="font-size:1.4em;"> ${message}</div>

<%@ include file="../include/user/headerfooter/footer.jsp" %>