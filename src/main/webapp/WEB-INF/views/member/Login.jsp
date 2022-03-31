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
</article>


<%@ include file="../include/user/headerfooter/header.jsp" %>