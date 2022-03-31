<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>  

<%@ include file="../include/user/mypage_sidemenu.jsp" %>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2 id="cancelTitle">나의 상품후기</h2>
<form method="post" name="form1">
<div style="width:900px;">
<table id="cartList"  width="100%">
	<tr><th>등록일</th><th>상품명</th><th>후기 내용</th><th>후기 삭제</th></tr>
	<c:forEach items="${myReviewList }" var="reviewVO">
		<tr>
			<td style="text-align:center;"><fmt:formatDate value="${reviewVO.INDATE}" type="both"/></td>
			<td style="text-align:center;"><a href="productDetail?pseq=${reviewVO.P_PSEQ}" style="color:black; font-weight:bold;">
				${reviewVO.NAME}</a></td>
			<td style="width:900px; word-break:break-all">${reviewVO.CONTENT}</td>
	    	<td style="text-align:center;"><input type="button" value="후기 삭제" onclick="deleteReview(${reviewVO.RESQ})"></td>
	   	</tr>
	</c:forEach>
</table>
</div>
</form>



</article>


<%@ include file="../include/user/headerfooter/footer.jsp" %>