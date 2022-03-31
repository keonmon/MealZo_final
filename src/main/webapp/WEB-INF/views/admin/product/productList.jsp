<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1 align="left">상품 관리</h1>
<form name="frm" method="post" >
	<table>
		<tr><td width="642">상품명<input type="text" name="key" value="${key }">
			<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search('adminProductList');">
			<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total('adminProductList');">
			<input class="btn" type="button" name="btn_write" value="상품등록" onclick="go_wrt_Product();"></td>
		</tr>
	</table>
</form>

<form>
<table id="tableContainer" style="text-align:center;" width="85%">
	<tr><th width="50px">번호</th>
		<th width="200px">상품명</th>
		<th width="70px">원가</th>
		<th width="70px">판매가</th>
		<th width="85px">등록일</th>
		<th width="50px">공개유무</th></tr>
	<c:forEach items="${mproductList}" var="mproductVO">
	<tr><td height="23" align="center">${mproductVO.PSEQ}</td>
		<td style="text-align:left; padding=left:50px;">
			<a href="#" onclick="go_Update('${mproductVO.PSEQ}')">${mproductVO.NAME }</a></td>
		<td><fmt:formatNumber value="${mproductVO.PRICE1 }"/>원</td>
		<td><fmt:formatNumber value="${mproductVO.PRICE2 }"/>원</td>
		<td><fmt:formatDate value="${mproductVO.INDATE }"/></td>
		<td><c:choose>
			<c:when test='${mproductVO.USEYN == "y" }'>공개</c:when>
			<c:otherwise>비공개</c:otherwise>
			</c:choose></td>
	</tr>
	</c:forEach>
</table>
</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="adminProductList" />	
</jsp:include>

</article>


<%@ include file="../../include/admin/headerfooter/footer.jsp"%>
