<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 	
<nav id="sideMenu">
	<ul>
		<li><p id="mypage"><a href="meal.do?command=mypage">MY PAGE</a></li>
		<br>
		<li><h3><a href="meal.do?command=orderListForm">나의 쇼핑</a></h3></li>
		<li id=menu><a href="meal.do?command=orderListForm">주문/배송</a></li>
		<li id=menu><a href="meal.do?command=orderCancelForm">주문 취소</a></li>
		<br>
		<li><h3><a href="qnaForm">나의 활동</a></h3></li>
		<li id=menu><a href="qnaForm?sub=y">나의 Q&amp;A</a></li>
		<li id=menu><a href="askForm?sub=y">나의 상품 문의</a></li>
		<li id=menu><a href="reviewForm?sub=y">나의 상품 후기</a></li>
		<br>
		<li><h3><a href="editForm">나의 정보</a></h3></li>
		<li id=menu><a href="editForm">회원정보 수정</a></li>
		<li id=menu><a href="withDrawal">회원 탈퇴</a></li>
	</ul>
</nav>