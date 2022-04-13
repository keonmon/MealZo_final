<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<div id="e">

<div class="kind">전체상품</div>

<script>
$(document).ready(function (){
	var num = '${idx}';
	$('#top_menu a').removeClass('active');
	$('#top_menu a').eq(num).addClass('active');
	}	);
</script>
<div id="top_menu" style="width:100%; margin:0 auto;">
<ul>
<li><a href="mobileProductAllForm?sort=recently&sub=y&idx=0">최근등록순</a></li>
	<li><a href="mobileProductAllForm?sort=low_price&sub=y&idx=1">가격낮은순</a></li>
	<li><a href="mobileProductAllForm?sort=high_price&sub=y&idx=2">가격높은순</a></li>
</ul>
</div>

<!-- 전체 상품 -->
<div id="allmenu">
		<div class="allmenus" id="allmenu1">
			<c:forEach items="${mproductVoList}" var="mproductVO">
				<div id="item3">
					
					<ul>
				<li><a href="mobileProductDetail?pseq=${mproductVO.PSEQ}"><img src="images/${mproductVO.IMAGE}" />
	               <br>  ${mproductVO.NAME }
				<br><fmt:formatNumber value="${mproductVO.PRICE2}" pattern="###,###,###"  />원</a></li>
				
					</ul>	
					
				</div>
			</c:forEach>
		</div>

	</div>

	<div class="clear"></div>
	<div id="paggingg">
<jsp:include page="../../include/paging/productPaging.jsp">
	<jsp:param name="command" value="mobileProductAllForm?sort=${sort}&idx=${idx}" />	
</jsp:include></div>
</div>
