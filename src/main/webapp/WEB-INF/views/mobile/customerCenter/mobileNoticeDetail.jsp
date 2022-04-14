<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<article id="zzim2" style="width:900px; max-width:900px;     margin-bottom: 40%;">
	<h2 class="kind">공지사항</h2>
	<form>
		<table id="cartList" width="100%" style="text-align:center;">
			<tr style=" height: 227px;">
				<th style="font-size: 2.3em; width:137px;">제목</th>
				<td  style="text-align: left; font-size: 2.3em;">${noticeVO.SUBJECT}</td>
				<th  style="font-size:2.3em;">등록일</th>
				<td style="text-align: left; font-size:2.3em; width:130px;"><fmt:formatDate value="${noticeVO.INDATE}" type="date"  pattern="YY.MM.dd"/></td>
			</tr>
			<tr>
				<td colspan="4" align="left" style="text-align: left; font-size: 2.1em; max-width:900px; word-break:break-all">
					<div style="margin-top:5px;padding:20px; border:1px solid lightgrey; height:100%; max-height:9999px; margin-bottom:10px;     width: 96%; ">
						<div style="margin-bottom:10px;">
							<img width="100%"     height= "400px" src="images/${noticeVO.IMAGE1 }">
						</div>
						<br><br><br>
						${noticeVO.CONTENT}
					</div>
				</td>
			</tr>
		</table>
		
		

		
		<div class="clear"></div>
	<div id="buttons3" style="  font-size:2.6em; margin-bottom:20px; width:80%; height:80px; margin-left:20px;">
			<input type="button" value="목록으로" style="height:80px;  margin-top: 30%; width: 112%;" class="submit" onClick="location.href='mobileNoticeList'">
		</div>
	</form>
</article>

<%@ include file="../include/headerfooter/mobileFooter.jsp" %>