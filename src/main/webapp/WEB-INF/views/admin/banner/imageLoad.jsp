<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<script src="user/script/jquery-3.6.0.js"></script>
	<script src="admin/script/adminProduct.js"></script>
	
	<!-- Ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<div id="wrap" align="center">
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
								$(opener.document).find("#filename${num}").empty();
								$(opener.document).find("#filename${num}").append("<div >"+data.FILENAME+"</div>");
								$(opener.document).find("#image${num}").val(data.FILENAME);
								$(opener.document).find("#filename${num}").append(
										"<br><img src='images/"+data.FILENAME+"' style='max-height:150px;max-width:120px; '/>");
								self.close();
								
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
	<form name="frm2" id="fileupForm" method="post" enctype="multipart/form-data" >
		<table id="tableContainer" width="100%">
			<tr><th>내용이미지</th><td style="text-align:left; padding:5px 10px;" >
				<input type="file" name="image" accept="image/gif,image/jpeg,image/png"></td></tr>
			<tr><td><input type="button" id="SandImageButton" value="이미지전송"></td></tr>
		</table>
	</form>
</div>
</body>
</html>