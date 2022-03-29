<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>

<%@ include file="../include/user/mypage_sidemenu.jsp" %>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2>나의 Q&amp;A</h2>
<h3>고객님의 질문에 대해서 운영자가 답변을 드립니다.</h3>
<form name="formm" method="post" action="qnaWrite">

	<fieldset  style="margin:0; margin:0 auto; padd0ing:0;">
		<label style="font-size:1.4em;">제목</label><br><br>
		<input type="text" name="subject" size="60" style="width:695px; height:25px; margin-bottom:20px; border:3px solid green;" value="${dto.subject}"><br>
	<div style="width:100%; margin-top:20px;">
			<label style="font-size:1.4em; margin:10px 0;">내용</label><br><br>
		</div>
		
		<textarea rows="10" cols="70" name="content" style="width:695px; resize:none; border:3px solid green;">${dto.content}</textarea>
		
	</fieldset>
	<div class="clear"></div>
	<div id="buttons" style="float:right; margin-bottom:40px; margin-right:140px;" >
		<input type="submit" value="글쓰기" class="submit">
		<input type="button" value="쇼핑 계속하기" class="submit" onclick="location.href='/'">
	 </div>
</form>
 <div id="message" style="font-size:1.4em;"> ${message}</div>
</article>

<%@ include file="../include/user/headerfooter/footer.jsp" %>