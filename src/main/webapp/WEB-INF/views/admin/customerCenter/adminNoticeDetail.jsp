<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<style type="text/css">

</style>

<article id="mypageArticle2" style="width:900px; max-width:900px;">

	<h2>공지사항</h2>
	<form name="frm" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="nseq" value="${noticeVO.nseq }">
		<input type="hidden" name="oldImage" value="${noticeVO.image1 }">
	<table id="tableContainer">
		<tr><th width="100px" style="background-color:lightgrey">공지 제목</th>
            <td width="500px" colspan="6">
            <input width="500px" type="text" name="subject" size="47" maxlength="100" value="${noticeVO.subject }"></td></tr>
		<tr><th>공지 번호</th>
			<td width="70px" style="text-align:center;">${noticeVO.nseq }</td>
			<th width="70px">게시일시</th>
				<td width="200px" style="text-align:center;" >
				<fmt:formatDate value="${noticeVO.indate }" type="both"/></td>
			<th width="70px">공개유무</th>
				<td style="text-align:center;"><c:choose>
					<c:when test='${noticeVO.useyn== "y"}'>공개&nbsp;<input type="checkbox" name="useyn" value="y" checked="checked"></c:when>
					<c:otherwise><input type="checkbox" name="bestyn" value="n"></c:otherwise>
					</c:choose></td></tr>
		<tr><th>상세설명</th>
				<td colspan="5">
					<textarea name="content" rows="8" cols="70" style="width:560px; max-width:560px; min-width:560px; height:250px">${noticeVO.content }</textarea></td></tr>
		<tr><th>내용이미지</th>
				<td colspan="5">
					<img src="images/${noticeVO.image1 }" width="300px" style="max-height:300px;"> (이미지는 게시물 최상단에 위치합니다)<br>
					<input type="file" name="image1"></td></tr>
	</table>
	<input type="button" class="btn" value="수정" onclick="go_Notice_Edit()">
	<input type="button" class="btn" value="취소" onclick="location.href='meal.do?command=adminNoticeList'">
	</form>
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>