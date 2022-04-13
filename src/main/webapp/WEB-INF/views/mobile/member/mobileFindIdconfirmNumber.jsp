<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<script>
$(function(){
	var email = '${email}';
	// console.log(email); 확인차 주석개념
	if(email == null || email ==''){
		$("#email2").hide();
		$("#phone2").show();
	}else{
		$("#email2").show();
		$("#phone2").hide();
	}
});

</script>
<article id="article3">
<form method="POST" name="IdForm" id="form2" action="mobileFindIdStep2">
	<!-- <input type="hidden" name="command" value="findIdStep2"> -->
	<input type="hidden" name="selected2" id="selected2" value="${selected2}">
	<input type="hidden" id="id" name="id" value="${id}">
	<input type="hidden" id="pwd" name="pwd" value="${pwd}">
	<input type="hidden" name="name" value="${dto.name}">	
	<input type="hidden" name="email" value="${dto.email}">	
	<input type="hidden" name="phone" value="${dto.phone}">	
	
	<fieldset id="fieldset3"><div><h2 align="center">아이디/비밀번호 찾기</h2></div>
		<table class="table3">
			<tr id="email2">
				<th id="th6" align="center" colspan="2"><h3>회원님의 이메일 주소(${dto.email})로 인증정보가 발송되었습니다.
				메일을 확인하시기 바랍니다.</h3>	
			</tr>
			<tr id="phone2">
				<th id="th6" align="center" colspan="2"><h3>회원님의 휴대폰(${dto.phone})으로 인증정보가 발송되었습니다.
				메세지를 확인하시기 바랍니다.</h3>
			</tr>
			
			<tr >
				<th id="th5"><h3>인증번호</h3>	
				<td><input type="text" name="confirmNum" id="confirmNum" class="text2" 
				style=" height:50px; border:1px solid lightgray; font-size:2em; font-weight:bold; letter-spacing:3px; text-align:center;" ></td></th>
			</tr>
			
			<tr align="center">
				<td id="th3" colspan="2">
					<h3>전송받은 번호를 입력하세요</h3>
				</td>
				<td></td>
			</tr>
			<tr align="center">
				<td id="th3" colspan="2">
					<h3>${msg}</h3>
				</td>
				<td></td>
			</tr>
		</table>
		
		<div id="buttons">
		    <input type="submit" value="인증번호 확인" class="submit" onClick="checknum()">
		</div>
	</fieldset>
		
</form>
</article>



<%@ include file="../include/headerfooter/mobileFooter.jsp" %>