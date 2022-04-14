<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>

<article id="zzim2" style="width:900px; max-width:900px;">

    <div class="kind">나의 Q&A</div>

<br><br><br><br>
<form>
<table id="zzimtable" style="text-align:center; margin:0 auto;" >
<tr    style="font-size:2.3em; height:140px; background-color:#ededed;"><th style="width: 20%;">등록일</th>
<th style="width: 60%;" >제목명</th><th style="width: 200px;">답변여부</th>
	<c:forEach items="${mqnaList}" var="mqnaVO">>
			<input type="hidden" value="${mqnaVO.QSEQ}">
<tr style="height: 100px;" ><td style="font-size:2.0em;">
		<fmt:formatDate value="${mqnaVO.INDATE}" type="date" pattern="YY.MM.dd"/></td>
	<td style="text-align:center;font-size:2.0em;"><a href="mobileQnaView?qseq=${mqnaVO.QSEQ}" style="color:black; font-weight:bold;">
				${mqnaVO.SUBJECT}</a></td>
<td style="font-wight:bold; font-size:2.0em"><c:choose>
	 			<c:when test="${mqnaVO.REP==1}"> 미답변 </c:when>
	 			<c:when test="${mqnaVO.REP==2}"> 답변완료 </c:when>
	 		</c:choose></td></tr>
 

 


</c:forEach>

  </table>
  <div class="clear"></div>
		<div id="buttons3" style="  font-size:2.6em;">
			<input type="button" class="qnaviewb"value="질문하기" onClick="location.href='mobileQnaWriteForm'">
			<input type="button" class="qnaviewb" value="쇼핑 계속하기" c onClick="location.href='/'">
		</div>
	</form>
  

    
    </article>
    
    <%@ include file="../include/headerfooter/mobileFooter.jsp"%>