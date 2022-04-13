<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileHeader.jsp" %>

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
   <input type="submit" value="로그인" class="submit" onClick="href='mobileLogin'"> <!-- onClick="loginCheck()" -->
</div>
<div id="side_buttons" >
 <ul style="margin-top:0; ">
   <li ><a style="width:60%; font-size:1.2em" href="mobileFindIdForm">아이디/비밀번호 찾기 </a></li>
   <li ><a style="margin-left:20%; width:30%; font-size:1.2em" href="mobileContract" >회원가입</a></li>
 </ul>
</div><br><br>
<%-- <div > &nbsp; &nbsp; ${message}</div> --%>

</fieldset>
</form>
<div id="message" style="font-size:1.3em; width:80%; left:20%;"> ${message}</div>
</article>


<%@ include file="../include/headerfooter/mobileFooter.jsp" %>