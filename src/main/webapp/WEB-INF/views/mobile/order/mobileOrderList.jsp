<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<div id=subpageContainer>
<div style="width:95%; height:120px; 
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">${loginUser.ID }&nbsp;님의 주문목록💗</b>
</div>
<form style="text-align:center;">
<table id="orderTable"  >
	<tr><th >주문<br>번호</th>
		<th>상품명</th>
		<th>수량</th>
		<th>가격</th>
		<th width:>주문일</th>
		<th>상태</th></tr>
	<c:forEach items="${orderList}" var="morderVO">
		<tr>
		<td><b>${morderVO.OSEQ}</b></td>
		
		<td><a href="mobileOrderDetail?oseq=${morderVO.OSEQ}">
			${morderVO.PNAME}</a></td>
			<%-- <td><a href="productDetail?pseq=${morderVO.PSEQ}" target="_blank">
				<h3> ${morderVO.PNAME} </h3></a></td> --%>
			<td> ${morderVO.QUANTITY}</td>
       		<td><fmt:formatNumber value="${morderVO.PRICE2*morderVO.QUANTITY}" type="currency"/></td>      
       		<td><fmt:formatDate value="${morderVO.INDATE}" type="date"/></td>
      		<td> 
      			<c:choose>
      				<c:when test="${morderVO.RESULT=='1'}">주문<br>처리중</c:when>
      				<c:when test="${morderVO.RESULT=='2'}">배송중</c:when>
      				<c:when test="${morderVO.RESULT=='3'}">배송<br>완료</c:when>
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
	<jsp:param value="orderList" name="command" />
</jsp:include> --%>
</div>
<div id="botFlyingContainer" >
	<div id="botBtn" style=" 
		background-color:teal; color:white; font-size:3em; font-weight:bold;"
		onclick="location.href='mobileMain'">
		홈으로 이동
	</div><div id="botBtn"
	style=" background-color:beige; font-size:3em; font-weight:bold;"
	onclick="location.href='mobileMypageForm'">
		마이페이지로 이동
	</div>
</div>
<%@ include file="../include/headerfooter/mobileFooter.jsp" %>