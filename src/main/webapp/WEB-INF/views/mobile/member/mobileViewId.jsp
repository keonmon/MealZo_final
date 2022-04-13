<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<script>
function move_login() {
	document.IdForm.action = "mobileUserLogin";
	document.IdForm.submit();
}

$(function(){
	var selected2 = "${selected2}";
	console.log(selected2);
	if(selected2=="id"){
		$("#idtr").show();
		$("#pwdtr").hide();
	}else{
		$("#idtr").hide();
		$("#pwdtr").show();
	}
});

</script>
<article id="article3">
<form method="POST" name="IdForm" id="form2">
	<fieldset id="fieldset3"><div><h2 align="center">아이디/비밀번호 찾기</h2></div>
		<table class="table3">
			<tr id="idtr">
				<th align="center" colspan="2"><h3>조회한 아이디는 (${dto.id}) 입니다.</h3>
			</tr>
			<tr id="pwdtr">
				<th align="center" colspan="2"><h3>조회한 비밀번호는 (${dto.pwd}) 입니다.</h3>
			</tr>
			
		</table>
		
		<div id="buttons">
		    <input type="button" class="submit3" value="로그인 창으로" onClick="move_login();">
			<input type="button" class="submit3" value="비밀번호찾기" 
			onClick="location.href='mobileFindIdForm?returnpwd=pwd'" >
		</div>
	</fieldset>
</form>
</article>



<%@ include file="../include/headerfooter/mobileFooter.jsp" %>