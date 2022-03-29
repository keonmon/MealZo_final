<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>

<%@ include file="../include/user/mypage_sidemenu.jsp" %>
<article  id="mypageArticle2"  style="width:900px; max-width:900px;">
<h2>나의 Q&amp;A</h2>
 <h3>고객님의 질문에 대하여 운영자가 1:1 답변을 드립니다.</h3>
 <form name="formm" method="post">
 <table id="cartList"  width="100%" style="text-align:center;">
 	<tr><th width="50px">번호</th><th>제목</th><th>등록일</th><th>답변 여부</th></tr>
 	<c:forEach items="${mqnaList}" var="mqnaVO">
	 	<tr><td>${mqnaVO.QSEQ}</td>
	 		<td style="width:500px; word-break:break-all"><a href="meal.do?command=qnaView&qseq=${mqnaVO.qseq}">${mqnaVO.subject}</a></td>
	 		<td><fmt:formatDate value="${mqnaVO.INDATE}" type="both"/></td>
	 		<td><c:choose>
	 			<c:when test="${mqnaVO.REP==1}"> 미답변 </c:when>
	 			<c:when test="${mqnaVO.REP==2}"> 답변완료 </c:when>
	 		</c:choose></td>
	 	</tr>
 	</c:forEach>
 </table>
 
 <!-- <div class="clear"></div>
	<jsp:include page="../paging/paging.jsp">
		<jsp:param name="command" value="meal.do?command=qnaList" />	
	</jsp:include>
  --> 
 <div class="clear"></div>
 <div id="buttons" style="float:right">
 
 	<input type="button" value="질문하기" class="submit" onClick="location.href='meal.do?command=qnaWriteForm'">
 	<input type="button" value="쇼핑 계속하기" class="cancel" onClick="location.href='meal.do?command=index'">
 </div>
 </form>
</article>
<%@ include file="../include/user/headerfooter/footer.jsp" %>

