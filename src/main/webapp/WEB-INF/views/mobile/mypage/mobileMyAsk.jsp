<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>

<article id="zzim2" style="width:900px; max-width:900px; margin-top: 219px; margin-bottom: 20%";>
<div style="width:891px; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">나의 상품문의 보기</b></div>

<form>
<table id="asktable" style="text-align:center; width: 100%;" >
<tr    style="font-size:2.3em; height:140px; background-color:#ededed;"><th width="100px">등록일</th><th style="width:230px;" >문의상품</th><th>제목</th><th style="width: 165px;">답변유무</th></tr>
	<c:forEach items="${myAskList}" var="myAskVO">
<input type="hidden" value="${zzimVO.ZSEQ}">
<tr ><td style="font-size:2.0em;"><fmt:formatDate value="${myAskVO.INDATE_A}" type="date" pattern="YY.MM.dd"/></td>
<td ><a href="mobileProductDetail?pseq=${myAskVO.PSEQ}" style="color:black; font-weight:bold;">
<img src="images/${myAskVO.IMAGE}" width="200px" style="float:left;"/>
</a>
			<td><a href="mobileAskDetail?aseq=${myAskVO.ASEQ}" style="color:black; font-size:2.3em; font-weight:bold;">
			 ${myAskVO.TITLE} 
			</a>
		</td>
 
<td style="font-size:2.0em; font-weight:bold;">
			<c:choose>
				<c:when test="${myAskVO.INDATE_R== null}">
					미답변
				</c:when>
				<c:otherwise>
					답변 완료
				</c:otherwise>
			</c:choose>
		</td>
	</c:forEach>
</table>

	<div class="clear" ></div>
	<div id="paggingg">
<jsp:include page="../../include/paging/paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
    <jsp:param value="mobileAskForm" name="command"/>
</jsp:include>
</div>
</form>
</article>

 <%@ include file="../include/headerfooter/mobileFooter.jsp"%>