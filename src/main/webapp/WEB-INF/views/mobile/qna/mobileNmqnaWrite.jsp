<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>

<div id=subpageContainer>
<div style="width:95%; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:2.5em ">고객님의 질문에 운영자가 답변을 드립니다</b>
</div>

<form action="mobileNmqnaWrite" name="formm" style="margin-top:5%; text-align:center; margin-left:40px; width:90%; height:70%" >
	<table id="qnaWrite">
        <tr style="hieght:100px; width:90%;">
       	    <td style="font-size:1.5em; width:30% "><h2>임시아이디</h2> </td>
            <td style="font-size:1.5em; text-align:center;">
        		<input style="background:silver; width:100%; text-align:center; height:60px; font-size:1.5em;" type="text" name="id" value="${dto.id}">
            </td>
        </tr>
         <tr height="100px;">
       	    <td style="font-size:1.5em; "><h2>임시비밀번호</h2> </td>
            <td style="font-size:1.5em; text-align:center;">
        		<input placeholder="비회원문의 확인시 필요" style="background:silver; text-align:center; width:100%; height:60px; font-size:1.5em;" type="text" name="pwd" value="${dto.pwd}">
            </td>
        </tr>
         <tr height="100px;">
       	    <td style="font-size:1.5em; "><h2>제목</h2> </td>
            <td style="font-size:1.5em; text-align:center;">
        		<input style="background:silver; text-align:center; width:100%; height:60px; font-size:1.5em;" type="text" name="subject" value="${dto.subject}">
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
	
	<div id="botFlyingContainer" style="right:40px;">
	<div id="botBtn" style="background-color:#434343; color:white; 
		font-size:3em; font-weight:bold;">
		<input style="margin-left:20px; width:100%; height:100%; background-color:#434343; color:white; font-size:1.0em; font-weight:bold;" 
		type="button" value="뒤로가기" onclick="location.href='mobileNmQnaForm'">
	</div><div id="botBtn"
	style=" background-color:#6db800; color:white; 
	font-size:3em; font-weight:bold;">
		<input style="width:100%; height:100%; background-color:#6db800; color:white; font-size:1.0em; font-weight:bold;"
		 type="submit" value="글쓰기">
	</div>
	</div>
</form>
</div>



<!-- <div id="botFlyingContainer" >
	<div id="botBtn" style=" 
		background-color:#434343; color:white; 
		font-size:3em; font-weight:bold;"
		onclick="location.href='mobileMain'">
		홈으로 이동
	</div><div id="botBtn"
	style=" background-color:#6db800; color:white; 
	font-size:3em; font-weight:bold;"
	onclick="go_mobileNmqnaWrite()">
		글쓰기
	</div>
</div> -->

<%@ include file="../include/headerfooter/mobileFooter.jsp" %>