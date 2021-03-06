<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <input type="checkbox" id="menuicon">
    <!-- 헤더로 이사감 ~-->
    <label for="menuicon">
      <span></span>
      <span></span>
      <span></span>
    </label> 		
    <div class="sidebar">  <!--  사이드바 나오는거 건드리지 말기 -->

    
    <div id="sidelogin">
   <ul>
      <li>
		<c:choose>
		<c:when test="${empty loginUser }">
      <a href="mobileLoginForm" style="font-size:1.3em"><psan id="login3"><ins >로그인</ins></psan></a><span  style="font-size:1.3em">해 주세요</span>
      </c:when>
      <c:otherwise>
      <span style="font-size:1.3em"><strong>💖${loginUser.NAME }💖</strong> 님 반갑습니다</span>
      <a href="mobileLogout" style="font-size:1.3em"><ins><b>로그아웃</b></ins></a>
      </c:otherwise>
      </c:choose>
      </li>
      </ul>
      </div>
     <span class="material-icons"  id="homeicon"><a href="/" style="font-size:2.3em">home</a></span>
 
      
      <div id="sideicon">
      <ul>
	 <li><a href="mobileOrderList?redirectUrl=mobileOrderList"><span class="material-icons" style="font-size:5em; ">&nbsp;local_shipping</span><br><span style="font-size:2em; font-weight:bold;">주문내역</span></a></li>
	 <li><a href="mobileMypageForm?redirectUrl=mobileMypageForm"><span class="material-icons" style="font-size:5em;">&nbsp;&nbsp;account_circle</span><br><span style="font-size:2em; font-weight:bold;">&nbsp;마이페이지</span></a></li>
	 <li><a href="mobileZzimList?redirectUrl=mobileZzimList"><span class="material-icons" style="font-size:5em;">&nbsp;volunteer_activism</span><br><span style="font-size:2em; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;찜</span></a></li>
     </ul>
     <div class="clear"></div>
    </div>     
<br>
 <div id="sidelist">
      <ul>
      <li><a href="mobileProductAllForm?sort=recently&sub=y&idx=0">전체 보기</a></li>
      <li><a href="mobileProductForm?kind=&bestyn=y&newyn=&sort=recently&sub=y&idx=0">베스트 메뉴</a></li>
      <li><a href="mobileProductForm?kind=&bestyn=&newyn=y&sort=recently&sub=y&idx=0">신제품</a></li>
       <li><a href="mobileProductForm?kind=한식&bestyn=&newyn=&sort=recently&sub=y&idx=0">한식</a></li>
        <li><a href="mobileProductForm?kind=중식&bestyn=&newyn=&sort=recently&sub=y&idx=0">중식</a></li>
         <li><a href="mobileProductForm?kind=양식&bestyn=&newyn=&sort=recently&sub=y&idx=0">양식</a></li>
      <hr><br>
      <li><a href="mobileEventList">이벤트</a></li>
      <li><a href="mobileNoticeList">공지사항</a></li>
      <li><a href="mobileCompany">밀조 소개</a></li>
      <li><a href="mobileNmqnaForm">고객센터</a></li>
   </ul>
   </div>
   
</div>