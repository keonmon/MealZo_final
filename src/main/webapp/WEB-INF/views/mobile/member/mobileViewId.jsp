<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/memberSidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMemberHeader.jsp"%>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
</head>
<script>
function move_login() {
	document.IdForm.action = "mobileLogin";
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
		    <input type="button" class="submit3" value="로그인창으로" onClick="move_login();" style="margin-left:5%">
			<input type="button" class="submit3" value="비밀번호찾기" style="margin-left:2%"
			onClick="location.href='mobileFindIdForm?returnpwd=pwd'" >
		</div>
	</fieldset>
</form>
</article>



<%@ include file="../include/headerfooter/mobileMemberFooter.jsp" %>