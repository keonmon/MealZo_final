<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">
<h1>회원 관리</h1>
<form name="frm" method="post" >
	<table>
		<tr><td width="642">이름 검색<input type="text" name="key" value="${key }">
			<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search('adminMemberList');">
			<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total('adminMemberList');"></td>
			
			<td><select name="change_Useyn" size="1" id="memberSelect">
				<option value="y" selected>활성회원</option>
				<option value="n">비활성회원</option>
			</select>
			<input type="button" class="btn" style="width:200px;" value="체크항목 변경" onclick="go_member_save()">
		</td></tr>
	</table>

<table id="tableContainer" style="text-align:center;" width="85%">
	<tr>
		<th width="100px">ID</th>
		<th width="75px">이름</th>
		<th>이메일</th>
		<th width="125px">우편번호</th>
		<th width="300px">주소</th>
		<th width="150px">전화</th>
		<th width="50px">선택</th>
	</tr>
	<c:forEach items="${memberList }" var="memberVO">
		<tr>
			<td>
				<c:choose>
					<c:when test='${memberVO.USEYN=="y" }'>
						<span style="color:blue">${memberVO.ID }</span>
					</c:when>
					<c:otherwise>
						<span style="color:red"><del>${memberVO.ID }</del></span><br>(비활성)
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test='${memberVO.USEYN=="y" }'>
						${memberVO.NAME }
					</c:when>
					<c:otherwise>
						<del>${memberVO.NAME }</del>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test='${memberVO.USEYN=="y" }'>
						${memberVO.EMAIL }
					</c:when>
					<c:otherwise>
						<del>${memberVO.EMAIL }</del>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test='${memberVO.USEYN=="y" }'>
						${memberVO.ZIP_NUM }
					</c:when>
					<c:otherwise>
						<del>${memberVO.ZIP_NUM }</del>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test='${memberVO.USEYN=="y" }'>
						${memberVO.ADDRESS }
					</c:when>
					<c:otherwise>
						<del>${memberVO.ADDRESS }</del>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test='${memberVO.USEYN=="y" }'>
						${memberVO.PHONE }
					</c:when>
					<c:otherwise>
						<del>${memberVO.PHONE }</del>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<c:choose>
					<c:when test='${memberVO.USEYN=="y" }'>
						<input type="checkbox" name="useyn" value="${memberVO.ID}" >
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="useyn" value="${memberVO.ID}" >
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>
</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="adminMemberList" />	
</jsp:include>


</article>


<%@ include file="../../include/admin/headerfooter/footer.jsp"%>