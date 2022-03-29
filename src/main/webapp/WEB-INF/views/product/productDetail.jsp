<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/user/headerfooter/header.jsp" %>
    
<script type="text/javascript">
	$(document).ready( function () {
		printName();
	});
</script>
    
    <article  id="e1">
<form method="post" name="form1">
	<table class="pdtable" >
  		<tr><td>
     		<img src="images/${mproductVO.image}" width="480px" height="490px"/>
		</td>
	<td>
		<table  style="heigh:320px; width:490px; margin-left:50px;">
			<tr style="font-size:20px;"><td> 
				<h2>${mproductVO.name }</h2> 
				   <input type="hidden" id="price2" value="${mproductVO.price2}">
			    <h2><fmt:formatNumber value="${mproductVO.price2}"  pattern="###,###,###"/>원</h2>
			</td></tr>	
				<tr><td></td></tr><tr><td></td></tr>
			  	<tr style="font-size:17px;">
				  	<td>   
						<p> 수량 &nbsp; &nbsp; &nbsp;<input type="text" id="quantity" name="quantity" onkeyup="printName()" size="2" value="1"> </p>
					    <input type="hidden" name="pseq" value="${mproductVO.pseq}"><br>
					</td>
				</tr>
			     <tr><td><h2>총 상품금액</h2> </td><td><h3><div id="result" style=" font-size:25px;"></div></h3></td></tr>
				
		</table>
	
	  <input type="button" value="장바구니" class="submit2" onClick="go_cart();">
	  	</td></tr>
	</table>  
</form>
<script>
$(function (){ 
	$("#tabs li").click(function(){
		var num = $(this).index();
		$('#tabs li').removeClass('active');
		$('#tabs li').eq(num).addClass('active');
		
	});
})
</script>
<div id="tabs">
	<ul>
		<li class="active">상품상세</li>
		<li>후기 
			<c:if test="${mproductVO.replycnt>0}"> <!-- 0보다 크다면 갯수 표시 -->
				<span style = "color:#505050; font-weight:bold; ">[${mproductVO.replycnt }]</span>
			</c:if>
		</li>
		<li>문의</li>
	</ul>
</div>



<div id = "content">
     <div class="contents" id="content1">  
       <div id="item1" >
       <c:forEach items="${mpdimg}" var="mproductVO" >
       <div id="contentimg"><img src="images/${mproductVO.image}" width="800px"/>
	  </div>
       </c:forEach>
       <c:forEach items="${mpdimg2}" var="mproductVO" >
	<div id="contentimg"><img src="images/${mproductVO.image}" width="800px" />
	</div> 
	</c:forEach>    
	 </div></div>
	 
	    <!-- 댓글 등록 -->
	 <div class="contents" id="content2">
	 <form method="post" name="form2">
<table id="review" style="width:800px; text-align:center;" >
	    <tr><th  style="width:100px;">리뷰날짜</th><th>상품평</th><th style="width:100px;">id</th></tr>
	     <c:forEach items="${mreview}" var="mreviewVO" >
	    <tr><td><fmt:formatDate value="${mreviewVO.indate}" type="date"/>
	     </td><td style="width:500px; word-break:break-all;">${mreviewVO.content}</td>
	  <td>${mreviewVO.id}</td></tr>
	    </c:forEach>
	         </table>
	        <div>
	    <input type="button" value="리뷰쓰기" id="reviewb"onclick="location.href='meal.do?command=reviewWriteForm&pseq=${pseq}'">
	</div>

	  
		</form>
	</div>
	
	 <!-- 문의 등록 -->
	 <div class="contents" id="content3">
	 <form method="post" name="form3">

	    <div id=aks2>
	    <input type="button" value="문의하기" class="ask" onclick="location.href='meal.do?command=askWriteForm&pseq=${pseq}'">
</div>


	</form>
	</div>
       </div>
	      
    </article>
    <div class="clear"></div>
   
   <%@ include file="../include/user/headerfooter/footer.jsp" %>