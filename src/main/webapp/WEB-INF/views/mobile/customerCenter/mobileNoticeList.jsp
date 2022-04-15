<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<article id="zzim2" style="width:900px; max-width:900px;     margin-bottom: 100%;">
<h2 class="kind">공지사항</h2>

<form>
<table id="zzimtable" style="text-align:center; margin:0 auto; " >
<tr    style="font-size:2.3em; height:140px; background-color:#ededed;"><th style="width: 20%;">번호</th>
<th style="width: 60%;" >제목</th><th style="width: 200px;">게시일</th>
	<c:forEach items="${noticeList }" var="noticeVO">
	
<tr style="height: 100px; font-size:2.0em;" ><td >
	<c:choose>
		<c:when test='${noticeVO.RESULT=="p"}'>
		   <span style="font-weight:bold; color:red">필독</span>
		   </c:when>
		   <c:otherwise>
		${noticeVO.NSEQ}
		</c:otherwise></c:choose></td>
	

	<td style="text-align:center; font-size:0.9em;" ><a href="mobileNoticeDetail?nseq=${noticeVO.NSEQ}" style="color:black; font-weight:bold;">
			${noticeVO.SUBJECT}</a></td>
<td style="font-size:1.0em;">

		<fmt:formatDate value="${noticeVO.INDATE}" type="date" pattern="YY.MM.dd"/></td></tr>
 
</c:forEach>

</table>

</form>

	<div class="clear"></div>
	<jsp:include page="../../include/paging/productPaging.jsp">
		<jsp:param name="command" value="noticeList" />	
	</jsp:include>

</article>



<%@ include file="../include/headerfooter/mobileFooter.jsp" %>