<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>

<article id="zzim2" style="width:900px; max-width:900px;">

<div class="kind">상품 문의 하기</div>
<br><br>
<h3 style="font-size:1.9em">고객님의 질문에 대해서 운영자가 답변을 드립니다.</h3>
<form name="formm" method="post" action="mobileAskWrite">
	 <input type="hidden" name="pseq" value="${pseq}">

	<fieldset  style="margin:0; margin:0 auto; padd0ing:0;">
		<label style="font-size:2.1em; font-weight:bold">제목</label><br><br>
		<input type="text" name="title" size="60" style="width:813px; height:80px;  font-size:2.0em; 
		margin-bottom:20px; border:3px solid green;" value="${dto.title}"><br>
	<div style="width:100%; margin-top:20px;">
			<label style="font-size:2.1em; font-weight:bold; margin:10px 0;">내용</label><br><br>
		</div>
		
		<textarea rows="10" cols="70" name="content_a" style="width:813px; height:800px; font-size:1.7em; resize:none; border:3px solid green;">${dto.content_a}</textarea>
		
	</fieldset>
	<div class="clear"></div>
		<div id="buttons3" style="  font-size:2.6em;">
			<input type="submit" class="qnaviewb"value="문의하기" >
			<input type="button" class="qnaviewb" value="문의목록" c onClick="location.href='mobileAskForm'">
		</div>
	</form>
 <div id="message" style="font-size:1.9em; font-weight:bold;"> ${message}</div>
</article>



    <%@ include file="../include/headerfooter/mobileFooter.jsp"%>