<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){  cal(); });
	
	$(function(){ 
		$("#selectKind").val('${pvo.kind}').attr("selected","selected"); 
	});
	
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
						if(data.FILENAME1!=null){
							$("#filename1").empty();
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
				},
				
				error:function(){
					alert("실패");
				}
			});
		});
	});
</script>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2>상품 등록</h2>
	<form name="frm1" method="post">
		
	<table id="tableContainer" width="100%">
		<tr><th width="75px">상품 분류</th>
            <td style="text-align:left; padding:5px 10px;" >
            <select name="kind" id="selectKind">
            	<option value=""></option>
            	<option value="한식">한식</option>
	  			<option value="양식">양식</option>
	  			<option value="중식">중식</option>
            </select>
            </td>
            <th>베스트 상품</th>
            <td  style="text-align:center; padding:5px 10px;">
            	<input type="checkbox" name="bestyn" value="y" > 
            </td>
            <th>판매 상태</th>
            <td style="text-align:center; padding:5px 10px;">
            	<input type="checkbox" name="useyn" value="y" checked> 
            </td>
		</tr>
		<tr><th>상품명</th><td width="343" colspan="5" style="text-align:left; padding:5px 10px;">
			<input type="text" name="name" size="47" maxlength="100" value="${pvo.name }" style="width:600px;"></td></tr>
		<tr><th>원가[A]</th><td width="70" style="text-align:left; padding:5px 10px;"><input type="text" name="price1" size="11" value="${pvo.price1 }"  onkeyup="cal();"></td>
			<th>판매가[B]</th><td width="70" style="text-align:left; padding:5px 10px;"><input type="text" name="price2" size="11" value="${pvo.price2 }" onkeyup="cal();"></td>
			<th>마진금액[B-A]</th><td width="72" style="text-align:left; padding:5px 10px;"><input type="text" name="price3" size="11"></td></tr>
		<tr><th>상세설명</th><td colspan="5" style="text-align:left; padding:5px 10px;">
			<textarea name="content" rows="8" cols="70" style="max-height:120px; min-height:120px; max-width:600px; min-width:600px;">${pvo.content }</textarea></td></tr>
			
		<tr><td rowspan="3"><td/><td rowspan="3"></td><td rowspan="3"></td>
		<th>썸네일 이미지</th><td style="vertical-align:top; max-width:120px" >
			<input type="hidden" name="image" id="image" >
			<div id="filename"></div></td></tr>
		<tr><td rowspan="3"></td><th>상세 이미지1</th><td style="vertical-align:top; max-width:120px" >
			<input type="hidden" name="image1" id="image1">
			<div id="filename1"></div></td></tr>
		<tr><th>상세 이미지2</th><td style="vertical-align:top; max-width:120px" >
			<input type="hidden" name="image2" id="image2" >
			<div id="filename2"></div></td></tr>
	</table>
	<div style="text-align:center;">
		<input type="button" class="btn" value="등록" onclick="go_Product_Save()">
		<input type="button" class="btn" value="목록으로" onclick="go_Mov()">
	</div>
	</form>
	<div style="position:absolute; top:486px;">
	<form name="frm2" id="fileupForm" method="post" enctype="multipart/form-data" >
		<table id="tableContainer" width="100%">
			<tr><th>썸네일 이미지</th><td style="text-align:left; padding:5px 10px;" >
				<input type="file" name="image" accept="image/gif,image/jpeg,image/png"></td></tr>
			<tr><th>상세 이미지1</th><td style="text-align:left; padding:5px 10px;" >
				<input type="file" name="image1" accept="image/gif,image/jpeg,image/png"></td></tr>
			<tr><th>상세 이미지2</th><td style="text-align:left; padding:5px 10px;" >
				<input type="file" name="image2" accept="image/gif,image/jpeg,image/png">
				<input type="button" id="SandImageButton" value="이미지전송"></td></tr>
		</table>
	</form>
	</div>
	<h3><strong>${message}</strong></h3>
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>