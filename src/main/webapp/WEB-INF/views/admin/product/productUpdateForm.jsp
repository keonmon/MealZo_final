<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<script>
$(document).ready(function(){  cal(); });

$(function(){ 
	$("#selectKind").val("${mproductVO.kind}").attr("selected","selected"); 
});
</script>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2>${mproductVO.pseq }번 상품 정보 수정</h2>
	<form name="frm1" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="pseq" value="${mproductVO.pseq }">
	<input type="hidden" name="oldImage" value="${mproductVO.image }">
	
	<table id="tableContainer" width="100%">
		<tr><th width="75px">종류</th>
            <td style="text-align:left; padding:5px 10px;" >
            <select name="kind" id="selectKind">
	  			<option value="한식">한식</option>
	  			<option value="양식">양식</option>
	  			<option value="중식">중식</option>
            </select>
            </td>
            <th>베스트 상품</th>
            <td  style="text-align:center; padding:5px 10px;">
            	<c:choose>
            		<c:when  test='${mproductVO.bestyn== "y"}'>
            			<input type="checkbox" name="bestyn" value="y" checked="checked">
            		</c:when>
            		<c:otherwise>
            			<input type="checkbox" name="bestyn" value="n" >
            		</c:otherwise>
            	</c:choose>
            </td>
            <th>판매 상태</th>
            <td style="text-align:center; padding:5px 10px;">
            	<c:choose>
            		<c:when  test='${mproductVO.useyn== "y"}'>
            			<input type="checkbox" name="useyn" value="y" checked="checked">
            		</c:when>
            		<c:otherwise>
            			<input type="checkbox" name="useyn" value="n" >
            		</c:otherwise>
            	</c:choose>
            </td>
		</tr>
		<tr><th>상품명</th><td width="343" colspan="5" style="text-align:left; padding:5px 10px;">
			<input type="text" name="name" size="47" maxlength="100" value="${mproductVO.name}" style="width:600px;"></td></tr>
		<tr><th>원가[A]</th><td width="70" style="text-align:left; padding:5px 10px;"><input type="text" name="price1" size="11" value="${mproductVO.price1}" onkeyup="cal();"></td>
			<th>판매가[B]</th><td width="70" style="text-align:left; padding:5px 10px;"><input type="text" name="price2" size="11" value="${mproductVO.price2}" onkeyup="cal();"></td>
			<th>마진금액[B-A]</th><td width="72" style="text-align:left; padding:5px 10px;"><input type="text" name="price3" value="" size="11"></td>
		<tr><th>상세설명</th><td colspan="5"  style="text-align:left; padding:5px 10px;">
			<textarea name="content" rows="8" cols="70" style="width:750px; max-width:750px">${mproductVO.content}</textarea></td>
		<tr><th>썸네일</th><td width="343" colspan="5" style="text-align:left; padding:5px 10px;" >
			<img src="images/${mproductVO.image}" style="height:250px; max-width:400px"><br>
			<input type="file" name="image"></td></tr>
		<tr><th>상세<br>이미지1</th><td width="343" colspan="5" style="text-align:left; padding:5px 10px;" >
			<c:forEach items="${mpdimg1VOList }" var="mpdimgVO1">
				<img src="images/${mpdimgVO1.image}" style="height:250px; max-width:400px">
				<input type="hidden" name="oldImage1" value="${mpdimgVO1.image }">
			</c:forEach><br>
			<input type="file" name="image1"></td></tr>
		<tr><th>상세<br>이미지2</th><td width="343" colspan="5" style="text-align:left; padding:5px 10px;" >
			<c:forEach items="${mpdimg2VOList }" var="mpdimgVO2">
				<img src="images/${mpdimgVO2.image}"  style="height:250px; max-width:400px">
				<input type="hidden" name="oldImage2" value="${mpdimgVO2.image }">
			</c:forEach><br>
			<input type="file" name="image2"></td></tr>
	</table>
	<div style="text-align:center;">
		<input type="button" class="btn" value="수정" onclick="go_Product_Update();">
		<input type="button" class="btn" value="목록으로" onclick="location.href='meal.do?command=adminProductList'">
		<input type="button" class="btn" value="삭제하기" onclick="go_Product_Del();">
	</div>
	</form>
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>