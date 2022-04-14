<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/mobileMainHeader.jsp"%>
<%@ include file ="../include/sidemenu/sidemenu.jsp"%>


<div id=subpageContainer>
<div id="my_greeting">
<span id="my_greeting_text">${loginUser.NAME} 님의 MYPAGE입니다.</span>
<span class="material-icons" id="userSettingIcon" onclick="location.href='mobileUpdateForm'">manage_accounts</span>
</div>
<div id="orderTotalView">
	<div style="font-size:3em;">주문내역</div>
	<ul id="my_orderButtons">
		<li><a href="mobileOrderList">주문/배송조회</a></li>
		<li><a href="mobileOrderCancelForm?id=${loginUser.id}">주문취소내역</a></li>
		<li><a href="mobileReviewForm">나의 상품후기</a></li>
	</ul>
</div>

<div id="mypageView">
	<ul id="mypageView_Buttons">
		<li><a href="mobileQnaForm">
				<div>나의 Q&amp;A
					<span id="mypage_nextIcon" class="material-icons" >arrow_forward_ios</span>
				</div>
		</a>
		</li>
		<li><a href="mobileReviewForm">
				<div>나의 상품문의
					<span id="mypage_nextIcon" class="material-icons" >arrow_forward_ios</span>
				</div>				
		</a>
		</li>
	</ul>
	<ul id="mypageView_Buttons">
		<li><a href="mobileUpdateForm">
				<div>회원정보 수정
					<span id="mypage_nextIcon" class="material-icons" >arrow_forward_ios</span>
				</div>
			</a>
		</li>
		<li><a href="withDrawal" onclick="return confirm('<확인>을 누를시 일정기간 후 사용기록이 모두 삭제됩니다, 정말 회원탈퇴 하시겠습니까?')">
				<div>회원탈퇴하기
		<span id="mypage_nextIcon" class="material-icons" >arrow_forward_ios</span>
				</div>
			</a>
		</li>
	</ul>

</div>
</div>

<div class="clear"></div>

<%@ include file="../include/headerfooter/mobileFooter.jsp"%>