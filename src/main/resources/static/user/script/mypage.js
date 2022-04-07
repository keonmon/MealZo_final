

// orderListDetail.jsp에서 주문취소하는 메서드
function go_cancel(){
if(document.frm.orderCancel == null){ 
	alert("주문처리할 항목이 없습니다.") 
	return; 
}else{ 
	var count = 0; 
	if(document.frm.orderCancel.length == undefined){	// 체크박스가 총 1개인 경우. 
		if(document.frm.orderCancel.checked == true){ 
			count++; 
		} 
	}else{ // 체크박스가 2개 이상인 경우 
		for(var i = 0; i<document.frm.orderCancel.length; i++){
			if(document.frm.orderCancel[i].checked == true){ 
				count++; 
			}
		}
	} 
	//if(document.frm.resulted.length==undefined || (document.frm.resulted.length != 0 )) 
		//alert(count); 
		
	// count 값이 0이면, 더 진행하지 않고 orderList.jsp로 되돌아간다. 
	if( count == 0 ){ 
		alert("주문취소할 항목을 선택하세요.") 
		return; 
	}else{ 
	//count 값이 1 이상이면, 현재 폼의 체크박스 value값을 갖고, command = adminOrderSave로 이동 
		document.frm.action = "orderCancelUpdate"; 
		document.frm.submit(); 
	} 
	// 처리하고(주문의 result값을 '1'->'2'로 변경) orderList.jsp로 되돌아온다. 
}
}
function unsubscribe(siseq){
	var delete_confirm = confirm("정말로 구독 서비스를 해제하시겠습니까?");
	if(delete_confirm){
		alert("구독 서비스가 해제되었습니다.");
		location.href="myUnsubscribe?siseq=" + siseq;
	}else{
		alert("구독 서비스 해제가 취소되었습니다");
	}	
}

function deleteReview(rseq){
	var delete_confirm = confirm("삭제된 후기는 복구할 수 없습니다.\n정말로 삭제하시겠습니까?");
	if(delete_confirm){
		alert("해당 상품의 후기가 삭제되었습니다.");
		location.href="myReviewDelete?rseq=" + rseq;
	}else{
		alert("삭제가 취소되었습니다");
	}	
}

function review(){
if(document.formr.content.value==""){
  alert("내용을 입력해주세요");
  document.formr.content.focus();
  return false;
  }
if(confirm("등록하시겠습니까? 등록 후 수정이 불가능합니다 ")){
 alert("등록");
document.form.submit();
}else {alert("취소")
   document.formr.content.focus();
   return false;
}
}

function go_cart_delete(){
   var count = 0; 
   
   if(document.form4.cseq.length==undefined){   
      if( document.form4.cseq.checked == true )
         count++;
   }else{
      for( var i=0; i< document.form4.cseq.length ; i++){
         if( document.form4.cseq[i].checked == true )
            count++;
      }if(confirm("정말 삭제하시겠습니까?") == true ){
      }else {
        return false;
      }
   }   
   if( count == 0 ){
      alert("삭제할 항목을 선택해주세요");
   } else{
      document.form4.action = "cartDelete";
       document.form4.submit();
   }
}

function go_order_insert(){
	document.form4.action="orderInsert";
	document.form4.submit();
}

function checknmPwd(nqseq){
	if((document.formm.pwd.value != document.formm.checkpwd.value)) {
		alert("비밀번호가 일치하지 않습니다");
	return false;
	}else{
	document.formm.action = "nmqnaView?nqseq=" + nqseq;
	document.formm.submit();
	}
}
