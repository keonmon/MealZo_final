<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>
<%@ include file="../sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>상품 문의 </h1>
<form name="form5" method="post" action="meal.do">
<input type="hidden" name="aseq"  value="${mAskVO.aseq}">
<table id="qnadetil2" style="text-align:center;">
<tr><th width="120px;" height="80px">회원아이디</th><td>${mAskVO.id}</td>
<th width="100px;" height="80px">날짜</th><td>${mAskVO.indate_a} &nbsp;등록</tr>
<tr><th>상품이름</th><td>${mAskVO.pname}</td></tr>
<tr><th colspan="2" width="100px;" height="40px" >제목</th>
<td width="200px;"   height="20px">${mAskVO.title}</td><td><td></td><td></tr>
<tr><th colspan="4" width="100px;" height="20px"  >내용</th><td></td><td></td><td></td></tr>
<tr><td colspan="4"  width="100px;" height="80px">${mAskVO.content_a}</td><td></td><td></td><td></td></tr>
</table>


<c:choose>
<c:when test='${mAskVO.arseq==""}'>
<table id="qnaList2">
<tr><td width="100px;"> 답변 작성 </td><td><td colspan="2"><textarea name="content_r" rows="3" cols="50"></textarea></td><td></td></tr>
 <tr><td colspan="4" style="text-align:center;" height="50px;"><input type="button" class="btn" value="저장" onClick="go_askrep()">
 <input type="button" class="btn" value="목록" onClick="location.href='meal.do?command=adminAskForm'">
</td><td></td><td></td><td></td></tr>
</table>
</c:when>
<c:otherwise>
<table id="qnaList2">
<tr><td  height="50px;" width="100px"> 답변 작성 </td>
<td width="400px" style="word-break:break-all;" ><textarea name="content_r" rows="3" cols="50">${mAskVO.content_r }</textarea></td></tr>


<tr><td colspan="3" style="text-align:center;" height="50px;"><input type="button" class="btn" value="목록" onClick="location.href='meal.do?command=adminAskForm'">
<input type="button" class="btn" value="저장" onClick="go_askupdate()">
</td><td></td><td></td></tr>
</table>
</c:otherwise>
</c:choose>
</form>
</article>

