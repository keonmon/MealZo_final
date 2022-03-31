<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../include/admin/headerfooter/header.jsp"%>
<%@ include file="../../include/admin/sideMenu.jsp"%>

<article id="mypageArticle2" style="width:950px; max-width:950px;">

<h1>이벤트 관리</h1>
<form name="frm" method="post" >
	<table>
		<tr><td width="642">제목검색<input type="text" name="key" value="${key }">
			<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search('adminEventList');">
			<input class="btn" type="button" name="btn_total" value="전체보기" onclick="go_total('adminEventList');">
			<input class="btn" type="button" name="btn_write" value="새 이벤트 등록" onclick="go_wrt_Event();"></td>
		</tr>
	</table>


<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="now" />
<table id="tableContainer" style="text-align:center;" width="90%">
	<tr><th width="50px">No.</th>
		<th width="230px">제목</th>
		<th width="230px">이벤트 기간</th>
		<th width="130px">게시일</th>
		<th width="130px">진행</th>
	<c:forEach items="${eventListVO }" var="eventList">
	<fmt:formatDate value="${eventList.startdate}" pattern="yyyy-MM-dd HH:mm:ss" var="start" />
	<fmt:formatDate value="${eventList.enddate}" pattern="yyyy-MM-dd HH:mm:ss" var="end" />
		<tr>
			<td>
			<a href="meal.do?command=adminEventDetail&eseq=${eventList.eseq }" style="text-decoration:none;">
				<c:choose>
					<c:when test="${end < now }">
						<span style="font-weight:bold; color:red">${eventList.eseq }</span>
					</c:when>
					<c:when test="${start < now && end > now }">
					 	<span style="font-weight:bold; color:black">${eventList.eseq }</span>
					 </c:when>
					<c:otherwise>
						<span style="font-weight:bold; color:blue">${eventList.eseq }</span>
					</c:otherwise>
				</c:choose>
			</a>
			</td>
			<td style="text-align:left">
				<a href="meal.do?command=adminEventDetail&eseq=${eventList.eseq }" style="text-decoration:none;">
					${eventList.title }
				</a>
			</td>
			<td>
			<a href="meal.do?command=adminEventDetail&eseq=${eventList.eseq }" style="text-decoration:none;">
				<fmt:formatDate value="${eventList.startdate}" type="date"/> ~ <fmt:formatDate value="${eventList.enddate}" type="date"/>
			</a>
			</td>
			<td>
			<a href="meal.do?command=adminEventDetail&eseq=${eventList.eseq }" style="text-decoration:none;">
				<fmt:formatDate value="${eventList.writedate }" type="date"/>
			</a>
			</td>
			<td>
			<a href="meal.do?command=adminEventDetail&eseq=${eventList.eseq }" style="text-decoration:none;">
				<c:choose>
					<c:when test="${end < now }">
						<span style="font-weight:bold; color:red">종료된 이벤트</span>
					</c:when>
					<c:when test="${start < now && end > now }">
						<span style="font-weight:bold; color:black">이벤트 진행중</span>
					</c:when>
					<c:otherwise>
						<span style="font-weight:bold; color:blue">이벤트 진행 전</span>
					</c:otherwise>
				</c:choose>
			</a>
			</td>
			</tr>
	</c:forEach>
</table>
</form>

<div class="clear"></div>
<jsp:include page="../paging/paging.jsp">
	<jsp:param name="command" value="meal.do?command=adminEventList" />	
</jsp:include>

</article>

<%@ include file="../../include/admin/headerfooter/footer.jsp"%>
