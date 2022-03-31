<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>상품문의 List</h1>
<form name="frm" method="post" >
<table>
		<tr><td width="642">제목 &nbsp;<input type="text" name="key" value="${key }">&nbsp;
			<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search('adminAskForm');">&nbsp;
			<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total('adminAskForm');">&nbsp;
			<input class="btn" type="button" name="btn_write" value="음" onclick="go_wrt();">&nbsp;</td>
		</tr>
	</table>
	</form>
	
	<form>
	<table id="tableContainer" style="text-align:center; width:85%;">
	<tr><th width="130px">번호(답변여부)</th>
		<th style="width:380px;max-width:380px;  ">제목</th>
		<th width="70px">작성자</th>
		<th width="110px">작성일</th>
	<c:forEach items="${askList}" var="mAskVO">
	<tr><td height="23" align="center">${mAskVO.aseq}
	     <c:choose>
	      <c:when test='${mAskVO.arseq==""}'>(미처리)</c:when>
     <c:otherwise >(답변처리완료)</c:otherwise>
     </c:choose>
	</td>
		<td style="text-align:left; width:500px; word-break:break-all">
			<a href="#" onclick="go_askview('${mAskVO.aseq}')">&nbsp;&nbsp;${mAskVO.title }</a></td>
		<td>${mAskVO.id}</td>
		<td><fmt:formatDate value="${mAskVO.indate_a}"/></td></tr>
	
	</c:forEach>
</table>
<input type="hidden" name="pseq" value="${mAskVO.pseq}">

</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="meal.do?command=adminAskForm" />	
</jsp:include>

</article>
<%@ include file="../../include/admin/headerfooter/footer.jsp"%>