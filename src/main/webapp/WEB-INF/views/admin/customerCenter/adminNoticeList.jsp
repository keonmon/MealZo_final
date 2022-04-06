<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>


<article id="mypageArticle2" style="width:950px; max-width:950px;">

<h1>공지사항 관리</h1>
<form name="frm" method="post" >
	<table>
		<tr><td width="460">제목검색<input type="text" name="key" value="${key }">
			<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search('adminNoticeList');">
			<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total('adminNoticeList');">
			<input class="btn" type="button" name="btn_write" value="새 공지 등록" onclick="go_wrt_Notice();"></td>
			<td>
			<select name="change_Useyn" size="1" id="noticeSelect">
				<option value="y" selected>공개</option>
				<option value="n">비공개</option>
			</select>
			<input type="button" class="btn" style="width:100px;" value="체크항목 변경" onclick="go_notice_save()">
		</td></tr>
	</table>


<table id="tableContainer" style="text-align:center;" width="85%">
	<tr><th width="100px">공지번호</th>
		<th width="220px">제목</th>
		<th width="130px">게시일</th>
		<th width="130px">게시 상태</th>
		<th width="50px">선택</th>
	<c:forEach items="${noticeList }" var="noticeVO">
		<tr>
			<td style="text-align:left">
				<span style="font-weight:bold; color:black">${noticeVO.NSEQ }</span>
			</td>
			<td style="">
				<a href="adminNoticeDetail?nseq=${noticeVO.NSEQ }" style="text-decoration:none;">
					${noticeVO.SUBJECT }
				</a>
			</td>
			<td><fmt:formatDate value="${noticeVO.INDATE }" type="date"/></td>
			<td>
				<c:choose>
					<c:when test='${noticeVO.USEYN == "y" }'>
						<span style="font-weight:bold; color:blue">공개</span>
					</c:when>
					<c:otherwise>
						<span style="font-weight:bold; color:red">비공개</span>
					</c:otherwise>
				</c:choose>
			</td>
			<td><input type="checkbox" name="checkBox_nseq" value="${noticeVO.NSEQ }"></td>
			</tr>
	</c:forEach>
</table>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="adminNoticeList" />	
</jsp:include>

</form>
<br><br>
<br><br>
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>
