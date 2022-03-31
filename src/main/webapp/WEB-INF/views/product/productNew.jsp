<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@ include file="../include/user/headerfooter/header.jsp" %>
 <article id="e">
<div class="kind">신제품</div>
<div id="top_menu" >
<ul>
<li >최근등록순</li>
<li >가격낮은순</li>
 <li>가격높은순</li>
</ul>
</div>

<!-- new 상품 -->
   <div id = "newmenu">
  <div class="newmenus" id="newmenu1">  
<c:forEach items="${newList}" var="mproductVO" >
<div id="item">
<a href="meal.do?command=productDetail&pseq=${mproductVO.pseq}"><img src="images/${mproductVO.image}"  width="250px" height="280px"/></a><br>
<a href="meal.do?command=productDetail&pseq=${mproductVO.pseq}">${mproductVO.name}</a>
<p><fmt:formatNumber value="${mproductVO.price2}" pattern="###,###,###"/>원 </p>
</div>
</c:forEach>
</div>


  <div class="newmenus" id="newmenu2">  
<c:forEach items="${newlow}" var="mproductVO" >
<div id="item">
<a href="meal.do?command=productDetail&pseq=${mproductVO.pseq}"><img src="images/${mproductVO.image}" width="250px" height="280px"/></a><br>
<a href="meal.do?command=productDetail&pseq=${mproductVO.pseq}">${mproductVO.name}</a>
<p><fmt:formatNumber value="${mproductVO.price2}" pattern="###,###,###"/>원 </p>
</div>
</c:forEach>
</div>

  <div class="newmenus" id="newmenu3">  
<c:forEach items="${newhight}" var="mproductVO">
<div id="item">
<a href="meal.do?command=productDetail&pseq=${mproductVO.pseq}"><img src="images/${mproductVO.image}" width="250px" height="280px"/></a><br>
<a href="meal.do?command=productDetail&pseq=${mproductVO.pseq}">${mproductVO.name}</a>
<p><fmt:formatNumber value="${mproductVO.price2}" pattern="###,###,###"/>원 </p>
</div>
</c:forEach>
</div>

</div>
  </article>
  
<%@ include file="../include/user/headerfooter/footer.jsp" %>