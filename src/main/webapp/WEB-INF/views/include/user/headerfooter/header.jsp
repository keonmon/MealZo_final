<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>header</title>
<link href="user/css/meal.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="user/script/jquery-3.6.0.js"></script>
<script src="user/member.js"></script>
<script src="user/product.js"></script>
<script src="user/mypage.js"></script>
<script>
/* result 값에 따른 처리 결과 메시지 ( String true/false 파라미터로 구분 ) */
<%
	// System.out.println("result : " + request.getAttribute("result"));
	String result = (String)request.getAttribute("result");
	if("true".equals(result)) {
%>
	alert("정상적으로 처리되었습니다.");
<%
	}else if("false".equals(result)){
%>
	alert("처리에 실패했습니다.\n관리자에게 문의하세요.");
<%	
	}else{ }
%>
</script>
</head>
<body>
	<div id="wrap">
	<header>
		<div id="header">
			<!-- 헤더 최상단 -->
			<div class="header_1st">
				<div id="h1st_list">
					<ul class="utilMenu">
						<li>
							<c:choose>
								<c:when test="${empty loginUser }">
									<a href="userLogin">로그인</a>
								</c:when>
								<c:otherwise>
									<span style="font-size:1.1em"><strong>${loginUser.NAME }</strong> 님 반갑습니다&nbsp;&nbsp;</span>
								</c:otherwise>
							</c:choose>
						|</li>
						<li>
							<c:choose>
								<c:when test="${empty loginUser }">
									<a href="contract">회원가입 </a>|
								</c:when>
								<c:otherwise>
								<a href="logout" onclick="return confirm('정말 로그아웃 하시겠습니까?')">로그아웃 </a>|
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<a href="mypageForm">마이페이지 </a>|
						</li>
						<li>
							<a href="orderListForm">주문조회 </a>|
						</li>
						<li>
							<a href="cartList">장바구니</a>
						</li>
					</ul>
			<div class="clear"></div>	
				</div>
			</div>
			<!-- 로고 -->
			<div id="logo">
				<a href="index?sub=y"><img src="images/MealZologo.png"></a>
			</div>
	
			<!-- menu -->
			<div class="header_3rd">
				<!-- 카테고리 -->
				<div id="categori">
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
				
				<script>
					
				</script>
				<!-- 검색창 -->
				<div id="search">
					<form method="post" name="formm" onsubmit="return false;">
						<span><input type="text" name="key" id="key" placeholder="검색어를 입력해주세요" class="search_word" value="${key}" onkeyup="enterkey();"></span>
						<span class="material-icons" id="productSearchIcon" name="search" onClick="go_search('productAllForm');">search</span>
						<!--  <span><img src="images/search.jpg" class="search" onclick="search();"/></span>-->
						<!-- onClick="go_search('adminProductList');" -->
						<!-- onclick="location.href='#'" -->
					</form>
				</div>
			</div>
		</div>
	</header>
<!-- </div> -->