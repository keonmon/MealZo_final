<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="include/user/headerfooter/header.jsp"%>

<div class="clear"></div>

<div id="index" style="margin-bottom:30px">
<script type="text/javascript">
	$(function(){
		startInterval();
	})
</script>
	<!-- 이벤트 슬라이더 -->
	<div class="slide_event">
		<div id="images">
			<a href="productForm?kind=한식&bestyn=&newyn=&sort=recently&sub=y&idx=0"><img src="images/main1.jpg" id="ev1"></a> 
			<a href="productForm?kind=&bestyn=y&newyn=&sort=recently&sub=y&idx=0"><img src="images/main2.jpg" id="ev2"></a> 
			<a href="productAllForm?sort=recently&sub=y&idx=0"><img src="images/main3.jpg" id="ev3"></a>
			<a href="#"><img src="images/main4.jpg" id="ev4"></a>
			<a href="eventDetail?eseq=1"><img src="images/main5.jpg" id="ev5"></a>
			<a href="productDetail?pseq=89"><img src="images/main6.jpg" id="ev6"></a>
			<a href="productDetail?pseq=38"><img src="images/main7.jpg" id="ev7"></a>
			<a href="productDetail?pseq=4"><img src="images/main8.jpg" id="ev8"></a>
<div class="clear"></div>
		</div>
	</div>

	<!-- 신메뉴 슬라이더 -->
	<div id="slide_product">
		<div id="index_catalog_topper">
			<span id="name">
				신메뉴!
			</span>
			<a href="productForm?kind=&bestyn=&newyn=y&sort=recently&sub=y&idx=0">전체보기</a>
		</div>
		<div>
			<div class="arw">
				<span id="arw_l" class="material-icons" onclick="nProduct_move(-1,1)">arrow_back_ios</span>
				<span id="arw_r" class="material-icons" onclick="nProduct_move(1,1)">arrow_forward_ios</span>
			</div>
			<div id="overflow">
				<div id="wrap_box1" class="wrap_box">
					<c:forEach items="${newList}" var="mproductVO">
						<div id="product_wrap1">
							<div id="product_thum1">
								<a href="productDetail?pseq=${mproductVO.PSEQ}">
									<img src="images/${mproductVO.IMAGE}">
								</a>
							</div>
							<div id="product_cont1">
								<a id="name" href="productDetail?pseq=${mproductVO.PSEQ}">닭고기${mproductVO.NAME }</a><br>
								<a id="price"> <fmt:formatNumber value="${mproductVO.PRICE2}" pattern="###,###,###"/>원</a> <br>
								${mproductVO.CONTENT}
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
				베스트
			</span>
			<a href="productForm?kind=&bestyn=y&newyn=&sort=recently&sub=y&idx=0">전체보기</a>
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
								<a href="productDetail?pseq=${mproductVO.PSEQ }">
									<img src="images/${mproductVO.IMAGE}">
								</a>
							</div>
							<div id="product_cont1">
								<a id="name" href="productDetail?pseq=${mproductVO.PSEQ }">${mproductVO.NAME }</a><br>
								<a id="price"> <fmt:formatNumber value="${mproductVO.PRICE2}" pattern="###,###,###"/>원</a> <br>
								${mproductVO.CONTENT}
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
</div>

<%@ include file="include/user/headerfooter/footer.jsp"%>