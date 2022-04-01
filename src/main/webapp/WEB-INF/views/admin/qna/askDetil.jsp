<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>상품 문의 </h1>
<form name="form5" method="post" >
<input type="hidden" name="aseq"  value="${dto.ASEQ}">

<div id="ask">
<table id="askdetil2" style="text-align:center; border: 1px solid #bcbcbc;"">
<tr style="border: 1px solid #bcbcbc;"><th width="120px;" height="80px">회원아이디</th><td>${dto.ID}</td>
<th width="100px;" height="80px">날짜</th><td>${dto.INDATE_A} &nbsp;등록</tr>
<tr ><th>상품이름</th><td>${dto.PNAME}</td></tr>
<tr><th colspan="2" width="100px;" height="40px" >제목</th>
<td width="200px;"   height="20px">${dto.TITLE}</td><td><td></td><td></tr>
<tr><th colspan="4" width="100px;" height="20px"  >내용 </th><td></td><td></td><td></td></tr>
<tr><td colspan="4"  width="100px;" height="80px">${dto.CONTENT_A}</td><td></td><td></td><td></td></tr>
</table>


<c:choose>
<c:when test='${dto.ARSEQ=="" || dto.ARSEQ==null}'>
<input type="hidden" name="aseq"  value="${aseq}">
<table id="qnaList2">
<tr><td width="100px;"> 답변 작성 </td><td><td colspan="2"><textarea name="content_r" rows="3" cols="50">${dto.content_r }</textarea></td><td></td></tr>
 <tr><td colspan="4" style="text-align:center;" height="50px;"><input type="button" class="btn" value="저장" onClick="go_askrep()">
 <input type="button" class="btn" value="목록" onClick="location.href='adminAskForm'">
</td><td></td><td></td><td></td></tr>
</table>
</c:when>
<c:otherwise>
<table id="qnaList2">
<tr><td  height="50px;" width="100px"> 답변 작성 </td>
<td width="400px" style="word-break:break-all;" ><textarea name="content_r" rows="3" cols="50">${dto.CONTENT_R}</textarea></td></tr>


<tr><td colspan="3" style="text-align:center;" height="50px;"><input type="button" class="btn" value="목록" onClick="location.href='adminAskForm'">
<input type="button" class="btn" value="저장" onClick="go_askupdate()">
</td><td></td><td></td></tr>
</table>

</c:otherwise>
</c:choose>
</div>
<br><br>
 <div id="message" style="font-size:1.4em;"> ${message}</div>
</form>
</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>