<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>

<%@ include file="../include/user/mypage_sidemenu.jsp" %>
<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2>나의 Q&amp;A</h2>
	<h3>고객님의 질문에 대해서 운영자가 답변을 드립니다.</h3>
	<form>
		<table >
			<tr >
				<th>제목</th>
				<td width="500" style="text-align: left;">${mqnaVO.SUBJECT}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td align="left" style="text-align: left;"><fmt:formatDate
						value="${mqnaVO.INDATE}" type="date" /></td>
			</tr>
			<tr>
				<th>질문내용</th>
				<td align="left" style="text-align: left; font-size: 115%;">${mqnaVO.CONTENT}</td>
			</tr>
			<tr>
				<th>답변 내용</th>
				<td style="max-width:500px; word-break:break-all; max-height:500px;">${mqnaVO.REPLY}
			</tr>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="목록보기" class="submit"
				onClick="location.href='qnaForm'">
				 <input type="button" value="쇼핑 계속하기" class="cancel"
				onClick="location.href='/'">
		</div>
	</form>
</article>
<%@ include file="../include/user/headerfooter/footer.jsp" %>

