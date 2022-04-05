<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>





<fmt:formatDate value="${evo.startdate}" pattern="yyyy-MM-dd" var="startDate" />
<fmt:formatDate value="${evo.enddate}" pattern="yyyy-MM-dd" var="endDate" />
<fmt:formatDate value="${evo.startdate}" pattern="HH:mm:ss" var="startTime" />
<fmt:formatDate value="${evo.enddate}" pattern="HH:mm:ss" var="endTime" />

<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2>이벤트 관리</h2>
	<form name="frm" method="post"  >
		<input type="hidden" name="eseq" value="${evo.eseq}">
		<input type="hidden" name="oldImage1" value="${evo.image1 }">
		<input type="hidden" name="oldImage2" value="${evo.image2 }">
		
	<table id="tableContainer" width="100%">
		<tr><th width="75px">이벤트명</th>
            <td style="text-align:left; padding:5px 10px;" width="400px" colspan="2">
            <input width="400px" type="text" name="title" size="47" maxlength="100" value="${evo.title }"></td>
            <th width="45px" >No.</th>
			<td width="85px" style="text-align:center;">${evo.eseq }</td>
		</tr>
		<tr>
			<th width="75">기간</th>
			<td style="text-align:left; padding:5px 10px;" colspan="2">
				<input type="date" value="${startDate}" name="startDate" style="width:125px;"><input type="time" value="${startTime}" name="startTime">
				~
				<input type="date" value="${endDate}" name="endDate" style="width:125px;"><input type="time" value="${endTime}" name="endTime">
			</td>
			<th width="45px">게시일</th>
			<td width="85px" style="text-align:center;" >
				<fmt:formatDate value="${evo.writedate }" type="date"/>
			</td>
		</tr>
		<tr>
			<th>소제목</th>
			<td style="text-align:left; padding:5px 10px;" width="400px" colspan="2">
            <input width="400px" type="text" name="subtitle" size="47" maxlength="100" value="${evo.subtitle }"></td>
		</tr>
		<tr><th>내용</th>
				<td colspan="4">
					<textarea name="content" rows="8" cols="70" style="width:650px; max-width:650px; min-width:650px; height:250px">${evo.content }</textarea></td></tr>
		<tr><th>썸네일<br>이미지</th>
				<td colspan="4">
					<img src="images/${evo.image1 }" width="300px" style="max-height:300px;"> (최적크기 : 285px * 285px)<br>
					<input type="file" name="image1"></td></tr>
		<tr><th>내용<br>이미지</th>
				<td colspan="4">
					<img src="images/${evo.image2 }" width="300px" style="max-height:300px;"> (이미지는 게시물 최상단에 위치합니다)<br>
					<input type="file" name="image2"></td></tr>
	</table>

	<div style="text-align:center;">
		<input type="button" class="btn" value="수정" onclick="go_Event_Edit()">
		<input id="search" type="button" class="btn" value="삭제" onclick="go_Event_Delete()">
		<input type="button" class="btn" value="취소" onclick="location.href=adminEventList'">
	</div>
	</form>
	<div id="message" style="font-size:1.4em;"> ${message}</div>
	
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>