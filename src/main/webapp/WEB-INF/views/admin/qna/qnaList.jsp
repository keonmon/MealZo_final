<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>Q&A List </h1>
<form name="frm" method="post" >
	<table>
		<tr><td width="642">작성자 &nbsp;<input type="text" name="key" value="${key }">&nbsp;
			<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search('adminQnaList');">&nbsp;
			<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total('adminQnaList');">&nbsp;
			<input class="btn" type="button" name="btn_write" value="음" onclick="go_wrt();">&nbsp;</td>
		</tr>
	</table>
</form>


<form>
<table id="tableContainer" style="text-align:center; width:85%;">
	<tr><th width="130px">번호(답변여부)</th>
		<th style="width:380px;  ">제목</th>
		<th width="70px">작성자</th>
		<th width="110px">작성일</th>
	<c:forEach items="${mqnaList}" var="mqnaVO">
	<tr><td height="23" align="center">${mqnaVO.QSEQ}
	     <c:choose>
	      <c:when test='${mqnaVO.REP=="1"}'>(미처리)</c:when>
     <c:otherwise >(답변처리완료)</c:otherwise>
     </c:choose>
	</td>
		<td style="text-align:left; padding=left:50px;">
			<a href="adminQnaDetail?qseq=${mqnaVO.QSEQ}">${mqnaVO.SUBJECT }</a></td>
		<td>${mqnaVO.ID}</td>
		<td><fmt:formatDate value="${mqnaVO.INDATE}"/></td></tr>
	
	</c:forEach>
</table>
</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="adminQnaList" />	
</jsp:include>

</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>