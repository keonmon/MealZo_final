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
	<input type="hidden" name="oseq" value="${OSEQ }" >
	<table id="orderTable">
		<tr><th>상품명</th><th>수량</th><th>가격</th><th>주문일</th><th>상태</th><th>취소</th></tr>
		<c:forEach items="${orderList}" var="morderVO">
			<tr><td>
				<a href="mobileProductDetail?pseq=${morderVO.PSEQ}">
				<h3>${morderVO.PNAME}</h3></a></td>
				<td> ${morderVO.QUANTITY}</td>
	       		<td><b><fmt:formatNumber value="${morderVO.PRICE2*morderVO.QUANTITY}" type="currency"/></b></td>      
	       		<td><fmt:formatDate value="${morderVO.INDATE}" pattern="YY.MM.dd" type="date"/></td>
	      		<td> 
	      			<c:choose>
	      				<c:when test='${morderVO.RESULT=="1"}'>
	      					주문<br>처리중
	      				</c:when>
	      				<c:when test='${morderVO.RESULT=="2"}'>
	      					배송중
	      				</c:when>
	      				<c:when test='${morderVO.RESULT=="3"}'>
	      					배송<br>완료
	      				</c:when>
	      				<c:otherwise>
			      			주문<br>취소
	      				</c:otherwise>
	      			</c:choose>
	      		</td>
	      		<td>
	      			<c:choose>
	      				<c:when test='${morderVO.RESULT=="4" }'>
		      					<input type="checkbox" name="orderCancel" checked="checked" disabled="disabled"
		      						style="width:50px; height:50px;">
	      				</c:when>
		      			<c:otherwise>
	      						<input type="checkbox" name="orderCancel" value="${morderVO.ODSEQ }"
	      							style="width:50px; height:50px;">
		      			</c:otherwise>
	      			</c:choose>
	      		</td></tr>
		</c:forEach>
		<tr><th colspan="2" > <b style="font-size:1em;">총 액</b> </th>
	       	<td colspan="2"><fmt:formatNumber value="${totalPrice}" type="currency"/></td>
	       	<th colspan="2">
	       		<div onclick="go_cancel()" style="font-size:1.2em; background-color:#6db800; 
	       			color:white; width:100%; height:100%; line-height: 140px;">
	       			주문취소
	       		</div>
			</th>
	  	</tr>
	</table>
	</form>
<!-- 배송중인 상품 주문 취소시 메시지 표시 -->
<c:choose>
	<c:when test="${!empty message}">
		<div id="message" 
			style=" 
			width: 100%;
		    margin: 0 auto;
		    text-align: center;
		    background-color: green;
		    height: 135px;
		    color: white;
		    font-size: 2em;
		    line-height: 135px;">
			${message }
		</div>
	</c:when>
</c:choose><!-- 메시지 끝 -->

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