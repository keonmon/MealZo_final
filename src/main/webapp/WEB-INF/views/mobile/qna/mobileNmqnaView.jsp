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
            <td style="font-size:2.3em; text-align:center; font-weight:bold;">
        		${mqnaVO.SUBJECT}
            </td>
        </tr>
         <tr style="hieght:100px; width:90%;">
       	    <td style="font-size:1.5em; width:30% "><h2>등록일</h2> </td>
            <td style="width:500px; font-size:2.3em; text-align:center; font-weight:bold;">
        		${mqnaVO.INDATE}
            </td>
        </tr>
         <tr style="hieght:100px; width:90%;">
       	    <td style="font-size:1.5em; width:30% "><h2>질문내용</h2> </td>
            <td style="font-size:2.3em; text-align:center; font-weight:bold;">
        		${mqnaVO.CONTENT}
            </td>
        </tr>
		 <tr style="hieght:100px; width:90%;">
       	    <td style="font-size:1.5em; width:30% "><h2>답변내용</h2> </td>
            <td style="border:3px solid green; height:500px; font-size:2.3em; text-align:center; font-weight:bold;">
        		${mqnaVO.REPLY}
            </td>
        </tr>
	</table>
</form>

<div class="clear"></div>

</div>
<div id="botFlyingContainer" >
	<div id="botBtn" style=" 
		background-color:#434343; color:white; font-size:3em; font-weight:bold;"
		onclick="location.href='mobileMain'">
		홈으로 이동
	</div><div id="botBtn"
	style=" background-color:#6db800; color:white; font-size:3em; font-weight:bold;"
	onclick="location.href='mobileNmqnaForm'">
		목록으로
	</div>
</div>
<%@ include file="../include/headerfooter/mobileFooter.jsp" %>