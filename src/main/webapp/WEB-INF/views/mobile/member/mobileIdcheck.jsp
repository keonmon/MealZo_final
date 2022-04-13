<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileHeader.jsp" %> 
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
</head>
<article id="article2">
<form method="post" name="idCheckForm" id="form2">
	<fieldset id="fieldset2"><h2 align="center">중복확인</h2>
	
	
	<table id="table2">
	<tr><th id="th4"><label>User ID </label></th><th id="th7"><input type="text" name="id" value="${id}" >
		<input type="submit" value="검색" class="submit5" style="float:left;"></th></tr>
	</table>
	
	<table id="table2">
	<tr style="float:left;">
	<div>
		<c:if test="${result == 1}">
			<script type="text/javascript">opener.document.joinForm.id.value="";</script>
			<h2 align="center">${id}는 이미 사용중인 아이디입니다.</h2>
		</c:if>
		<c:if test="${result == -1}">
			<h2 align="center">${id}는 사용 가능한 ID입니다.</h2>    
		</c:if>
		<!-- <div class="clear"></div> -->
			<div id="buttons">
				<input type="button" value="사용" class="cancel" onclick="idok('${id}');">
			</div>
	</div></tr>
	</table></fieldset>
</form></article>
<%@ include file="../include/headerfooter/mobileFooter.jsp" %>