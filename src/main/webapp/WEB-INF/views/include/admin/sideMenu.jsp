<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta charset="UTF-8">

<nav id="sideMenu">
<ul>
   <li><p id="mypage"><a href="meal.do?command=adminProductList&sub=y">관리자 메뉴</a></li>
   <br>
   <li id="menu"><a href='meal.do?command=adminProductList&sub=y'>판매상품 관리</a></li>
   <li id="menu"><a href='meal.do?command=adminOrderList&sub=y'>주문/배송 관리</a></li>
   <li id="menu"><a href='meal.do?command=adminMemberList&sub=y'>회원 관리</a></li>
   <li id="menu"><a href="meal.do?command=adminQnaList&sub=y">고객서비스 관리</a>
     <ul>
	     <li><a href='meal.do?command=adminQnaList&sub=y'>Q&amp;A</a></li>
	     <li><a href='meal.do?command=adminAskForm&sub=y'>상품문의</a></li>
	     <li><a href='meal.do?command=adminReviewForm&sub=y'>상품후기</a></li>
     </ul>
   </li>
   <li id="menu"><a href='meal.do?command=adminNoticeList&sub=y'>고객센터 관리</a>
		<ul>
			<li><a href='meal.do?command=adminNoticeList&sub=y'>공지사항</a></li>
			<li><a href='meal.do?command=adminEventList&sub=y'>이벤트</a></li>
		</ul>
   </li>
</ul>
</nav>