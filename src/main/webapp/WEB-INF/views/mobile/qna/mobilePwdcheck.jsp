<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<div id=subpageContainer>
<div style="width:95%; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3.0em ">비밀번호 확인</b></div>
<br><br>
<div id="message3" style="font-size:1.4em;"> ${message}</div>
<br><br>
<form name="formm" method="post" action="mobileNmqnaView" >
	<input type="hidden" name="pwd" value="${pwd}">
	<input type="hidden" name="mvo" value="${mvo}">
	<input type="hidden" name="nqseq" value="${nqseq}">
	<fieldset style="align:center; height:5%">
		<input style="margin-left:20%; text-align:center; width:50%; height:60px; font-size:1.5em; border:3px solid green;" type="text" name="checkpwd">
	</fieldset>
	<div class="clear"></div>
	<div id="buttons" style="margin:center; margin-top:30px;" >
	    <input type="button" value="뒤로가기" class="cancel4" onClick="location.href='mobileNmqnaForm'" style="margin-left:3%; height:4%;">
	    <input type="submit" value="확인" class="submit4" style="height:4%;" > 
	 </div>
</form>

</div>


<%@ include file="../include/headerfooter/mobileFooter.jsp" %>