<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>header</title>
<link href="mobile/css/mobile.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="user/script/jquery-3.6.0.js"></script>
<script src="user/script/member.js"></script>
<script src="mobile/script/mobileProduct.js"></script>
<script src="user/script/mypage.js"></script>


<!-- Ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
</head>
<body>
	<div id="wrap">
	<header>
		
		<div id="header">
			<!-- 헤더 최상단 -->
			<div class="header_1st">
				<span class="material-icons" id="sidemenuIcon" name="sidemenu"  >menu</span>
			    <input type="checkbox" id="menuicon">
			    <label for="menuicon">
			      <span></span>
			      <span></span>
			      <span></span>
			    </label>
				<!-- 로고 -->
				<div id="logo"><a href="mobileMain?sub=y"><img src="images/MealZologo.png"></a></div>
					
				<!-- 검색창 -->
				<div id="search">
					<form method="post" name="formm" onsubmit="return false;">
						<span><input type="text" name="key" id="key" placeholder="검색어를 입력해주세요" class="search_word" value="${key}" onkeyup="enterkey();"></span>
						<span class="material-icons" id="productSearchIcon" name="search" onClick="go_search('productAllForm');">search</span>
					</form>
				</div>
				<div id="cart">
					<a href="cartList"><span class="material-icons" id="cartIcon" name="cart" >shopping_cart</span>
						<b id="cartCnt" style="position:absolute; background-color:green; border-radius:3px 3px 3px 3px; color:white">${cartCnt }</b></a>
				</div>
				
			
				<div class="clear"></div>
			</div>
			
	
			<!-- menu 
			<div class="header_3rd">
				카테고리
				<div id="category">
					<ul>
		                  <li class="menu"><a href="productAllForm?sort=recently&sub=y&idx=0">전체보기</a></li>
		                  <li class="menu"><a href="productForm?kind=&bestyn=y&newyn=&sort=recently&sub=y&idx=0">베스트</a></li>
		                  <li class="menu"><a href="productForm?kind=&bestyn=&newyn=y&sort=recently&sub=y&idx=0">신제품</a></li>
		                  <li class="menu"><a href="productForm?kind=한식&bestyn=&newyn=&sort=recently&sub=y&idx=0">한식</a></li>
		                  <li class="menu"><a href="productForm?kind=중식&bestyn=&newyn=&sort=recently&sub=y&idx=0">중식</a></li>
		                  <li class="menu"><a href="productForm?kind=양식&bestyn=&newyn=&sort=recently&sub=y&idx=0">양식</a></li>
		                  <li class="menu" Style="display:none;"><a href="subscribeForm">VIP전용관</a></li>
               		</ul>
				</div>
			</div>-->
		</div>
		
	</header>
<!-- </div> -->