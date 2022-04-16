<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<article id="zzim2" style="width:900px; max-width:900px;">
      <div class="kind">나의 Q&amp;A</div>
   <h3 style="font-size:2.0em">고객님의 질문에 대해서 운영자가 답변을 드립니다.</h3>
   <form>
      <table id=mqnaview>
         <tr  >
            <th >제목</th>
            <td width="500" style="text-align: left;">${mqnaVO.SUBJECT}</td>
         </tr>
         <tr>
            <th>등록일</th>
            <td align="left" style="text-align: left;"><fmt:formatDate
                  value="${mqnaVO.INDATE}" type="date" /></td>
         </tr>
         <tr>
            <th>질문내용</th>
            <td align="left" style="text-align: left; ">${mqnaVO.CONTENT}</td>
         </tr>
         <tr>
            <th>답변 내용</th>
            <td style="max-width:500px; word-break:break-all; max-height:500px;">${mqnaVO.REPLY}
         </tr>
      </table>
      <div class="clear"></div>
      <div id="buttons3" style="  font-size:2.4em; 
    margin-top: 30%;
      ">
         <input type="button" class="qnaviewb"value="목록보기" onClick="location.href='mobileQnaForm'">
         <input type="button" class="qnaviewb" value="쇼핑 계속하기" c onClick="location.href='/'">
      </div>
   </form>
   </article>

<%@ include file="../include/headerfooter/mobileFooter.jsp"%>