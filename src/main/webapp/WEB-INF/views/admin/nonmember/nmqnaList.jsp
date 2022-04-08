<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>비회원문의 </h1>
<form name="frm" method="post" >
<input type="hidden" name="nmqnaList" value="${nmqnaList}">
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
		<th style="width:350px;  ">제목</th>
		<th width="60px">임시아이디</th>
		<th width="70px">임시비밀번호</th>
		<th width="60px">작성일</th>
	<c:forEach items="${nmqnaList}" var="nmqnaVO">
	<tr><td height="23" align="center">${nmqnaVO.NQSEQ}
	     <c:choose>
	      <c:when test='${nmqnaVO.REP=="1"}'>(미처리)</c:when>
     <c:otherwise >(답변처리완료)</c:otherwise>
     </c:choose>
	</td>
		<td style="text-align:left; padding=left:50px;">
			<a href="adminnmQnaDetail?nqseq=${nmqnaVO.NQSEQ}">${nmqnaVO.SUBJECT }</a></td>
		<td>${nmqnaVO.ID}</td><td>${nmqnaVO.PWD}</td>
		<td><fmt:formatDate value="${nmqnaVO.INDATE}"/></td></tr>
	
	</c:forEach>
</table>
</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="adminnmQnaList" />	
</jsp:include>

</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>