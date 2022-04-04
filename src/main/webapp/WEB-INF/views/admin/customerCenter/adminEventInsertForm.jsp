<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>"%>

<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
<jsp:useBean id="now" class="java.util.Date" />

<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2>이벤트 관리</h2>
	
	<form name="frm" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="eseq" value="">

	<table id="tableContainer" width="100%">
		<tr><th width="75px">이벤트명</th>
            <td style="text-align:left; padding:5px 10px;" width="400px" colspan="2">
            <input width="400px" type="text" name="title" size="47" maxlength="100" value="${eventVO.title }"></td>
			<th width="45px">게시일</th>
			<td width="85px" style="text-align:center;" >
				<fmt:formatDate value="${now}" type="date"/>
			</td>
		</tr>
		<tr>
			<th width="75">기간</th>
			<td style="text-align:left; padding:5px 10px;" colspan="4">
				<input type="date" value="" name="startDate" style="width:125px;"><input type="time" value="" name="startTime">
				~
				<input type="date" value="" name="endDate" style="width:125px;"><input type="time" value="" name="endTime">
			</td>
		</tr>
		<tr>
			<th>소제목</th>
			<td style="text-align:left; padding:5px 10px;" width="400px" colspan="2">
            <input width="400px" type="text" name="subtitle" size="47" maxlength="100" value=""></td>
		</tr>
		<tr><th>내용</th>
				<td colspan="4">
					<textarea name="content" rows="8" cols="70" style="width:650px; max-width:650px; min-width:650px; height:250px"></textarea></td></tr>
		<tr><th>썸네일<br>이미지</th>
				<td colspan="4">
					<input type="file" name="image1">(최적크기 : 285px * 285px)</td></tr>
		<tr><th>내용<br>이미지</th>
				<td colspan="4">
					<input type="file" name="image2">(이미지는 게시물 최상단에 위치합니다)</td></tr>
	</table>
	<div style="text-align:center;">
		<input type="button" class="btn" value="수정" onclick="go_Event_Insert()">
		<input type="button" class="btn" value="삭제" onclick="go_Event_delete()">
		<input type="button" class="btn" value="취소" onclick="location.href='meal.do?command=adminEventList'">
	</div>
	</form>
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>