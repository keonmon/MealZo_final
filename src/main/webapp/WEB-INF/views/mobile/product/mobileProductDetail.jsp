<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file ="../../mobile/include/headerfooter/mobileHeader.jsp"%>
<%@ include file ="../../mobile/include/sidemenu/sidemenu.jsp"%>


<script type="text/javascript">
	$(document).ready( function () {
		printName();
	});
	
	// ajax
	$(function(){
		$('#goCart').click(function(){
			//var formselect = $("#productForm")[0];	//지목된 폼을 변수에 저장
			//var formData = new FormData(formselect);
			
			//ajax : 웹페이지 새로고침이 필요없는 request(요청)
			// 문법 : $.ajax({ 객체 });
			$.ajax({
				url:"<%=request.getContextPath()%>/cartInsert",	//Controller로 매핑된 메서드를 호출
				type:"POST",
				data: {
					"pseq": $("#pseq").val(),
					"quantity": $("#quantity").val()
				},
				dataType: "json",
				
				success: function(data){
					// Controller에서 넘어온 data의 'STATUS 데이터가 1이면'
					if(data.STATUS === 1){
						//동적으로 div 태그 달아주기.
						$("#cartCnt").empty();
						$("#cartCnt").append(data.cnt);
						if(confirm('해당 상품이 장바구니에 추가되었습니다\n장바구니로 이동하시겠습니까?')){
							location.href="cartList";
						}
					}else{
						location.href="userLogin";
					}
				},
				error:function(){
					alert("실패");
				}
			});
		});
	});
</script>
    
<article  id="e10">
<form method="post" name="form1" id="productForm" >
   <input type="hidden" id="price2" name="price2" value="${mproductVO.PRICE2}">
 <div id="pdmainimg">
     		<img src="images/${mproductVO.IMAGE}" />
	</div>
	<br><br>
	
			<div  id="pay"  style="font-size:2.8em; font-weight:bold "> 
				${mproductVO.NAME }  </div>
				
		<div id="pay" style="font-size:3.3em; color:black; font-weight:bold">
			<fmt:formatNumber value="${mproductVO.PRICE2}"  pattern="###,###,###"/>원
			</div>
	<table >
			  	<tr style="font-size:20px; width:100px;" >
				  	<td >   
					<p> 수량 &nbsp; &nbsp; &nbsp;
					<input type="button" value=" + " onclick="add();"  style="font-size:20px; background:white;">
					<input type="text" id="quantity" name="quantity" id="quantity" onkeyup="printName()" size="2" value="1"  style="font-size:20px ; text-align:center;"> 
                   <input type="hidden" name="pseq" id="pseq" value="${mproductVO.PSEQ}">
                   <input type="button" value=" - " onclick="del();"  style="font-size:20px; background:white;"><br><br></p>
               </td>
            </tr>
              <tr><td><h2>총 상품금액</h2> </td><td><h3><div id="result" name="result" style=" font-size:25px;"></div></h3></td></tr>

		</table>
	
	  <input type="button" value="장바구니" class="submit2" id="goCart" >
	  <input type="button" value="바로구매" class="submit2" onClick="go_order();">
	  	</td></tr>
	</table>  
</form>


<script>
$(function (){ 
	$("#tabs2 li").click(function(){
		var num = $(this).index();
		$('#tabs2 li').removeClass('active');
		$('#tabs2 li').eq(num).addClass('active');
		
	});
})
</script>
<div id="tabs2">
	<ul>
		<li class="active">상품상세</li>
		<li>후기 
			<c:if test="${mproductVO.REPLYCNT>0}"> <!-- 0보다 크다면 갯수 표시 -->
				<span style = "color:#505050; font-weight:bold; ">[${mproductVO.REPLYCNT }]</span>
			</c:if>
		</li>
		<li>문의</li>
	</ul>
</div>



<div id = "content">
     <div class="contents" id="content1">  
       <div id="item1" >
       <c:forEach items="${mpdimg}" var="mproductVO" >
       <div id="contentimg"><img src="images/${mproductVO.IMAGE}" width="800px"/>
	  </div>
       </c:forEach>
       <c:forEach items="${mpdimg2}" var="mproductVO" >
	<div id="contentimg"><img src="images/${mproductVO.IMAGE}" width="800px" />
	</div> 
	</c:forEach>    
	 </div></div>
	 
	    <!-- 후기 등록 -->
	 <div class="contents" id="content2">
	 <form method="post" name="form2" >
<table id="review" style="width:800px; text-align:center;" >
	    <tr><th  style="width:100px;">리뷰날짜</th><th>상품평</th><th style="width:100px;">id</th></tr>
	     <c:forEach items="${mreview}" var="mreviewVO" >
	    <tr><td><fmt:formatDate value="${mreviewVO.INDATE}" type="date"/>
	     </td><td style="width:500px; word-break:break-all;">${mreviewVO.CONTENT}</td>
	  <td>${mreviewVO.ID}</td></tr>
	    </c:forEach>
	         </table>

				<c:if test="${ result==1 }">
					<div>
						<input type="button" value="리뷰쓰기" id="reviewb"	onclick="location.href='reviewWriteForm?pseq=${pseq}'">
					</div>
				</c:if>
				<c:if test="${ result==-1}">
				</c:if>

			</form>
	</div>
	
	 <!-- 문의 등록 -->
	 <div class="contents" id="content3">
	 <form method="post" name="form3">

	    <div id=aks2>
	    <input type="button" value="문의하기" class="ask" onclick="location.href='askWriteForm?pseq=${pseq}'">
</div>


	</form>
	</div>
       </div>
	      
    </article>
    <div class="clear"></div>