<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<div id=subpageContainer>
<div style="width:95%; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:2.5em ">고객님의 질문에 운영자가 답변을 드립니다</b>
</div>

<form style="margin-top:5%; text-align:center; margin-left:40px; width:90%; height:70%">
	<table id="qnaWrite">
        <tr style="hieght:100px; width:90%;">
       	    <td style="font-size:1.5em; width:30% "><h2>제목</h2> </td>
            <td style="font-size:1.5em; text-align:center;">
        		<input style="background:silver; width:100%; text-align:center; height:60px; font-size:1.5em;" type="text" name="subject" value="${dto.subject}">
            </td>
        </tr>
		 <tr height="100px;">
       	    <td style="font-size:1.5em;"><h2>내용</h2> </td>
        </tr>
	</table>
	<table style="width:100%">
		 <tr height="100px;">
            <td style="font-size:1.5em; text-align:center;">
        		<input style="background:silver; width:100%; height:400px; font-size:1.5em;" type="text" name="content" value="${dto.content}">
            </td>
        </tr>
	</table>
	<div id="message" style="font-size:1.4em;"> ${message}</div>
</form>

<div class="clear"></div>

</div>
<div id="botFlyingContainer" >
	<div id="botBtn" style=" 
		background-color:#434343; color:white; font-size:3em; font-weight:bold;"
		onclick="location.href='mobileMain'">
		쇼핑 계속하기
	</div><div id="botBtn"
	style=" background-color:#6db800; color:white; font-size:3em; font-weight:bold;"
	onclick="location.href='mobileQnaWrite'">
		글쓰기
	</div>
	
	
</div>
<%@ include file="../include/headerfooter/mobileFooter.jsp" %>