<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<article id="zzim2" style="width:900px; max-width:900px;">
		<div class="kind">나의 상품문의</div>
	<h3 style="font-size:2.0em">고객님의 질문에 대해서 운영자가 답변을 드립니다.</h3>
	<form>
		<table id=mqnaview>
			<tr  >
			<th>문의상품</th><td style="font-szie:2.0em"><a href="mobileProductDetail?pseq=${maskVO.PSEQ}" style="color:black; font-weight:bold;">
<img src="images/${maskVO.IMAGE}" width="200px" style="float:left;"/>	<br><br>${maskVO.PNAME}<br>
									<fmt:formatNumber value="${maskVO.PRICE2}" pattern="###,###,###"/>원
							

</a></td></tr>
				<tr><th >제목</th>
				<td width="500" style="text-align: left;">${maskVO.TITLE}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td align="left" style="text-align: left;"><fmt:formatDate
						value="${maskVO.INDATE_A}" type="date" /></td>
			</tr>
			<tr>
				<th>질문내용</th>
				<td align="left" style="text-align: left; ">${maskVO.CONTENT_A}</td>
			</tr>
			<tr>
			
				<th>답변 내용</th>
				<td style="max-width:500px; word-break:break-all; max-height:500px;">${maskVO.CONTENT_R}
			</tr>
		</table>
		<div class="clear"></div>
		<div id="buttons3" style="  font-size:2.4em">
			<input type="button" class="qnaviewb"value="목록보기" onClick="location.href='mobileAskForm'">
			<input type="button" class="qnaviewb" value="쇼핑 계속하기" c onClick="location.href='/'">
		</div>
	</form>
	</article>

<%@ include file="../include/headerfooter/mobileFooter.jsp"%>
