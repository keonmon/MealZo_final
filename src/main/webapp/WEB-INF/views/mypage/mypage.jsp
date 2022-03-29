<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/user/headerfooter/header.jsp" %>  

<%@ include file="../include/user/mypage_sidemenu.jsp" %>
<div id=subpageContainer>
<div id="my_greeting">
<span id="my_greeting_text">${loginUser.NAME} 님의 MYPAGE입니다.</span>
<span class="material-icons" id="userSettingIcon" onclick="location.href='meal.do?command=editForm'">manage_accounts</span>
</div>
<div id="orderTotalView">
	<div>주문내역</div>
	<ul id="my_orderButtons">
		<li><a href="orderListForm">주문/배송조회</a></li>
		<li><a href="orderCancelForm?id=${loginUser.id}">주문취소내역</a></li>
		<li><a href="reviewForm">나의 상품후기</a></li>
	</ul>
</div>

<div id="mypageView">
	<ul id="mypageView_Buttons">
		<li><a href="qnaList">
				<div>나의 Q&amp;A
					<span id="mypage_nextIcon" class="material-icons" >arrow_forward_ios</span>
				</div>
		</a>
		</li>
		<li><a href="askForm">
				<div>나의 상품후기
					<span id="mypage_nextIcon" class="material-icons" >arrow_forward_ios</span>
				</div>				
		</a>
		</li>
	</ul>
	<ul id="mypageView_Buttons">
		<li><a href="editForm">
				<div>회원정보 수정
					<span id="mypage_nextIcon" class="material-icons" >arrow_forward_ios</span>
				</div>
			</a>
		</li>
		<li><a href="noticeList">
				<div>고객센터로 이동
		<span id="mypage_nextIcon" class="material-icons" >arrow_forward_ios</span>
				</div>
			</a>
		</li>
	</ul>

</div>
</div>

<div class="clear"></div>


<%@ include file="../include/user/headerfooter/footer.jsp" %> 


