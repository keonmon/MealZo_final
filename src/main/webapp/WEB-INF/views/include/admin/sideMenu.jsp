<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta charset="UTF-8">

<nav id="sideMenu">
<ul>
   <li><p id="mypage"><a href="adminProductList?sub=y">관리자 메뉴</a></li>
   <br>
   <li id="menu"><a href='adminProductList?sub=y'>판매상품 관리</a></li>
   <li id="menu"><a href='adminOrderList?sub=y'>주문/배송 관리</a></li>
   <li id="menu"><a href='adminMemberList?sub=y'>회원 관리</a></li>
   <li id="menu"><a href="adminQnaList?sub=y">고객서비스 관리</a>
     <ul>
	     <li><a href='adminQnaList?sub=y'>Q&amp;A</a></li>
	     <li><a href='adminAskForm?sub=y'>상품문의</a></li>
	     <li><a href='adminReviewForm?sub=y'>상품후기</a></li>
	     <li><a href='adminnmQnaList?sub=y'>비회원관리</a></li>
     </ul>
   </li>
   <li id="menu"><a href='adminNoticeList&sub=y'>고객센터 관리</a>
		<ul>
			<li><a href='adminNoticeList?sub=y'>공지사항</a></li>
			<li><a href='adminEventList?sub=y'>이벤트</a></li>
		</ul>
   </li>
   <li id="menu"><a href='adminBannerList?sub=y'>메인배너관리</a></li>
</ul>
</nav>