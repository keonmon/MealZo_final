<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<article id="#product_wrap1" style="margin:10px auto; height:auto;">
<h2>${loginUser.ID }&nbsp;님의 장바구니</h2>

<!-- <div style="position: fixed; left: 0; right:0;  z-index: 1000; font-size: 16px;">
		<ul style="display: table; width:100%;">
			<li style="display: table-cell;text-align: center;vertical-align: middle; width: 42%;background-color: #6db800;color: #ffffff;line-height: 48px;">
				<ul style="display: table; width: 100%;  height: 50px;">
					<li style="display: table-cell; font-weight: 400;" >장바구니
</li></ul></li></ul></div> -->

<form name="form4" method="post">
	<c:choose>
		<c:when test="${cartList.size() == 0}">
			<h3 style="color:green; text-align:center;">장바구니가 비었습니다</h3>
		</c:when>
		<c:otherwise>
		<table id="cartList" style="text-align:center;">
			<!-- <tr><th>상품명</th><th>수 량</th><th>가 격</th><th>주문일</th><th>삭 제</th></tr> -->
				<c:forEach items="${cartList}" var="mcartVO">
				<tr><td><a href="productDetail?pseq=${mcartVO.PSEQ}" target="_blank" >
							<h3> ${mcartVO.PNAME} </h3></a></td><td> ${mcartVO.QUANTITY} </td>
						<td><fmt:formatNumber value="${mcartVO.PRICE2*mcartVO.QUANTITY}"	type="currency"/></td>
						<td><fmt:formatDate value="${mcartVO.INDATE}" type="date" /></td>
						<td><input type="checkbox" name="cseq" value="${mcartVO.CSEQ}"></td></tr>
					</c:forEach>	
			<tr><th colspan="2"> 총 액 </th><th colspan="2">
       				<fmt:formatNumber value="${totalPrice}" type="currency" /></th>
       				<th><a href="#" onClick="go_cart_delete();"><h3>삭제하기</h3></a></th></tr> 
			</table>
		</c:otherwise>
	</c:choose>


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
</article>
