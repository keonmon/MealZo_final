<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>
<div id="mypageArticle2" style="width:100%; margin:150px 0 0 0; ">
<div style="width:100%; height:120px; margin:0 auto;
	background-color:green; color:white; line-height:120px; 
	padding:10px 30px; box-sizing: border-box;" >
	<b style="font-size:3em ">밀조의 특별한 이벤트🎉✨</b>
</div>
<form>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="now" />

<div>
	<c:forEach items="${eventListVO }" var="eventVO">
	<fmt:formatDate value="${eventVO.STARTDATE}" pattern="yyyy-MM-dd HH:mm:ss" var="start" />
	<fmt:formatDate value="${eventVO.ENDDATE}" pattern="yyyy-MM-dd HH:mm:ss" var="end" />
		<div id="eventList" ><!-- 이벤트 블록 -->
			<c:choose>
				<c:when test="${end < now }">
					<a href="#" onclick="return alert('종료된 이벤트입니다!')" style="text-decoration:none;">
				</c:when>
				<c:when test="${now < start }">
					<a href="#" onclick="return alert('진행전 이벤트입니다!')" style="text-decoration:none;">
				</c:when>
				<c:otherwise>
					<a href="mobileEventDetail?eseq=${eventVO.ESEQ}" >
				</c:otherwise>
			</c:choose>
			<!-- 이벤트 설명 -->
				<div width="100%" height="350px" style="display:block; margin-top:15px;">
					<div style="position:relative; width:100%; height:350px;">
						<c:choose>
							<c:when test="${end < now }">
								<div style="background-color:black; color:white; opacity:0.5; position:absolute; width:100%; height:100%; font-weight:2em;">
									<p style="font-size:5em; text-align:center; line-height:285px; margin:0;" >종료된 이벤트</p>
								</div>
							</c:when>
							<c:when test="${now < start }">
								<div style="background-color:black; color:white; opacity:0.5; position:absolute; width:100%; height:100%; font-weight:2em;">
									<p style="font-size:5em; text-align:center; line-height:285px; margin:0;" >진행전 이벤트</p>
								</div>
							</c:when>
						</c:choose>
						<img src="images/${eventVO.IMAGE1 }" style="width:100%; height:100%; object-fit:cover;">
					</div>
					<div style=" color:black; padding:10px 5px;">
						<ul style="text-decoration:none;  list-style:none; padding:0;">
							<li style="font-size:2em; font-weight:bold;">${eventVO.TITLE }</li>
							<li style="font-size:1.5em; color:grey; font-weight:light;">${eventVO.SUBTITLE}</li>
							<li style="font-size:2em; font-weight:light;">
								<fmt:formatDate value="${eventVO.STARTDATE}" type="date"/> ~ <fmt:formatDate value="${eventVO.ENDDATE}" type="date"/>
							</li>
						</ul>	
					</div>		
					<hr>
				</div></a><!-- 이벤트 설명 끝 -->
		</div><!-- 이벤트 블록 끝 -->
	</c:forEach>
</div>
</form>

  <div class="clear"></div>
	<jsp:include page="../../include/paging/productPaging.jsp">
		<jsp:param name="command" value="mobileEventList" />	
	</jsp:include>

</div>


<%@ include file="../include/headerfooter/mobileFooter.jsp" %>