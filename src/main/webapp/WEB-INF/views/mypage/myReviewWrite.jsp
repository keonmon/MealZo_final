<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>

<%@ include file="../include/user/mypage_sidemenu.jsp" %>
<article>
<h2>상품 후기 작성</h2>
<h3>고객님의 상품 후기가 저희에게 큰 도움이 됩니다</h3>
<form name="formr" method="post" action="reviewWrite">

<input type="hidden" name="pseq" value="${pseq}">

<fieldset>
	<div><h3>${loginUser.ID }&nbsp;님의 후기 작성입니다</h3> </div>
	<br>${dto.indate}
<textarea rows="10" cols="70" name="content"  placeholder="내용을 입력해주세요"  >${dto.content }</textarea>
 <div id="message2" style="font-size:1.4em;"> ${message}</div>
</fieldset>
<div class="clear"></div>
	<div id="buttons" style="float:right">
		<input type="submit" value="글쓰기" class="submit" >
		<input type="button" value="쇼핑 계속하기" class="submit" onclick="location.href='/'">
	</div>
<br><br><br>

</form>

</article>
  <%@ include file="../include/user/headerfooter/footer.jsp" %>