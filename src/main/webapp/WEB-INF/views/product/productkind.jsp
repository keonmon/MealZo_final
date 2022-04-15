<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ include file="../include/user/headerfooter/header.jsp" %>
  
 <article id="e">
<c:choose>
	<c:when test="${bestyn == 'y'}">
		<div class="kind">✨●'◡'●베스트 상품✨</div>
	</c:when>
	<c:when test="${newyn == 'y'}">
		<div class="kind">🙌새로 나왔어요! 🙌</div>
	</c:when>
	<c:otherwise>
		<div class="kind">${kind}</div>
	</c:otherwise>
</c:choose>

<script>
	$(document).ready(function (){
		var num = '${idx}';
		$('#top_menu li').removeClass('active');
		$('#top_menu li').eq(num).addClass('active');
	});
</script>

<div id="top_menu" >
<ul id="sortMenu">
	<a href="productForm?kind=${kind}&bestyn=${bestyn}&newyn=${newyn}&sort=recently&sub=y&idx=0"><li>최근등록순</li></a>
	<a href="productForm?kind=${kind}&bestyn=${bestyn}&newyn=${newyn}&sort=low_price&sub=y&idx=1"><li>가격낮은순</li></a>
	<a href="productForm?kind=${kind}&bestyn=${bestyn}&newyn=${newyn}&sort=high_price&sub=y&idx=2"><li>가격높은순</li></a>
</ul>


</div>
<!-- 한식 중식 양식  -->
<div id="mainmenu">
	<div class="mainmenus" id="mainmenu1">
		<c:forEach items="${mproductVoList}" var="mproductVO" varStatus="status">
			<div id="item">
				<a href="productDetail?pseq=${mproductVO.PSEQ}">
					<img src="images/${mproductVO.IMAGE }" width="250px" height="280px" />
					 <br>
					${mproductVO.NAME }
					<p><fmt:formatNumber value="${mproductVO.PRICE2}" pattern="###,###,###" />원</p>
				</a>
			</div>
		</c:forEach>
	</div>
</div>

<div class="clear"></div>
<jsp:include page="../include/paging/productPaging.jsp">
	<jsp:param name="command" value="productForm?kind=${kind}&bestyn=${bestyn}&newyn=${newyn}&sort=${sort}&idx=${idx}" />	
</jsp:include>  
  

</article>



    <%@ include file="../include/user/headerfooter/footer.jsp" %>