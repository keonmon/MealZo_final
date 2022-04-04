<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>
<%@ include file="../include/user/mypage_sidemenu.jsp" %>
<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2 id="cancelTitle">주문취소내역</h2>
<form>

<table id="cartList" style="text-align:center;"  width="100%">
	<tr><th>주문번호</th><th>상품명</th><th>가 격</th><th>주문일</th><th>취소상태</th></tr>
	<c:forEach items="${cancelList}" var="orderCancelVO">
	<tr>
		<td>${orderCancelVO.OSEQ}</td>
		<td><a href="orderCancelDetail?oseq=${orderCancelVO.OSEQ}" style="color:black; font-weight:bold;">
		${orderCancelVO.PNAME}</a></td>
    	<td><fmt:formatNumber value="${orderCancelVO.PRICE2*orderCancelVO.QUANTITY}" type="currency"/></td>      
    	<td><fmt:formatDate value="${orderCancelVO.INDATE}" type="date"/></td>
   		<td> 
 			<c:choose>
 				<c:when test="${orderCancelVO.RESULT=='4'}">주문취소</c:when>
 			</c:choose>
 		</td></tr>
	</c:forEach>
</table>
</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="orderList" />	
</jsp:include>

</article>
<%@ include file="../include/user/headerfooter/footer.jsp" %>