<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>

<article id="zzim2" style="width:900px; max-width:900px;">

<div class="kind">${loginUser.ID} &nbsp; 님의 후기 작성입니다</div>

<br><br>

<form name="formm" method="post" action="mobileReviewWrite">
${dto.indate}
<input type="hidden" name="pseq" value="${pseq}">
	<fieldset  style="margin:0; margin:0 auto; padd0ing:0;">
		<div style="width:100%; margin-top:60px;">
			<label style="font-size:2.1em; font-weight:bold; margin:10px 0;"  >내용</label><br><br>
		</div>
		
		<textarea rows="10" cols="70"  placeholder="내용을 입력해주세요"  name="content" style="width:813px; height:800px; font-size:1.7em; resize:none; border:3px solid green;">${dto.content}</textarea>
		
	</fieldset>
	 <div id="message" style="font-size:1.9em; font-weight:bold;"> ${message}</div>
	
	<div class="clear"></div>
		<div id="buttons3" style="  font-size:2.6em;">
			<input type="submit" class="qnaviewb"value="후기완료" >
			<input type="button" class="qnaviewb" value="글쓰기 취소" onClick="location.href='mobileReviewForm'">
		</div>
	</form>
 </article>



    <%@ include file="../include/headerfooter/mobileFooter.jsp"%>