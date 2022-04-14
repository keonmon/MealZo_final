<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>

<article id="zzim2" style="width:900px; max-width:900px;">

    <div class="kind">나의 상품후기</div>

<br><br><br><br>
<form>
<table id="zzimtable" style="text-align:center;" >
<tr    style="font-size:2.3em; height:140px; background-color:#ededed;"><th width="160px">등록일</th><th colspan="3">상품평</th><th>후기 내용</th><th>후기삭제</th>
	<c:forEach items="${myReviewList }" var="reviewVO"><input type="hidden" value="${zzimVO.ZSEQ}">
<tr ><td style="font-size:2.0em;"><fmt:formatDate value="${zzimVO.INDATE}" type="date" pattern="YY.MM.dd"/></td>
<td >${reviewVO.NAME } </td>
<td style="font-wight:bold; font-size:2.0em">${reviewVO.CONTENT}
<span class="material-icons" style="font-size:2.8em; color:#828282;" >close</span></a></td></tr>
 


</c:forEach>

    </tr></table></form>
    
    
    </article>
    
    <%@ include file="../include/headerfooter/mobileFooter.jsp"%>