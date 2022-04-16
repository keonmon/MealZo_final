<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>

<article id="zzim2" style="width:900px; max-width:900px; margin-top: 219px; margin-bottom: 60%";>
<div style="width:888px; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">나의 상품후기</b></div>
<form>
<table id="zzimtable" style="text-align:center;" >
<tr    style="font-size:2.3em; height:140px; background-color:#ededed;"><th width="160px">등록일</th><th width="270px" >상품명</th>
<th colspan="2" style="  width: 500px;">후기 내용</th>
	<c:forEach items="${myReviewList }" var="reviewVO">
			<input type="hidden" value="${mrivewVO.ZSEQ}">
<tr style="height: 100px;" ><td style="font-size:2.0em;">
		<fmt:formatDate value="${reviewVO.INDATE}" type="date" pattern="YY.MM.dd"/></td>
	<td style="text-align:center;font-size:2.0em;"><a href="mobileProductDetail?pseq=${reviewVO.P_PSEQ}" style="color:black; font-weight:bold;">
				${reviewVO.NAME}</a></td>
<td style="font-wight:bold; font-size:2.0em">${reviewVO.CONTENT}
<td style="vertical-align: top;">
<span class="material-icons" style="font-size:1.5em; color:#828282;" onclick="deleteReview(${reviewVO.RSEQ})" >close</span></a></td></tr>
 

 


</c:forEach>

    </tr></table></form>
    
    
    </article>
    
    <%@ include file="../include/headerfooter/mobileFooter.jsp"%>