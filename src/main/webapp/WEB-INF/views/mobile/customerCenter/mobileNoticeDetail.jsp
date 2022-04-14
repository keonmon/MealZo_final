<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2>공지사항</h2>
	<form>
		<table id="cartList" width="100%" style="text-align:center;">
			<tr>
				<th width="50" style="font-size:1.2em;">제목</th>
				<td  style="text-align: left;">${noticeVO.SUBJECT}</td>
				<th width="50" style="font-size:1.2em;">등록일</th>
				<td align="left" style="text-align: left;"><fmt:formatDate value="${noticeVO.INDATE}" type="date" /></td>
			</tr>
			<tr>
				<td colspan="4" align="left" style="text-align: left; font-size: 115%; max-width:900px; word-break:break-all">
					<div style="margin-top:5px;padding:20px; border:1px solid lightgrey; height:100%; max-height:9999px; margin-bottom:10px; ">
						<div style="margin-bottom:10px;">
							<img width="100%"src="images/${noticeVO.IMAGE1 }">
						</div>
						${noticeVO.CONTENT}
					</div>
				</td>
			</tr>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="text-align:center; margin-bottom:20px;">
			<input type="button" value="목록으로" class="submit" onClick="location.href='noticeList'">
		</div>
	</form>
</article>

<%@ include file="../include/headerfooter/mobileFooter.jsp" %>