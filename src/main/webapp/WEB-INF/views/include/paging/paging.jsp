<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{text-align:center;}
	#paging{font-size: 150%;}
</style>
</head>
<body>
<div id="paging">
	<c:url var="action" value="${param.command}"/>
	<c:if test="${param.prev}">
    	<a href="${action}?page=${param.beginPage-1}">◀</a>
	</c:if>
	<c:forEach begin="${param.beginPage}" end="${param.endPage}" var="index">
	    <c:choose>
	        <c:when test="${param.page==index}">${index}</c:when>
	        <c:otherwise><a href="${action}?page=${index}">${index}</a></c:otherwise>
	    </c:choose>
	</c:forEach>
	<c:if test="${param.next}">
    	<a href="${action}?page=${param.endPage+1}">▶</a>
	</c:if>
</div>
</body>
</html>