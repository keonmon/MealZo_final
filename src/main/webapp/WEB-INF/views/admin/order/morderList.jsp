<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>주문/배송 관리</h1>
<form name="frm" method="post" >
	<table>
		<tr><td width="642">주문번호<input type="text" name="key" value="${key }">
			<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search('adminOrderList');">
			<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total('adminOrderList');">
		</td></tr>
	</table>


<table id="tableContainer" style="text-align:center;" width="85%">
	<tr><th width="100px">주문번호</th>
		<th width="65px">주문자</th>
		<th width="100px">상품명</th>
		<th width="65px">수량</th>
		<th width="70px">우편</th>
		<th width="220px">주소</th>
		<th width="130px">전화</th>
		<th width="130px">주문일</th>
	<c:forEach items="${morderList }" var="morderVO">
		<tr>
			<td style="text-align:left">
				<c:choose>
					<c:when test='${morderVO.RESULT == "1" }'>
						<span style="font-weight:bold; color:blue">${morderVO.OSEQ }</span>
						<input type="checkbox" name="result" value="${morderVO.ODSEQ }">결제완료
					</c:when>
					<c:when test='${morderVO.RESULT == "2" }'>
						<span style="font-weight:bold; color:blue">${morderVO.OSEQ }</span>
						<input type="checkbox" name="result" value="${morderVO.ODSEQ }">배송중
					</c:when>
					<c:when test='${morderVO.RESULT == "3" }'>
						<span style="font-weight:bold; color:red">${morderVO.OSEQ }</span>
						<input type="checkbox" name="result" value="${morderVO.ODSEQ }">배송완료
					</c:when>
					<c:otherwise>
						<span style="font-weight:bold; color:red">${morderVO.OSEQ }</span>
						<input type="checkbox" name="result" value="${morderVO.ODSEQ }">주문취소
					</c:otherwise>
				</c:choose>
			</td>
			<td>${morderVO.MNAME }</td><td>${morderVO.PNAME }</td><td>${morderVO.QUANTITY }</td>
			<td>${morderVO.ZIP_NUM }</td><td>${morderVO.ADDRESS }</td><td>${morderVO.PHONE }</td>
			<td><fmt:formatDate value="${morderVO.INDATE }" type="both"/></td></tr>
	</c:forEach>
</table>
</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="adminOrderList" />	
</jsp:include>

<br><br>
	<select name="change_Result" size="1" id="orderListSelect">
		<option value="1" selected>결제완료</option>
		<option value="2">배송중</option>
		<option value="3">배송완료</option>
		<option value="4">주문취소</option>
	</select>
<input type="button" class="btn" style="width:200px;" value="체크항목 변경" onclick="go_order_save()">
<br><br>

</article>


<%@ include file="../../include/admin/headerfooter/footer.jsp"%>
