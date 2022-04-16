<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>  

<%@ include file="../include/user/customerCenter_sidemenu.jsp" %>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2 id="cancelTitle">공지사항</h2>
<form>

<table id="cartList" style="text-align:center;"  width="100%">
	<tr><th>번호</th><th >제목</th><th>게시일</th></tr>
	<c:forEach items="${noticeList }" var="noticeVO">
	<tr>
		<td width="20px">
		<c:choose>
		<c:when test='${noticeVO.RESULT=="p"}'>
		   <span style="font-weight:bold; color:red">필독</span>
		   </c:when>
		   <c:otherwise>
		${noticeVO.NSEQ}
		</c:otherwise></c:choose></td>
		<td width="500px"><a href="noticeDetail?nseq=${noticeVO.NSEQ}" style="color:black; font-weight:bold;">
		${noticeVO.SUBJECT}</a></td>
    	<td width="20px"><fmt:formatDate value="${noticeVO.INDATE}" type="date"/></td>
   		</tr>
	</c:forEach>
</table>




</form>

	<div class="clear"></div>
	<jsp:include page="../include/paging/paging.jsp">
		<jsp:param name="command" value="noticeList" />	
	</jsp:include>

</article>



<%@ include file="../include/user/headerfooter/footer.jsp" %> 