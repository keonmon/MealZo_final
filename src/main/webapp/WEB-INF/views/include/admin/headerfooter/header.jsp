<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="admin/css/admin.css">
	<script src="script/jquery-3.6.0.js"></script>
	<script src="admin/product/adminProduct.js"></script>
</head>
<body>
<div id="wrap">
	<header>	
	<div>		
		<input class="btn" type="button" value="로그아웃" style="float: right;" onClick="location.href='meal.do?command=adminLogout'">	
		<input class="btn" type="button" value="밀조 홈으로 이동" style="float: right;" onClick="location.href='meal.do?command=index'">	
		<div class="clear"></div>
	</div>
	<!-- 로고 -->
	<div id="logo">
		<div>관리자 라운지</div>
		<a href="meal.do?command=adminProductList"><img src="images/MealZologo.png"></a>
	</div>
			
	</header>
	<div class="clear"></div>
