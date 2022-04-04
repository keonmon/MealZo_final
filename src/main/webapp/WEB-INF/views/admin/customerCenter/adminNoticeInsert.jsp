<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>
<script type="text/javascript">
	// 파일 업로드용 ajax
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
						if(data.FILENAME!=null){
							$("#filename").empty();
							$("#filename").append("<div style='max-height:150px;max-width:120px;' id>"+data.FILENAME+"</div>");
							$("#image").val(data.FILENAME);
							$("#filename").append(
									"<img src='images/"+data.FILENAME+"' style='max-height:150px;max-width:120px; '/>");
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

<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2>공지사항</h2>
	<form name="frm" method="post" action="meal.do">
		<input type="hidden" name="nseq" value="${nseq }">
		<table id="tableContainer">
			<tr><th width="100px" style="background-color:lightgrey">공지 제목</th>
	            <td width="400px" colspan="1">
	            <input width="500px" type="text" name="subject" size="47" maxlength="100">
			</td>
			<th width="70px">공개유무</th>
					<td style="text-align:center;">
						<input type="checkbox" name="useyn" value="y" checked="checked">
			</td></tr>
			<tr><th>상세설명</th>
					<td colspan="5">
						<textarea name="content" rows="8" cols="70" style="max-height:220px;min-height:220px; max-width:560px; min-width:560px; height:250px"></textarea></td>
			</tr>
		</table>
			
		<div width="343" style="position:absolute; right:300px; vertical-align:top; max-width:300px;">
		내용이미지
		 (이미지는 게시물 최상단에 위치합니다)<br>
			<input type="hidden" name="image">
			<div id="filename"></div></div>
			<br><br><br><br>
 	<input class="btn" type="button" value="등록"  onclick="go_Notice()">
	<input type="button" class="btn" value="취소" onclick="location.href='adminNoticeList'">
	</form>
	
	<div style="position:absolute; top:4530px;">
	<form name="frm2" id="fileupForm" method="post" enctype="multipart/form-data" >
		<table id="tableContainer" width="100%">
			<tr><th>내용이미지</th><td style="text-align:left; padding:5px 10px;" >
				<input type="file" name="image" accept="image/gif,image/jpeg,image/png"></td></tr>
			<tr><td><input type="button" id="SandImageButton" value="이미지전송"></td></tr>
		</table>
	</form>
	</div>
	<h3><strong>${message}</strong></h3>
</article>


<%@ include file="../../include/admin/headerfooter/footer.jsp"%>