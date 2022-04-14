<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>sp" %>


<div id=subpageContainer>
<div style="width:95%; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">주문취소내역</b>
</div>

<form style="text-align:center;">

<table id="orderTable" >
	<tr>
		<th>주문번호</th>
		<th>상품명</th>
		<th>가 격</th>
		<th>주문일</th>
		<th>취소상태</th>
	</tr>
	<c:forEach items="${cancelList}" var="orderCancelVO">
	<tr>
		<td><b>${orderCancelVO.OSEQ}</b></td>
		<td><a href="mobileOrderCancelDetail?oseq=${orderCancelVO.OSEQ}" style="color:black; font-weight:bold;">
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
<%-- <jsp:include page="../include/paging/paging.jsp">
	<jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	<jsp:param name="command" value="orderListForm" />
</jsp:include> --%>
</div>
<div id="botFlyingContainer" >
	<div id="botBtn" style=" 
		background-color:#434343; color:white; font-size:3em; font-weight:bold;"
		onclick="location.href='mobileMain'">
		홈으로 이동
	</div><div id="botBtn"
	style=" background-color:#6db800; color:white; font-size:3em; font-weight:bold;"
	onclick="location.href='mobileMypageForm'">
		마이페이지로 이동
	</div>
</div>

<%@ include file="../include/headerfooter/mobileFooter.jsp" %>