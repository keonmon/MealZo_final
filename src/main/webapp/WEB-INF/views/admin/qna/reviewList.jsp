<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>
<%@ include file="../sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>상품 리뷰 List </h1>
<form name="frm" method="post" >
	<table>
		<tr><td width="642">상품 리뷰 &nbsp;<input type="text" name="key" value="${key }">&nbsp;
			<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search('adminReviewForm');">&nbsp;
			<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total('adminReviewForm');">&nbsp;
			<input class="btn" type="button" name="btn_write" value="음" onclick="go_wrt();">&nbsp;</td>
		</tr>
	</table>
</form>


<form name="frm6" method="post" >
<table id="tableContainer" style="text-align:center; width:85%;">
	<tr><th width="130px">번호(답변여부)</th>
		<th width="300px;" >내용</th>
		<th width="70px">작성자</th>
		<th width="110px">작성일</th>
		<th width="110px">상품 이름</th>
			<th width="70px">삭제</th>
	<c:forEach items="${list }" var="mreviewVO">
	<tr><td height="23" align="center">${mreviewVO.rseq}</td>
		<td  style="text-align:left; width:500px; word-break:break-all">
			${mreviewVO.content }</td>
		<td>${mreviewVO.id}</td>
		<td><fmt:formatDate value="${mreviewVO.indate }"/></td>
		<td>${mreviewVO.pname}</td>
		<td><input type="checkbox" name="rseq" value="${mreviewVO.rseq}"></td></tr>
	

	</c:forEach>
	<tr><th width="130px"></th><th ></th><th width="70px"></th><th width="110px"></th>
	<th ></th><th> <a href="#" onClick="go_review_delete();"><h3>삭제하기</h3></a></th></tr> 
</table>
</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="meal.do?command=adminReviewForm" />	
</jsp:include>

</article>



<%@ include file="../footer.jsp"%>