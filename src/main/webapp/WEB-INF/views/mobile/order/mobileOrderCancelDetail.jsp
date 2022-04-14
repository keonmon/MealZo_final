<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<div id=subpageContainer>
<div style="width:95%; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">주문/배송 상세내역 - 주문번호 : ${OSEQ}</b>
</div>

<form name="frm" method="post" style="text-align:center;">
<table id="orderTable">
	<tr><th>상품명</th><th>수 량</th><th>가 격</th><th>주문일</th><th>진행상태</th></tr>
	<c:forEach items="${orderList}" var="morderVO">
		<tr><td>
			<a href="mobileProductDetail?pseq=${morderVO.PSEQ}">
			<h3>${morderVO.PNAME}</h3></a></td>
			<td> ${morderVO.QUANTITY}</td>
       		<td><fmt:formatNumber value="${morderVO.PRICE2*morderVO.QUANTITY}" type="currency"/></td>      
       		<td><fmt:formatDate value="${morderVO.INDATE}" type="date"/></td>
      		<td> 
      			<c:choose>
      				<c:when test='${morderVO.RESULT=="4"}'>
      					주문 취소됨
      				</c:when>
      				<c:otherwise>
		      			주문 처리중 
      				</c:otherwise>
      			</c:choose>
      		</td></tr>
	</c:forEach>
	<tr><th colspan="2"> 총 액 </th>
       	<th colspan="2"><fmt:formatNumber value="${totalPrice}" type="currency"/></th>
       	<th> </th></tr> 	
</table>
</form>
</div>
<div id="botFlyingContainer" >
	<div id="botBtn" style=" 
		background-color:#434343; color:white; font-size:3em; font-weight:bold;"
		onclick="location.href='mobileMypageForm'">
		마이페이지로 이동
	</div><div id="botBtn"
	style=" background-color:#6db800; color:white; font-size:3em; font-weight:bold;"
	onclick="location.href='mobileOrderList'">
		주문 목록으로 이동
	</div>
</div>
<div id="botFlyingContainer" >
	<div id="botBtn" style=" 
		background-color:#434343; color:white; font-size:3em; font-weight:bold;"
		onclick="location.href='mobileMypageForm'">
		마이페이지로 이동
	</div><div id="botBtn"
	style=" background-color:#6db800; color:white; font-size:3em; font-weight:bold;"
	onclick="location.href='mobileOrderList'">
		주문 목록으로 이동
	</div>
</div>
<%@ include file="../include/headerfooter/mobileFooter.jsp" %>