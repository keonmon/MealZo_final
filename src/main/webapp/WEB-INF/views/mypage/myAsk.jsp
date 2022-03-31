<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>  

<%@ include file="../include/user/mypage_sidemenu.jsp" %>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2 id="cancelTitle">나의 상품문의</h2>
<form>


<table id="cartList" style="text-align:center;" width="100%">
	<tr><th>등록일</th><th>문의상품</th><th>제목</th><th>답변유무</th></tr>
	<c:forEach items="${myAskList}" var="myAskVO">
	<tr>
		<td><fmt:formatDate value="${myAskVO.INDATE_A}" type="both"/></td>
		<td>
			<a href="productDetail?pseq=${myAskVO.PSEQ}" style="color:black; font-weight:bold;">
				<img src="images/${myAskVO.IMAGE}" width="50px" style="float:left;"/><p> ${myAskVO.PNAME } </p>
			</a>
		</td>
    	<td>
			<a href="askDetail?aseq=${myAskVO.ASEQ}" style="color:black; font-weight:bold;">
				<p> ${myAskVO.TITLE} </p>
			</a>
		</td>
    	<td>
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
<br>
<jsp:include page="../include/paging/paging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
    <jsp:param value="askForm" name="command"/>
</jsp:include>

</form>

</article>


<%@ include file="../include/user/headerfooter/footer.jsp" %>