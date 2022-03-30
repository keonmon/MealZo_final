<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>  

<%@ include file="../include/user/mypage_sidemenu.jsp" %>

<article id="mypageArticle2" style="width:900px; max-width:900px;">
	<h2 id="cancelTitle">상품문의 상세</h2>
	<div>
		<form>
			<div style="margin-bottom:20px;">
				<table width="100%" >
					<%-- <c:set var="avo" value="myAskOne"/> --%>
					<tr>
						<th>문의상품</th>
						<td  style="padding:5px 10px; margin:0 auto;">
							<a href="meal.do?command=productDetail&pseq=${maskVO.PSEQ}" style="color: black; font-weight: bold;"> 
								<div>
									<img src="images/${maskVO.IMAGE}" width="100px"  />
									${maskVO.PNAME}
									<fmt:formatNumber value="${maskVO.PRICE2}" pattern="###,###,###"/>원
								</div>
							</a>
						</td>
						<th>등록일</th>
						<td align="left" style="padding: 5px 10px;">
						<fmt:formatDate value="${maskVO.INDATE_A}" type="both" /></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3" style="padding: 5px 10px;">${maskVO.TITLE}</td>
						</tr>
						
						<tr>
						<th>질문내용</th>
						<td colspan="3" align="left" style="padding:5px 10px;">
							${maskVO.CONTENT_A}
						</td>
					</tr>
				</table>
				</div>
				<c:choose>
					<c:when test="${maskVO.INDATE_R ne null}">
						<div style=" height:150px; ">
							<table width="100%" style="" >
								<tr>
									<th colspan="2" style="font-size:1em;">관리자 답변</th>
								</tr>
								<tr>
									<th>답변 등록일</th>
									<td align="left" style="padding:5px 10px;">
										<fmt:formatDate	value="${maskVO.INDATE_R}" type="date" />
									</td>
								</tr>
								<tr>
									<th>답변 내용</th>
									<td align="left" style="padding:5px 10px;">
										${maskVO.CONTENT_R}
									</td>
								</tr>
							</table>
						</div>
					</c:when>
					<c:otherwise >
						<div style="text-align:center; height:150px; font-size:2em; line-height:150px; background:#99DE67; ">
							아직 답변이 입력되지 않았습니다..😥<br>
						</div>
					</c:otherwise>
				</c:choose>
			<div class="clear"></div>
		</form>
	</div>
</article>

<%@ include file="../include/user/headerfooter/footer.jsp"%>