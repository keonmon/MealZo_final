<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="include/sidemenu/sidemenu.jsp"%>

<style type="text/css">
	/* #remote ul{list-style: none; padding:0; margin: 0; display: inline-block; } 
	#remote ul li{float: left; width: 10px; height: 10px; background:beige; margin:18px 8px; border-radius:5px 5px 5px 5px; user-select: none;} */
	#remote ul li.active{
	  width:12px;
	  height:12px;
	  top:3px;
	  opacity:1;
	  box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
	}
	*{list-style:none;}
	#sliderWrap ul, #remote ul li{
	-webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	-moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	-o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	-ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	transition: all 0.3s cubic-bezier(1,.01,.32,1);	
}

</style>
<div class="clear"></div>

<div id="index"  class='stop-dragging' style="margin-bottom:30px; margin-top:100px;" >
<!-- <script type="text/javascript">
	$(function(){
		startInterval();
	})
</script> -->
	<!-- 이벤트 슬라이더 
	<div id="">
	<div class="slide_event">
		<div id="sliderWrap">
		<ul id="images">
			<c:forEach items="${bannerList}" var="bannerList">
				<li><a href="${bannerList.URL }"><img src="images/${bannerList.IMAGE }"></a></li>
			</c:forEach>
		</ul>
		<div id="buttonL" class="material-icons">arrow_back_ios_new</div>
		<div id="buttonR" class="material-icons" >arrow_forward_ios_new</div>
		<div id="remote" style="display:block;">
			<ul>
			</ul>
		</div>
		</div>
	</div>
	</div>
	<div class="clear"></div>
	-->
	
	<!-- 신메뉴 슬라이더 -->
	<div id="slide_product">
		<div id="index_catalog_topper">
			<span id="name">
				<a href="mobileProductForm?kind=&bestyn=&newyn=y&sort=recently&sub=y&idx=0">신상품</a>
			</span>
		</div>
		<div>
			<span id="arw_l" class="material-icons" onclick="nProduct_move(-1,1)">arrow_back_ios</span>
			<span id="arw_r" class="material-icons" onclick="nProduct_move(1,1)">arrow_forward_ios</span>
			
			<div id="overflow" class="slider_p">
			<div id="wrap_box1" class="wrap_box">
				<c:forEach items="${newList}" var="mproductVO">
					<div id="product_wrap1">
						<div id="product_thum1">
							<a href="mobileProductDetail?pseq=${mproductVO.PSEQ}">
								<img src="images/${mproductVO.IMAGE}">
							</a>
						</div>
						<div id="product_cont1">
							<a id="name" href="mobileProductDetail?pseq=${mproductVO.PSEQ}">${mproductVO.NAME }</a><br>
							<a id="price"href="mobileProductDetail?pseq=${mproductVO.PSEQ}"> <fmt:formatNumber value="${mproductVO.PRICE2}" pattern="###,###,###"/>원</a> <br>
							<a id="content"href="mobileProductDetail?pseq=${mproductVO.PSEQ}">${mproductVO.CONTENT}</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</div>
	
	<!-- 베스트 슬라이더 -->
	
	<div id="slide_product">
		<div id="index_catalog_topper">
			<span id="name">
				<a href="mobileProductForm?kind=&bestyn=y&newyn=&sort=recently&sub=y&idx=0">베스트 상품</a>
			</span>
		</div>
		<div>
			<div class="arw">
				<span id="arw_l" class="material-icons" onclick="bProduct_move(-1,2)">arrow_back_ios</span>
				<span id="arw_r" class="material-icons" onclick="bProduct_move(1,2)">arrow_forward_ios</span>
			</div>
			<div id="overflow">
			<div id="wrap_box2" class="wrap_box">
				<c:forEach items="${bestList}" var="mproductVO">
					<div id="product_wrap1" >
						<div id="product_thum1">
							<a href="mobileProductDetail?pseq=${mproductVO.PSEQ }">
								<img src="images/${mproductVO.IMAGE}">
							</a>
						</div>
						<div id="product_cont1">
							<a id="name" href="mobileProductDetail?pseq=${mproductVO.PSEQ }">${mproductVO.NAME }</a><br>
							<a id="price"href="mobileProductDetail?pseq=${mproductVO.PSEQ}"> <fmt:formatNumber value="${mproductVO.PRICE2}" pattern="###,###,###"/>원</a> <br>
							<a id="content"href="mobileProductDetail?pseq=${mproductVO.PSEQ}">${mproductVO.CONTENT}</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</div>
 
	<!-- 정기구독 메뉴 슬라이더 -->
	<!-- 
	<div id="slide_product">
		<div id="index_catalog_topper">
			<span id="name">
				정기구독
			</span>
			<a href="meal.do?command=subscribeForm">전체보기</a>
		</div>
		<div>
			<div class="arw">
				<span id="arw_l" class="material-icons" onclick="product_move(-1,3)">arrow_back_ios</span>
				<span id="arw_r" class="material-icons" onclick="product_move(1,3)">arrow_forward_ios</span>
			</div>
			<div id="overflow">
				<div id="wrap_box3" class="wrap_box">
					<%-- <c:forEach items="${subscribeList}" var="mproductVO"> --%>
						<div id="product_wrap1">
							<div id="product_thum1">
								<a href="meal.do?command=productDetail&pseq=${mproductVO.pseq }">
									<img src="images/h_1_thum.jpg${mproductVO.image}">
								</a>
							</div>
							<div id="product_cont1">
								<a id="name" href="meal.do?command=productDetail&pseq=${mproductVO.pseq }">닭고기${mproductVO.name }</a><br>
								<a id="price"> <fmt:formatNumber value="${mproductVO.price2}" pattern="###,###,###"/>원 </a><br>
								닭닭디라라${mproductVO.content}
							</div>
						</div>
					<%-- </c:forEach> --%>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	-->

<%@ include file="include/headerfooter/mobileFooter.jsp"%>

