<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp"%>
<script>

$(document).ready(function(){
	var returnpwd = '${param.returnpwd}';
	if(returnpwd == 'pwd'){
		$("#idDiv").show();
		$("#pwdDiv2").show();
    	$("#idDiv2").hide();
    	$("#selected2").val("pwd");
    	$('li div').removeClass('active');
    	$('li div').eq(1).addClass('active');
    	
	}
	
    $("input:radio[name=findBy]").click(function(){
    	var value = $(this).attr("value");
    	if(value == "email"){
    		$('#name').val('');
    		$('#id').val('');
    		$('#security').val('');
    		$('#email').val('');
    		$('#phone').val('');
    		$("#emailDiv").show();
    		$("#phoneDiv").hide();
    		$("#selected").val("email");
    	}else{
    		$('#name').val('');
    		$('#id').val('');
    		$('#security').val('');
    		$('#email').val('');
    		$('#phone').val('');
    		$("#emailDiv").hide();
    		$("#phoneDiv").show();
    		$("#selected").val("phone");
    	}
    });
    
    $("#searchid").click(function(){
			var num = $(this).index();
			$('li div').removeClass('active');
			$('li div').eq(num).addClass('active');
    	$("#idDiv").hide();
    	$("#pwdDiv2").hide();
    	$("#idDiv2").show();
    	$("#selected2").val("id");
    });
    
    $("#searchpwd").click(function(){
			var num = $(this).index();
			$('li div').removeClass('active');
			$('li div').eq(num).addClass('active');
    	$("#idDiv").show();
    	$("#pwdDiv2").show();
    	$("#idDiv2").hide();
    	$("#selected2").val("pwd");
    });
});
function changeImg() {
	var bb = $("#idx").val();
	if(bb==11)
		bb=1;
	else
		bb++;
	$("#idx").val(bb);
    document.getElementById("img").src = "images/a"+bb+".jpg";
   
    
  }
</script>
<article id="article3">
<form method="POST" name="IdForm" id="form2" ><!-- action="findIdStep1" -->
	<!-- <input type="hidden" name="command" value="findIdStep1"> -->
	<input type="hidden" name="selected" id="selected" value="email">
	<input type="hidden" name="selected" id="selected" value="phone">
	<input type="hidden" name="selected2" id="selected2" value="id">
	<input type="hidden" name="idx" id="idx" value="1">
	<div id="sunghee">
	<fieldset id="fieldset3"><div><h2 align="center">?????????/???????????? ??????</h2></div>
		<div class="table3"  >
			<ul style="background:#FFFFF0" id="selectBox">
				<li width="50%" id="searchid">
					<div class="active">????????? ??????</div>
				</li>
				<li width="50%" id="searchpwd">
					<div>???????????? ??????</div>
				</li>
			</ul>
		</div>
<!-- 		<table class="table3" id="selectBox">
			<tr style="background:#FFFFF0">
				<th width="50%" id="searchid" class="active">
					????????? ??????
				</th>
				<th width="50%"id="searchpwd">
					???????????? ??????
				</th>
			</tr>
		</table> -->
		<table class="table3">
			<tr id="idDiv2">
				<td align="center" colspan="2"><h3>?????? ????????? ????????? ??????</h3><br>???????????? ??? ????????? ????????? ?????? ??? ????????????</td>
			</tr>
			<tr id="pwdDiv2" style="display:none;">
				<td align="center" colspan="2"><h3>?????? ????????? ???????????? ??????</h3><br>???????????? ??? ????????? ????????? ?????? ??? ????????????</td>
			</tr>
		</table>
		
		<div class="sunghee2">
		<table class="table4">
			<tr>
				<td><input type="radio" name="findBy" value="email" checked><label>?????????</label></td>
				<td><input type="radio" name="findBy" value="phone"><label>?????????</label></td>
			</tr>
			<tr>
				<th><label>??????</label></th>
				<td id="th2">
					<input type="text" name="name" id="name" class="text2" >
				</td>
			</tr>
			<tr id="idDiv" style="display:none;">
				<th><label>?????????</label></th>
				<td id="th2">
					<input type="text" id="id" name="id" class="text2" >
				</td>
			</tr>
			<tr id="emailDiv">
				<th><label>?????????</label></th>
				<td id="th2">
					<input type="text" name="email" id="email" class="text2" >
				</td>
			</tr>
			<tr id="phoneDiv" style="display:none;">
				<th><label>?????????</label></th>
				<td id="th2">
					<input type="text" name="phone" id="phone" class="text2" >
				</td>
			</tr>
	
			<tr>
				<th rowspan="2" height="100px"><label>????????????</label></th>
				<td><img src="images/a1.jpg" width="50%" height="60%" id="img"/>&nbsp;&nbsp;&nbsp;
				<img src="images/refresh.jpg" width="10%" height="40%" onclick="changeImg()"/></td>
			</tr>
			<tr>
				<td id="th2"><input type="text" id="security" name="security" size="6" placeholder="?????? ?????? ??????" class="text2" ></td>
			</tr>
		
		</table>
		</div>
		<h3 align="center">${msg}</h3>
		<div id="buttons">
		    <input type="button" value="??????" class="submit" onClick="findCheck()">
		</div>
	
	</fieldset>
	</div>
</form>
</article>



<%@ include file="../include/user/headerfooter/footer.jsp"%>