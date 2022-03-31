<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp"%>
<%@ include file="../include/user/mypage_sidemenu.jsp" %>
<article id="mypageArticle2" id="mypageArticle2" style="width:900px; max-width:900px;">
<h2>${loginUser.ID }&nbsp;님의 주문목록</h2>
<form style="text-align:center;">
<table id="cartList"  width="100%" >
	<tr><th>주문번호</th><th>상품명</th><th>수 량</th><th>가 격</th><th>주문일</th><th>진행상태</th></tr>
	<c:forEach items="${orderList}" var="morderVO">
		<tr>
		<td>${morderVO.OSEQ}</td>
		
		<td>
			<a href="orderListDetail?oseq=${morderVO.OSEQ}">
			${morderVO.PNAME}</a></td>
			<td> ${morderVO.QUANTITY}</td>
       		<td><fmt:formatNumber value="${morderVO.PRICE2*morderVO.QUANTITY}" type="currency"/></td>      
       		<td><fmt:formatDate value="${morderVO.INDATE}" type="date"/></td>
      		<td> 
      			<c:choose>
      				<c:when test="${morderVO.RESULT=='1'}">주문처리중</c:when>
      				<c:when test="${morderVO.RESULT=='2'}">배송중</c:when>
      				<c:when test="${morderVO.RESULT=='3'}">배송완료</c:when>
      			</c:choose>
      		</td></tr>
	</c:forEach>
</table>
</form>

<div class="clear"></div>
</article>
<%@ include file="../include/user/headerfooter/footer.jsp"%>