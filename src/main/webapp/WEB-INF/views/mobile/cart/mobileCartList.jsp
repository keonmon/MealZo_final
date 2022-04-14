<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<div id=subpageContainer>
<div style="width:95%; height:120px; 
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">${loginUser.ID }&nbsp;님의 장바구니</b>
</div>
<form style="text-align:center;">

<!-- <div style="position: fixed; left: 0; right:0;  z-index: 1000; font-size: 16px;">
		<ul style="display: table; width:100%;">
			<li style="display: table-cell;text-align: center;vertical-align: middle; width: 42%;background-color: #6db800;color: #ffffff;line-height: 48px;">
				<ul style="display: table; width: 100%;  height: 50px;">
					<li style="display: table-cell; font-weight: 400;" >장바구니
</li></ul></li></ul></div> -->

<table id="cartTable" >
	<tr><th>상품명</th>
		<th>수량</th>
		<th>가격</th>
		<th>주문일</th>
		<th>삭제</th></tr>
	<c:forEach items="${cartList}" var="mcartVO">
				<tr><td><a href="productDetail?pseq=${mcartVO.PSEQ}" target="_blank" >
							 ${mcartVO.PNAME}</a></td><td> ${mcartVO.QUANTITY} </td>
						<td><fmt:formatNumber value="${mcartVO.PRICE2*mcartVO.QUANTITY}"	type="currency"/></td>
						<td><fmt:formatDate value="${mcartVO.INDATE}" type="date" /></td>
						<td><input type="checkbox" name="cseq" value="${mcartVO.CSEQ}" style="height:50px;width:50px;"></td></tr>
					</c:forEach>	
			<tr><th colspan="2"> 총 액 </th><th colspan="2">
       				<fmt:formatNumber value="${totalPrice}" type="currency" /></th>
       				<th><a href="#" onClick="go_cart_delete();">삭제하기</a></th></tr> 
			</table>

<div style="position: fixed;left: 0;  bottom: 0;  right: 0;z-index: 1002;font-size: 16px;">
			<ul style="display: table; width:100%;">
			<li style="display: table-cell;text-align: center;vertical-align: middle; width: 42%;background-color: #434343;color: #ffffff;/* line-height: 48px; */">
				<ul style="display: table; width: 100%;  height: 50px;">
					<li style="display: table-cell; font-weight: 400;">
						<fmt:formatNumber value="${totalPrice}" type="currency" />
			</li></ul></li>
					
			<li style="display: table-cell;"><input type="button" style="width: 100%;
			background-color: #6db800;color: #ffffff;border-radius:0;border: 0; 
			height: 50px;font-weight: 400;" class="submit" value="주문하기"
			onclick="go_order_insert();"></li>
				</ul>
			</div>
		</table>
	</form>
<%@ include file="../include/headerfooter/mobileFooter.jsp" %>