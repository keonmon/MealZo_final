<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp"%>

<article id="#product_wrap1" style="margin:10px auto; height:auto;">
<h2>${loginUser.ID }&nbsp;님의 장바구니</h2>
<form name="form4" method="post">
	<c:choose>
		<c:when test="${cartList.size() == 0}">
			<div style="width:100%; height:500px;">
				<h2 style="color:green; text-align:center; line-height:500px;">장바구니가 비었습니다🙊</h2>
			</div>
		</c:when>
		<c:otherwise>
		<table id="cartList" style="text-align:center;">
			<tr><th>상품명</th><th>수 량</th><th>가 격</th><th>주문일</th><th>삭 제</th></tr>
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
		<div id="buttons" style="text-align: center">
			
			<input type="button" value="계속 쇼핑" class="cancel"
					onclick="location.href='productAllForm?sort=recently&sub=y&idx=0'">
			<c:if test="${cartList.size() != 0}">
				<input type="button" value="주문하기" class="submit"
					onclick="go_order_insert();">
			</c:if>
		</div>
	</form>
</article>
<%@ include file="../include/user/headerfooter/footer.jsp"%>