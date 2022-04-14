<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<div id=subpageContainer>
<div style="width:95%; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">나의 Q&amp;A</b>
</div>
<form style="text-align:center;">
<table id="qnaTable"  >
	<tr><th >번호</th>
		<th>제목</th>
		<th>등록일</th>
		<th>답변여부</th></tr>
	<c:forEach items="${mqnaList}" var="mqnaVO">
		<tr>
		<td><b>${mqnaVO.NQSEQ}</b></td>
		
		<td><a href="mobilePwdcheck?nqseq=${mqnaVO.NQSEQ}">
			${mqnaVO.SUBJECT}</a></td> 
       		<td><fmt:formatDate value="${mqnaVO.INDATE}" type="date"/></td>
      		<td> 
      			<c:choose>
      				<c:when test="${mqnaVO.REP==1}"> 미답변 </c:when>
	 				<c:when test="${mqnaVO.REP==2}"> 답변완료 </c:when>
      			</c:choose>
      		</td></tr>
	</c:forEach>
</table>
</form>

<div class="clear"></div>
<jsp:include page="../../include/paging/paging.jsp">
	<jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	<jsp:param value="qnaForm" name="command" />
</jsp:include>
</div>
<div id="botFlyingContainer" >
	<div id="botBtn" style=" 
		background-color:#434343; color:white; font-size:3em; font-weight:bold;"
		onclick="location.href='mobileMain'">
		쇼핑 계속하기
	</div><div id="botBtn"
	style=" background-color:#6db800; color:white; font-size:3em; font-weight:bold;"
	onclick="location.href='mobileQnaWriteForm'">
		질문하기
	</div>
</div>
<%@ include file="../include/headerfooter/mobileFooter.jsp" %>
