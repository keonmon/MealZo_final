<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ include file="../include/user/headerfooter/header.jsp" %>
 <article id="e">
<div class="kind">ė ė˛´ėíđ</div>
<div id="top_menu" >
<script>
$(document).ready(function (){
	var num = '${idx}';
	$('#top_menu a').removeClass('active');
	$('#top_menu a').eq(num).addClass('active');
	}	);
</script>
<ul>
	<li><a href="productAllForm?sort=recently&sub=y&idx=0&key=${key }">ėĩęˇŧëąëĄė</a></li>
	<li><a href="productAllForm?sort=low_price&sub=y&idx=1&key=${key }">ę°ę˛ŠëŽėė</a></li>
	<li><a href="productAllForm?sort=high_price&sub=y&idx=2&key=${key }">ę°ę˛Šëėė</a></li>
</ul>
</div>

 <!--ė ė˛´ėí   -->
	<div id="allmenu">
		<div class="allmenus" id="allmenu1">
			<c:forEach items="${mproductVoList}" var="mproductVO">
				<div id="item">
					<a href="productDetail?pseq=${mproductVO.PSEQ}">
						<img src="images/${mproductVO.IMAGE }" width="250px" height="280px" />
						<br>${mproductVO.NAME }
						<p><fmt:formatNumber value="${mproductVO.PRICE2}" pattern="###,###,###" />ė</p>
					</a>
				</div>
			</c:forEach>
		</div>

	</div>

	<div class="clear"></div>
<jsp:include page="../include/paging/productPaging.jsp">
	<jsp:param name="command" value="productAllForm?sort=${sort}&idx=${idx}" />	
</jsp:include>

  </article>
  
  
    <%@ include file="../include/user/headerfooter/footer.jsp" %>