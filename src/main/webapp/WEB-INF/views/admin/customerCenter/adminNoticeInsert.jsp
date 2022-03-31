<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../sideMenu.jsp"%>
<style type="text/css">

</style>

<article id="mypageArticle2" style="width:900px; max-width:900px;">

	<h2>공지사항</h2>

	<form name="frm" method="post" enctype="multipart/form-data" action="meal.do">
	
		
	<table id="tableContainer">
		<tr><th width="100px" style="background-color:lightgrey">공지 제목</th>
            <td width="500px" colspan="6">
            <input width="500px" type="text" name="subject" size="47" maxlength="100"></td></tr>
		<tr><td><input type="hidden" name="nseq" value="${nseq }"></td>
		<tr>
	
			<th width="70px">공개유무</th>
				<td style="text-align:center;">
					<input type="checkbox" name="useyn" value="y" checked="checked">
				</td></tr>
		<tr><th>상세설명</th>
				<td colspan="5">
					<textarea name="content" rows="8" cols="70" style="width:560px; max-width:560px; min-width:560px; height:250px"></textarea></td></tr>
		<tr><th>내용이미지</th>
				<td colspan="5" width="343" >
				 (이미지는 게시물 최상단에 위치합니다)<br>
					<input type="file" name="image1"></td></tr>
	</table>
 <input class="btn" type="button" value="등록"  onclick="go_Notice()">
	<input type="button" class="btn" value="취소" onclick="location.href='meal.do?command=adminNoticeList'">
	</form>
</article>


<%@ include file="../footer.jsp"%>