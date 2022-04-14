<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>

<article id="zzim2" style="width:900px; max-width:900px;">
<h2 id="cancelTitle">나의 찜한상품 보기</h2>

<br><br><br><br>
<form>
<table id="zzimtable" style="text-align:center;" >
<tr    style="font-size:2.3em; height:140px;"><th width="160px">번호</th><th colspan="2">상품이름</th>
<c:forEach items="${zzimList}" var="zzimVO">
<input type="hidden" value="${zzimVO.ZSEQ}">
<tr ><td style="font-size:2.0em;"><fmt:formatDate value="${zzimVO.INDATE}" type="date" pattern="YY.MM.dd"/></td>
<td ><a href="mobileProductDetail?pseq=${zzimVO.PSEQ}" style="color:black; font-weight:bold;">
<img src="images/${zzimVO.IMAGE}" width="200px" style="float:left;"/>
</a></td>
<td style="font-wight:bold; width:271px;"><a href="productDetail?pseq=${zzimVO.PSEQ}" style="color:black; font-weight:bold; font-size:2.0em;">${zzimVO.NAME}</a>
<br><br><p style="font-size:1.8em; font-weight:bold; width:295px;">${zzimVO.PRICE2}<br>${zzimVO.KIND}</p></td>
<td style="vertical-align: top;"><a href="mobiledeleteZzim?pseq=${zzimVO.PSEQ}">
<span class="material-icons" style="font-size:2.8em; color:#828282;" >close</span></a></td></tr>
 


</c:forEach>


</table>

<jsp:include page="../../include/paging/paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
    <jsp:param value="zzimList" name="command"/>
</jsp:include>
</form>
</article>

