<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>
<%@ include file="../include/user/customerCenter_sidemenu.jsp" %>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2>비회원문의</h2>
<h3>비회원고객님의 질문에 대해서 운영자가 답변을 드립니다.</h3>
<br><br>
<div id="message3" style="font-size:1.4em;"> ${message}</div>
<br><br>
<form name="formm" method="post" action="nmqnaWrite">

	<fieldset  style="margin:0; margin:0 auto; padd0ing:0;">
		<label style="font-size:1.4em;">임시아이디</label>&nbsp;&nbsp;
		<input type="text" name="id" size="60" style="width:150px; height:25px; margin-bottom:20px; border:3px solid green;" value="${dto.id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label style="font-size:1.4em;">임시비밀번호</label>&nbsp;&nbsp;
		<input placeholder="비회원문의 확인시 필요" type="text" name="pwd" size="60" style="width:150px; height:25px; margin-bottom:20px; border:3px solid green;" value="${dto.pwd}"><br>
		<label style="font-size:1.4em;">제목</label><br><br>
		<input type="text" name="subject" size="60" style="width:695px; height:25px; margin-bottom:20px; border:3px solid green;" value="${dto.subject}"><br>
	<div style="width:100%; margin-top:20px;">
			<label style="font-size:1.4em; margin:10px 0;">내용</label><br><br>
		</div>
		
		<textarea rows="10" cols="70" name="content" style="width:695px; resize:none; border:3px solid green;">${dto.content}</textarea>
		
	</fieldset>
	<br><br><br>
	<div class="clear"></div>
	<div id="buttons" style="float:right; margin-bottom:40px; margin-right:140px;" >
		<input type="submit" value="글쓰기" class="submit">
		<input type="button" value="쇼핑 계속하기" class="submit" onclick="location.href='/'">
	 </div>
</form>
</article>

<%@ include file="../include/user/headerfooter/footer.jsp" %>