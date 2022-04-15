<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<script type="text/javascript">
$(function(){
	$('#SandImageButton').click(function(){
		var formselect = $("#fileupForm")[0];	//지목된 폼을 변수에 저장
		var formdata = new FormData(formselect);
	
		//ajax : 웹페이지 새로고침이 필요없는 request(요청)
		// 문법 : $.ajax({ 객체 });
			$.ajax({
				url:"<%=request.getContextPath()%>/fileup",	//Controller '/fileup'으로 매핑된 메서드를 호출
				type:"POST",
				enctype:"multipart/form-data",
				async:false,
				data: formdata,
				timeout: 10000,
				contentType: false,
				processData: false,
				
				success: function(data){
					// Controller에서 넘어온 data의 'STATUS 데이터가 1이면'
					if(data.STATUS == 1){
						//동적으로 div 태그 달아주기.
						if(data.FILENAME1!=null){
							$("#filename1").empty();  //이미지잇을경우
							$("#filename1").append("<div style='max-height:150px;max-width:120px;' id>"+data.FILENAME1+"</div>");
							$("#image1").val(data.FILENAME1);
							$("#filename1").append(
									"<img src='images/"+data.FILENAME1+"' style='max-height:150px;max-width:120px; '/>");
						}
						if(data.FILENAME2!=null){
							$("#filename2").empty();
							$("#filename2").append("<div style='max-height:150px;max-width:120px;' id>"+data.FILENAME2+"</div>");
							$("#image2").val(data.FILENAME2);
							$("#filename2").append(
									"<img src='images/"+data.FILENAME2+"' style='max-height:150px;max-width:120px; '/>");
						
						}
					}
				},
			error:function(){
				alert("실패");
			}
		
		});
	});
});
</script>


<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
<jsp:useBean id="now" class="java.util.Date" />

<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2>이벤트 관리</h2>
	
	<form name="frm" method="post" >
		<input type="hidden" name="eseq" value="${eseq}">

	<table id="tableContainer" width="100%">
		<tr><th width="75px">이벤트명</th>
            <td style="text-align:left; padding:5px 10px;" width="400px" colspan="2">
            <input width="400px" type="text" name="title" size="47" maxlength="100" value="${evo.title }"></td>
			<th width="45px">게시일</th>
			<td width="85px" style="text-align:center;" >
				<fmt:formatDate value="${now}" type="date"/>
			</td>
		</tr>
		<tr>
			<th width="75">기간</th>
			<td style="text-align:left; padding:5px 10px;" colspan="4">
				<input type="date" name="startdate" style="width:125px;" value="${startdate}"><input type="time" value="${startTime}" name="startTime">
				~
				<input type="date" name="enddate" style="width:125px;" value="${enddate}"><input type="time" value="${endTime}" name="endTime">
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
				<td colspan="4"  style="vertical-align:top; max-width:120px" >
			
					<input type="hidden" name="image1" id="image1" >(최적크기 : 285px * 285px)
						<div id="filename1"></div></td></tr>
		<tr><th>내용<br>이미지</th>
				<td colspan="4" style="vertical-align:top; max-width:120px">
					<input type="hidden" name="image2" id="image2">(이미지는 게시물 최상단에 위치합니다)
					<<div id="filename2"></div></td></tr>
	</table>
	<br><br></br>
	<div style="text-align:center;">
		<input type="button" class="btn" value="등록" onclick="go_Event_Insert()">
		<input type="button" class="btn" value="삭제" onclick="go_Event_delete()">
		<input type="button" class="btn" value="취소" onclick="location.href='adminEventList'">
	</div>
	</form>
	
	<div style="position:absolute; top:610px; left:700px;">
	<form name="frm2" id="fileupForm" method="post" enctype="multipart/form-data" >
		<table id="tableContainer" width="100%">
			<tr><th>썸네일 이미지</th><td style="text-align:left; padding:5px 10px;" >
				<input type="file" name="image1" accept="image/gif,image/jpeg,image/png"></td></tr>
			<tr><th>상세 이미지1</th><td style="text-align:left; padding:5px 10px;" >
				<input type="file" name="image2" accept="image/gif,image/jpeg,image/png">
				<input type="button" id="SandImageButton" value="이미지전송"></td></tr>
		</table>
	</form>
	</div>
	<h3><strong>${message}</strong></h3>
	
	
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>