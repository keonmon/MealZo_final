<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>  
<%@ include file="../include/user/customerCenter_sidemenu.jsp" %>

<style type="text/css">
#eventList{margin-left:20px;}
#eventList:nth-child(1){margin:0;}
#eventList:nth-child(4){margin:0;}
#eventList:nth-child(7){margin:0;}
</style>
<article id="mypageArticle2" style="width:900px; max-width:900px;">
<h2 id="cancelTitle">이벤트</h2>
<form>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="now" />
<div>
	<ul id="event" style="list-style:none; padding:0;">
		<c:forEach items="${eventListVO }" var="eventVO">
		<fmt:formatDate value="${eventVO.STARTDATE}" pattern="yyyy-MM-dd HH:mm:ss" var="start" />
		<fmt:formatDate value="${eventVO.ENDDATE}" pattern="yyyy-MM-dd HH:mm:ss" var="end" />
			<div id="eventList" style="float:left; ">
			<c:choose>
				<c:when test="${end < now }">
					<a href="#" onclick="return alert('종료된 이벤트!')" style="text-decoration:none;">
				</c:when>
				<c:otherwise>
					<a href="eventDetail?eseq=${eventVO.ESEQ}" >
				</c:otherwise>
			</c:choose>
				<li >
					<div width="285px" height="350px" style="display:inline-block; margin-top:15px;">
						<div style="position:relative; width:285px; height:285px;">
							<c:choose>
								<c:when test="${end < now }">
									<div style="background-color:black; color:white; opacity:0.5; position:absolute; width:100%; height:100%; font-weight:2em;">
										<p style="font-size:3em; text-align:center; line-height:285px; margin:0;" >종료된 이벤트</p>
									</div>
								</c:when>
							</c:choose>
							<img src="images/${eventVO.IMAGE1 }" style="width:100%; height:100%;">
						</div>
						<div style=" color:black; padding:10px 5px;">
							<ul style="text-decoration:none;  list-style:none; padding:0;">
								<li style="font-size:1.2em;">${eventVO.TITLE }</li>
								<li style="font-size:1em; color:grey; font-weight:light;">${eventVO.SUBTITLE}</li>
								<li style="font-size:1.2em; font-weight:light;">
									<fmt:formatDate value="${eventVO.STARTDATE}" type="date"/> ~ <fmt:formatDate value="${eventVO.ENDDATE}" type="date"/>
								</li>
							</ul>	
						</div>		
					</div>
				</li>
				<c:choose>
				<c:when test="${end < now }">
					</a>
				</c:when>
				<c:otherwise>
					</a>
				</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</ul>

</div>
</form>

  <div class="clear"></div>
	<jsp:include page="../include/paging/paging.jsp">
		<jsp:param name="command" value="eventList" />	
	</jsp:include>

</article>


<%@ include file="../include/user/headerfooter/footer.jsp" %>