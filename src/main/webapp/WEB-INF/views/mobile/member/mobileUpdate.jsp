<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileHeader.jsp" %> 
<%@ include file="../include/sidemenu/sidemenu.jsp" %>

<article id="article2">
<form method="post" name="joinForm" id="form2" action="mobileMemberUpdate">
	<!-- <input type="hidden" name="command" value="memberUpdate"> -->
	<fieldset id="fieldset2"><h2 align="center">회원정보 수정</h2>
	
	
	<table id="table2">
		<tr><th id="th1"><label>아이디</label></th><th id="th2"><input type="text" name="id" value="${loginUser.ID}" readonly>
	    <tr><th id="th1"><label>비밀번호</label></th><th id="th2"><input type="password"  name="pwd"></th></tr> 
	    <tr><th id="th1"><label>비밀번호 확인</label></th><th id="th2"><input type="password"  name="pwdCheck"></th></tr>
	    <tr><th id="th1"><label>이름</label></th><th id="th2"><input type="text" name="name"  value="${loginUser.NAME}"></th></tr>
	    <tr><th id="th1"><label>이메일</label></th><th id="th2"><input type="text" name="email" value="${loginUser.EMAIL}"></th></tr>
	    <tr><th id="th1"><label>우편번호</label></th><th id="th2"><input type="text" name="zip_num" size="10" value="${loginUser.ZIP_NUM}">    
	    <input type="button" value="주소 찾기" class="dup" onclick="post_zip()"></th></tr>
		<tr><th id="th1"><label>주소</label></th><th id="th2"><input type="text" name="addr1"   size="50" value="${addr1}"></th></tr>
		<tr><th id="th1"><label>&nbsp;</label></th><th id="th2"><input type="text" name="addr2"   size="25" value="${addr2}"></th></tr>
		<tr><th id="th1"><label>휴대폰 번호</label></th><th id="th2"><input  type="text" name="phone"  value="${loginUser.PHONE}"></th></tr>
	</table>
	<div class="clear"></div>
	<div id="buttons">
	    <input type="button" value="정보수정" class="submit4" onclick="go_update()"> 
	    <input type="reset" value="취소" class="cancel4" onclick="go_mypage()">
	</div></fieldset>
</form></article>

<%@ include file="../include/headerfooter/mobileFooter.jsp" %>