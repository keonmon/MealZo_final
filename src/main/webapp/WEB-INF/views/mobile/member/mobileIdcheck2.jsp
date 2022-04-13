<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<article id="article3">
<h1>ID 중복확인</h1>
<form method="post" name="idCheckForm" action="mobileIdcheck">
	<!-- <input type="hidden" name="command" value="idCheckForm"> -->
	User ID :  <input type="text" name="id" value="${id}" >
	<input type="submit" value="검색" class="submit5"><br><br><br>	
	<div>
		<c:if test="${result == 1}">
			<script type="text/javascript">opener.document.joinForm.id.value="";</script>
			${id}는 이미 사용중인 아이디입니다.
		</c:if>
		<c:if test="${result == -1}">
			${id}는 사용 가능한 ID입니다.    
			<input type="button" value="사용" class="cancel5" onclick="idok('${id}');">
		</c:if>
	</div>
	
</form>
</article>
</body>
</html>