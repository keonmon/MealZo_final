<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>

<!-- 로그인폼 불러올 시 아이디 입력란 focus() -->
<script type="text/javascript">
$(function(){
	$('.text').eq(0).focus();
});
</script>

<br><br><br><br>
<article>
<form method="post" action="login" name="loginFrm">

 <fieldset>
  <legend></legend>
  
  <input type="text" name="id" placeholder="아이디"  class="text" style="border:0 solid black;font-weight:bold;" ><br><div id=input1></div>
  <input type="password" name="pwd" placeholder="비밀번호" class="text" style="border:0 solid black; font-weight:bold;"><div id=input1></div>
 
 
<div id = "buttons">
   <input type="submit" value="로그인" class="submit" onClick="return loginCheck()">
</div>
<div id="side_buttons" style="margin:0;">
 <ul style="margin-top:0;">
   <li ><a style="width:120px; font-size:1.2em" href="findIdForm">아이디/비밀번호 찾기 </a></li>
   <li ><a style="width:120px; font-size:1.2em" href="contract" >회원가입</a></li>
 </ul>
</div><br><br>
<div> &nbsp; &nbsp; ${message}</div>

</fieldset>
</form>

<c:choose>
	<c:when test="${useyn2=='n'}">
		<div id="message" style="font-size:1.2em; width:80%; margin:0 auto; text-align:center;">
			탈퇴하거나 휴면중인 계정입니다.<br>
			<a href="nmqnaForm" style="text-decoration: none; color: red;">
					고객센터(클릭) </a>를 통해 문의주시기 바랍니다
		</div>
	</c:when>	
	<c:otherwise>
		<div id="message" style="font-size:1.2em; width:80%; left:10%;"> ${message}</div>
		<div id="msg" style="font-size:1.2em; width:80%; left:30%;"> ${msg}</div>
	</c:otherwise>
</c:choose>

</article>


<%@ include file="../include/user/headerfooter/footer.jsp" %>