<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>  
<%@ include file="../include/user/mypage_sidemenu.jsp" %>
<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2 id="cancelTitle">나의 찜한상품 보기</h2>

<br><br><br><br>
<from>
<table id="cartList" style="text-align:center;" >

<c:forEach items="${zzimList}" var="zzimVO">
<input type="hidden" value="${zzimVO.ZSEQ}">
<tr><td width="100px"><fmt:formatDate value="${zzimVO.INDATE}" type="date"/></td>
<td ><a href="productDetail?pseq=${zzimVO.PSEQ}" style="color:black; font-weight:bold;">
<img src="images/${zzimVO.IMAGE}" width="200px" style="float:left;"/>
</a></td>
<td width="180px" style="font-wight:bold;"><a href="productDetail?pseq=${zzimVO.PSEQ}" style="color:black; font-weight:bold; font-size:25px;">${zzimVO.NAME}</a>
<br><br><br>${zzimVO.PRICE2}<br>${zzimVO.KIND}</td></tr>


</c:forEach>
</table>





<jsp:include page="../include/paging/paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
    <jsp:param value="zzimList" name="command"/>
</jsp:include>

</from>
</article>
<%@ include file="../include/user/headerfooter/footer.jsp" %>