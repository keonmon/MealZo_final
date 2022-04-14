<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<div id="mypageArticle2" style="width: 100%; margin: 150px 0 0 0;">
<div style="width:100%; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">밀조의 특별한 이벤트🎉✨</b>
</div>
	
	<table id="eventTable" width="100%" style="text-align:center; margin:0 auto;">
		<tr>
			<th>제목</th>
			<td>${eventVO.TITLE}</td>
			
		</tr>
		<tr>
			<th>이벤트 기간</th>
			<td>
				<fmt:formatDate value="${eventVO.STARTDATE}" type="date" />
				~
				<fmt:formatDate value="${eventVO.ENDDATE}" type="date" />
			</td>
		</tr>
		<tr>
			<td colspan="4" align="left" style="text-align: left; font-size: 1.7em; word-break:break-all">
				<div style="margin-top:5px; padding:20px; border:1px solid lightgrey; height:auto;  margin-bottom:10px; ">
					<div style="margin-bottom:10px;">
						<img width="100%" src="images/${eventVO.IMAGE2 }">
					</div>
					${eventVO.CONTENT}
				</div>
			</td>
		</tr>
	</table>
	<div class="clear"></div>
		
	
</div>
</div>
<div id="botFlyingContainer" >
	<div id="botBtn" style="width:100%;font-weight:bold;font-size:3em;background-color:#6db800; color:white;"
	onclick="location.href='mobileEventList'">
		이벤트 목록
	</div>
</div>

<%@ include file="../include/headerfooter/mobileFooter.jsp" %>