<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp"%>
<article id="article2">
<form method="post" name="joinForm" id="form2">
	<fieldset id="fieldset2"><h2 align="center">회원정보 입력</h2>
	
	
	<table id="table2">
	<tr><th id="th1"><label>아이디</label></th><th id="th2"><input type="text" name="id" size="6" placeholder="공백 없는 영문/숫자 포함 6~20자"  class="text2" style="border:0 solid black;"><input type="hidden" name="reid">
	    <input type="button" value="중복 체크" class="dup" onclick="idcheck()"></th></tr>
	    <tr><th id="th1"><label>비밀번호</label></th><th id="th2"><input type="password" name="pwd" size="6" placeholder="공백 없는 영문/숫자 포함 6~20자"  class="text2" style="border:0 solid black;"></th></tr> 
	    <tr><th id="th1"><label>비밀번호 확인</label></th><th id="th2"><input type="password" name="pwdCheck" size="6" placeholder="비밀번호 확인"  class="text2" style="border:0 solid black;"></th></tr>
	    <tr><th id="th1"><label>이름</label></th><th id="th2"><input type="text"  name="name" ></th></tr>
	    <tr><th id="th1"><label>이메일</label></th><th id="th2"><input type="text"  name="email"></th></tr>
	    <tr><th id="th1"><label>우편번호</label></th><th id="th2"><input type="text" name="zip_num"   size="10" >    
	    <input type="button" value="주소 찾기" class="dup" onclick="post_zip()"></th></tr>
		<tr><th id="th1"><label>주소</label></th><th id="th2"><input type="text" name="addr1" size="50"></th></tr>
		<tr><th id="th1"><label>&nbsp;</label></th><th id="th2"><input type="text" name="addr2"   size="25"></th></tr>
		<tr><th id="th1"><label>휴대폰 번호</label></th><th id="th2"><input  type="text" name="phone"></th></tr>
	</table>
	<div class="clear"></div>
	<div id="buttons">
	    <input type="button" value="동의하고 회원가입" class="submit" onclick="go_save()"> 
	    	<div class="clear"></div>
	    
	</div></fieldset>
</form></article>
<%@ include file="../include/user/headerfooter/footer.jsp"%>