<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <input type="checkbox" id="menuicon2">
    <!-- 헤더로 이사감 ~-->
    <label for="menuicon2">
      <span></span>
      <span></span>
      <span></span>
    </label> 		
    <div class="sidebar2">  <!--  사이드바 나오는거 건드리지 말기 -->

    
    <div id="sidelogin2">
   <ul>
      <li>
		<c:choose>
		<c:when test="${empty loginUser }">
      <a href="mobileLoginForm"><psan id="login3"><ins >로그인</ins></psan></a>해 주세요
      </c:when>
      <c:otherwise>
     <span style="font-size:0.9em"><strong>${loginUser.NAME }</strong> 님 반갑습니다</span>
      <a href="mobileLogout" style="font-size:0.9em"><ins >로그아웃</ins></a>
      </c:otherwise>
      </c:choose>
      </li>
      </ul>
      </div>
     <span class="material-icons"  id="homeicon2"><a href="/">home</a></span>
 
      
      <div id="sideicon2">
      <ul>
	 <li><a href="mobileOrderList"><span class="material-icons" style="font-size:2.0em; ">&nbsp;local_shipping</span><br><span style="font-size:0.8em; font-weight:bold;">주문내역</span></a></li>
	 <li style="margin-left:20px;"><a href="mobileMypageForm"><span class="material-icons" style="font-size:2.0em;">&nbsp;&nbsp;account_circle</span><br><span style="font-size:0.8em; font-weight:bold;">&nbsp;마이페이지</span></a></li>
	 <li style="margin-left:20px;"><a href="mobileZzimList"><span class="material-icons" style="font-size:2.0em;">&nbsp;volunteer_activism</span><br><span style="font-size:0.8em; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;찜</span></a></li>
     </ul>
    </div>     
<br>
 <div id="sidelist2">
      <ul style="padding: 10 0 0 0;">
      <li><a href="mobileProductAllForm?sort=recently&sub=y&idx=0">전체 보기</a></li>
      <li><a href="mobileProductForm?kind=&bestyn=y&newyn=&sort=recently&sub=y&idx=0">베스트 메뉴</a></li>
      <li><a href="mobileProductForm?kind=&bestyn=&newyn=y&sort=recently&sub=y&idx=0">신제품</a></li>
       <li><a href="mobileProductForm?kind=한식&bestyn=&newyn=&sort=recently&sub=y&idx=0">한식</a></li>
        <li><a href="mobileProductForm?kind=중식&bestyn=&newyn=&sort=recently&sub=y&idx=0">중식</a></li>
         <li><a href="mobileProductForm?kind=양식&bestyn=&newyn=&sort=recently&sub=y&idx=0">양식</a></li>
      <hr><br>
      <li><a href="mobileEventList">이벤트</a></li>
      <li><a href="mobileCompany">밀조 소개</a></li>
      <li><a href="mobileNmqnaForm">고객센터</a></li>
   </ul>
   </div>
   
</div>