<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>메인 배너 관리</h1>
<form name="frm" method="post" >
	<table id="tableContainer" style="text-align:center;" width="85%">
		<tr><th width="50px">순서</th>
			<th width="100px">제목(설명)</th>
			<th width="500px">url</th>
			<th width="300px">이미지</th>
		</tr>
		<c:forEach items="${bannerList }" var="bannerList">
			<tr height="50px">
			
				<td>
					<select name="num" id="selectNumber">
			  			<option value=""></option>
			  			<option value="1"${bannerList.NUM=='1' ? 'selected="selected"' : '' }>1</option>
			  			<option value="2"${bannerList.NUM=='2' ? 'selected="selected"' : '' }>2</option>
			  			<option value="3"${bannerList.NUM=='3' ? 'selected="selected"' : '' }>3</option>
			  			<option value="4"${bannerList.NUM=='4' ? 'selected="selected"' : '' }>4</option>
			  			<option value="5"${bannerList.NUM=='5' ? 'selected="selected"' : '' }>5</option>
			  			<option value="6"${bannerList.NUM=='6' ? 'selected="selected"' : '' }>6</option>
			  			<option value="7"${bannerList.NUM=='7' ? 'selected="selected"' : '' }>7</option>
			  			<option value="8"${bannerList.NUM=='8' ? 'selected="selected"' : '' }>8</option>
		            </select>
				</td>
				
				<td><input type="text" name="name" value="${bannerList.NAME }" ></td>
				
				<td><input type="text" name="url" style="width:300px;" value="${bannerList.URL }"></td>
				
				<td>
					<div id="filename${bannerList.NUM }">${bannerList.IMAGE }</div>
					<input type="button" value="이미지 불러오기(새창)" onclick="imageLoad(${bannerList.NUM })">
					<input type="hidden" name="image" id="image${bannerList.NUM }" value="${bannerList.IMAGE }">
				</td>
				
			</tr>
		</c:forEach>
		<tr><td colspan="4">
			url은 <strong>내부 url('/'이하 url)을 입력</strong>합니다.<br>
				<strong>외부url</strong>은 'http://'로 시작하도록 입력합니다.
		</td></tr>
	</table>
	<input type="button" class="btn" style="width:100px;" value="배너 저장" onclick="go_banner_save()">
		&nbsp;&nbsp;&nbsp;<strong style="font-size:1.2em">${message }</strong>
</form>
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>
