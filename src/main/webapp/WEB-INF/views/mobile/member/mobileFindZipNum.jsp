<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file ="../include/sidemenu/memberSidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMemberHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>
<link href="mobile/css/mobile.css" rel="stylesheet"> 
<script src="mobile/script/mobileMember.js"></script>
</head>
<body>
<div id="popup">
	<h1>우편번호검색</h1>
	<form method="post" name="formm" action="mobileFindZipNum">
		<!-- <input type="hidden" name="command" value="findZipNum"> -->
		동 이름 : <input name="dong"  type="text"><input type="submit" value="찾기"  class="submit5">
	</form>
	<table id="zipcode">
		<tr><th width="100">우편번호</th><th>주소</th></tr>
		<c:forEach items="${addressList}" var="addressVO">
			<tr>
				<td>${addressVO.ZIP_NUM}</td>
				<td><a href="#" onClick="result( '${addressVO.ZIP_NUM}' ,  '${addressVO.SIDO}' , '${addressVO.GUGUN}' , '${addressVO.DONG}'  );" >
				${addressVO.SIDO} ${addressVO.GUGUN} ${addressVO.DONG} ${addressVO.BUNJI}</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../include/headerfooter/mobileMemberFooter.jsp" %>