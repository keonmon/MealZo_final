<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/user/headerfooter/header.jsp" %>  

<%@ include file="../include/user/mypage_sidemenu.jsp" %>

<article id="mypageArticle2"> 
<h2>상품 문의 하기</h2>
<h3>고객님의 질문에 대해서 운영자가 답변을 드립니다</h3>
<form name="formm" method="post" action="askWrite">
	 
	 <input type="hidden" name="pseq" value="${pseq}">
		<fieldset style="margin:0; margin:0 auto; padding:0;">
		<div style="width:100%">
			<div style="max-width:100%; margin:10px 0;">	
				<label style="font-size:1.4em;">제목</label><br>
			</div>
		<input type="text" name="title" size="60" style="width:695px; margin-bottom:20px; border:3px solid green;"  value="${dto.title}"><br>
		<div style="width:100%">
			<label style="font-size:1.4em; margin:10px 0;">내용</label>
		</div>
		
		<textarea rows="10" cols="70" name="content_a" style="width:695px; resize:none; border:3px solid green;">${dto.content_a}</textarea>
		
		</div>	
	</fieldset>
	<div class="clear"></div>
	<div id="buttons" style=" text-align:center">
		<input type="submit" value="글쓰기" class="submit">
		<input type="button" value="쇼핑 계속하기" class="submit" onclick="location.href='/'">
	</div>
</form>
 <div id="message" style="font-size:1.4em;"> ${message}</div>
</article>
	


<%@ include file="../include/user/headerfooter/footer.jsp" %>