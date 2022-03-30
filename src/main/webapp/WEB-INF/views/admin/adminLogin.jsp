<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="admin/css/admin.css">

</head>
<body style="padding:25px; width:100%; box-sizing:border-box;" >
<div >
<div class="clear"></div>
<article>
<div id="loginform"  >
	<form name="frm" method="post" action="adminLogin">
		<table style="margin:0 auto; min-width:200px; ">
		<tr><td>아 이 디</td><td><input type="text" name="id" size="10" value="${avo.id}"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pwd" size="10" value="${avo.pwd}"></td></tr>
			<tr align="center" ><td  colspan="2">	<input class="submit" type="submit" value="로그인">
				<br><br><h4 style="color:red">${msg}</h4></td></tr>
		</table>
	</form>
</div>
</article>
</div>

</body>
</html>








