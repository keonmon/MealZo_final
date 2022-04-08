function go_Event_Delete(){
	if(confirm('삭제하면 복구할 수 없습니다. \n 정말로 이벤트를 삭제하시겠습니까?')){
		document.frm.action="adminEventDelete";
		document.frm.submit();
	}
}

function go_askview(aseq) {
   location.href ="adminAskDetail?aseq=" + aseq;
}


function go_askrep(){
if(document.form5.content_r.value==""){
alert("내용을 입력해주세요");
document.form5.content_r.focus();
return false;
}
if(confirm('등록하시겠습니까?')){
   document.form5.action="adminAskRepSave";
   document.form5.submit();
}
}


function go_review_delete(){
   var count = 0; 
   
   if(document.frm6.rseq.length==undefined){   
      if( document.frm6.rseq.checked == true )
         count++;
   }else{
      for( var i=0; i< document.frm6.rseq.length ; i++){
         if( document.frm6.rseq[i].checked == true )
            count++;
      }if(confirm("정말 삭제하시겠습니까?") == true ){
      }else {
        return false;
      }
   }   
   if( count == 0 ){
      alert("삭제할 항목을 선택해주세요");
   } else{
      document.frm6.action = "adminReviewDelete";
       document.frm6.submit();
   }
}


function go_wrt_Notice(){
document.frm.action="adminNoticeInsertForm";
   document.frm.submit();

}


function go_Notice(){
document.frm1.action="adminNoticeInsert";
   document.frm1.submit();

}



function go_Event_Insert(){
		if(confirm('이벤트를 저장하시겠습니까?')){
			document.frm.action = "adminEventInsert";
			document.frm.submit();
	}
}


function go_wrt_Event(){
	document.frm.action="adminEventInsertForm";
	document.frm.submit();
}


function go_Product_Del(){
	if(confirm('정말로 해당 상품을 삭제하시겠습니까?')){
		document.frm1.action = "adminProductDelete";
		document.frm1.submit();
	}
}

function go_Product_Update(){
	if(confirm('수정하시겠습니까?')){
		document.frm1.action = "adminProductUpdate";
		document.frm1.submit();
	}
}

function go_view(qseq) {
   location.href ="adminQnaDetail?qseq=" + qseq;
}

function go_wrt_Product(){
	document.frm.action = "adminProductWriteForm";
	document.frm.submit();
}

function cal(){
	if(document.frm1.price2.value == "" || document.frm1.price1.value=="") return;
	document.frm1.price3.value = document.frm1.price2.value - document.frm1.price1.value;
}

function go_Product_Save(){
	var theForm = document.frm1;
	if(confirm('상품을 등록하시겠습니까?')){
		theForm.action = "adminProductWrite";
		theForm.submit();
	}
	
}

function go_order_save(){
	var result = document.frm.result;
	var orderListSelect = document.getElementById("orderListSelect");
	
	// 현재 화면에 보여지고 있는 주문들의 체크박스가 몇 개 체크되었는지 갯수를 count한다.
	if(result == null){
		alert("주문처리 가능한 항목이 없습니다.");
		return;
	}else{
		var resultConfirm = confirm("선택된 항목을 정말 '" + orderListSelect.options[orderListSelect.selectedIndex].text + "'로 변경하시겠습니까?");
		if(resultConfirm){
			var count = 0;
			if(result.length == undefined){ // 체크박스가 총 1개인 경우.
				if(result.checked == true){
					count++;
				}
			}else{ // 체크박스가 2개 이상인 경우
				for(var i = 0; i<result.length; i++){
					if(result[i].checked == true){
						count++;
					}
				}
			}
			//if(document.frm.resulted.length==undefined || (document.frm.resulted.length != 0 ))
			
			//alert(count);
			// count 값이 0이면, 더 진행하지 않고 orderList.jsp로 되돌아간다.
			if( count == 0 ){
				alert("주문처리할 항목을 선택하세요.")
				return;
			}else{
				// count 값이 1 이상이면, 현재 폼의 체크박스 value값을 갖고, command = adminOrderSave로 이동
				document.frm.action = "adminOrderSave?selectedIndex="+orderListSelect.options[orderListSelect.selectedIndex].value;
				document.frm.submit();
			}
			// 처리하고(주문의 result값을 '1'->'2'로 변경) orderList.jsp로 되돌아온다.
		}
	}	
}


function go_member_save(){
	var useyn = document.frm.useyn;
	var memberSelect = document.getElementById("memberSelect");
	
	// 현재 화면에 보여지고 있는 주문들의 체크박스가 몇 개 체크되었는지 갯수를 count한다.
	if(useyn == null){
		alert("처리 가능한 항목이 없습니다.");
		return;
	}else{
		var useynConfirm = confirm("선택된 항목을 정말 '" + memberSelect.options[memberSelect.selectedIndex].text + "'로 변경하시겠습니까?");
		if(useynConfirm){
			var count = 0;
			if(useyn.length == undefined){ // 체크박스가 총 1개인 경우.
				if(useyn.checked == true){
					count++;
				}
			}else{ // 체크박스가 2개 이상인 경우
				for(var i = 0; i<useyn.length; i++){
					if(useyn[i].checked == true){
						count++;
					}
				}
			}
			//if(document.frm.resulted.length==undefined || (document.frm.resulted.length != 0 ))
			
			//alert(count);
			// count 값이 0이면, 더 진행하지 않고 orderList.jsp로 되돌아간다.
			if( count == 0 ){
				alert("회원을 선택하세요.")
				return;
			}else{
				// count 값이 1 이상이면, 현재 폼의 체크박스 value값을 갖고, command = adminOrderSave로 이동
				// alert("선택된 회원이 '"+ memberSelect.options[memberSelect.selectedIndex].text + "'으로 변경되었습니다");
				document.frm.action = "adminMemberSave?selectedIndex="+memberSelect.options[memberSelect.selectedIndex].value;
				document.frm.submit();
			}
			// 처리하고(주문의 result값을 '1'->'2'로 변경) orderList.jsp로 되돌아온다.
		}
	}	
}


function go_notice_save(){
	var checkBox_nseq = document.frm.checkBox_nseq;
	var noticeSelect = document.getElementById("noticeSelect");
	
	// 현재 화면에 보여지고 있는 주문들의 체크박스가 몇 개 체크되었는지 갯수를 count한다.
	if(checkBox_nseq == null){
		alert("처리 가능한 항목이 없습니다.");
		return;
	}else{
		var useynConfirm = confirm("선택된 항목을 정말 '" + noticeSelect.options[noticeSelect.selectedIndex].text + "'로 변경하시겠습니까?");
		if(useynConfirm){
			var count = 0;
			if(checkBox_nseq.length == undefined){ // 체크박스가 총 1개인 경우.
				if(checkBox_nseq.checked == true){
					count++;
				}
			}else{ // 체크박스가 2개 이상인 경우
				for(var i = 0; i<checkBox_nseq.length; i++){
					if(checkBox_nseq[i].checked == true){
						count++;
					}
				}
			}
			//if(document.frm.resulted.length==undefined || (document.frm.resulted.length != 0 ))
			
			//alert(count);
			// count 값이 0이면, 더 진행하지 않고 orderList.jsp로 되돌아간다.
			if( count == 0 ){
				alert("변경할 게시물을 선택하세요.")
				return;
			}else{
				// count 값이 1 이상이면, 현재 폼의 체크박스 value값을 갖고, command = adminOrderSave로 이동
				// alert("선택된 게시물이 '"+ noticeSelect.options[noticeSelect.selectedIndex].text + "'으로 변경되었습니다");
				document.frm.action = "adminNoticeSave?selectedIndex="+noticeSelect.options[noticeSelect.selectedIndex].value;
				document.frm.submit();
			}
			// 처리하고(주문의 result값을 '1'->'2'로 변경) orderList.jsp로 되돌아온다.
		}
	}	
}

function go_Notice_Edit(){
	if(confirm('수정하시겠습니까?')){
		document.frm1.action = "adminNoticeUpdate";
		document.frm1.submit();
	}
}

function go_Event_Edit(){
		if(confirm('수정하시겠습니까?')){
			document.frm.action = "adminEventUpdate";
			document.frm.submit();
		}
	}

function go_view(qseq) {
   location.href ="adminQnaDetail?qseq=" + qseq;
}

function go_rep(qseq){
if(document.form4.reply.value==""){
alert("내용을 입력해주세요");
document.form4.reply.focus();
return false;
}
if(confirm('등록하시겠습니까?')){	
document.form4.action="adminQnaRepSave";
   document.form4.submit();
   }
   }

function go_Update(pseq){
	var url = 'adminProductUpdateForm?pseq='+ pseq;
	document.frm.action = url;
	document.frm.submit();
}

function go_search( comm ){
	if( document.frm.key.value == "" ){
		alert("검색버튼 사용시에는 검색어 입력이 필수입니다");
	 	return;
	 }
	var url = comm + "?page=1";   // 검색어로 검색한 결과의 1페이지로 이동
	document.frm.action = url;
	document.frm.submit();
}

function go_total( comm ){
	document.frm.key.value="";
	document.frm.action = comm + "?page=1";
	document.frm.submit();
}

function go_qnaupdate(qseq){
if(confirm('수정하시겠습니까?')){
document.form4.action="adminQnaUpdate";
   document.form4.submit();
}
}


function go_askupdate(){
if(document.form5.content_r.value==""){
alert("내용을 입력해주세요");
document.form5.content_r.focus();
return false;
}
	if(confirm('수정하시겠습니까?')){
	document.form5.action="adminAskUpdate";
	   document.form5.submit();
	}
}

function go_Mov(){
	var theForm = document.frm1;
	if(confirm('상품등록을 취소하시겠습니까?')){
		location.href="adminProductList";
	}
}




function go_product_save(){
	var checkBox_pseq = document.frm.checkBox_pseq;
	var productSelect = document.getElementById("productSelect");
	
	// 현재 화면에 보여지고 있는 주문들의 체크박스가 몇 개 체크되었는지 갯수를 count한다.
	if(checkBox_pseq == null){
		alert("처리 가능한 항목이 없습니다.");
		return;
	}else{
		var useynConfirm = confirm("선택된 항목을 정말 '" + productSelect.options[productSelect.selectedIndex].text + "'로 변경하시겠습니까?");
		if(useynConfirm){
			var count = 0;
			if(checkBox_pseq.length == undefined){ // 체크박스가 총 1개인 경우.
				if(checkBox_pseq.checked == true){
					count++;
				}
			}else{ // 체크박스가 2개 이상인 경우
				for(var i = 0; i<checkBox_pseq.length; i++){
					if(checkBox_pseq[i].checked == true){
						count++;
					}
				}
			}
			//if(document.frm.resulted.length==undefined || (document.frm.resulted.length != 0 ))
			
			//alert(count);
			// count 값이 0이면, 더 진행하지 않고 orderList.jsp로 되돌아간다.
			if( count == 0 ){
				alert("상품을 선택하세요.")
				return;
			}else{
				// count 값이 1 이상이면, 현재 폼의 체크박스 value값을 갖고, command = adminOrderSave로 이동
				alert("선택된 상품이 '"+ productSelect.options[productSelect.selectedIndex].text + "'으로 변경되었습니다");
				document.frm.action = "adminProductSave?selectedIndex="+productSelect.options[productSelect.selectedIndex].value;
				document.frm.submit();
			}
			// 처리하고(주문의 result값을 '1'->'2'로 변경) orderList.jsp로 되돌아온다.
		}
	}	
}


function go_rep2(nqseq){
  if(document.form4.reply.value==""){
    alert("내용을 입력해주세요");
    document.form4.reply.focus();
    return false;
  }
  if(confirm('등록하시겠습니까?')){	
    document.form4.action="adminnmQnaRepSave";
    document.form4.submit();
  }
}


function go_banner_save(){
	var numarr = "num";
	var cnt = document.getElementsByName("num");
	var name = document.getElementsByName("name");
	var image = document.getElementsByName("image");
	var totalCnt = 0;
	let dupYn = false;
	// alert(cnt[3].value);
	for(let i = 0; i < cnt.length; i++) {
		const currElem = cnt[i].value;
	  		if(currElem === "") {
	  			alert("비어있는 번호가 있습니다.");
	  			return false;
	  		}
	  	for(let j = i+1; j < cnt.length; j++) {
	  		if(currElem === cnt[j].value) {
	     		dupYn = true;
	     		break;
	    	}
	  	}
	  	
	  	if(dupYn)  {
	 		alert("중복된 공지 번호가 있습니다.");
	     	return false;
	  	}else{
	  		//여기에 공란검사
	  		// 비어있는 제목 검사
		  	for(let i = 0; i < cnt.length; i++) {
			const nameCheck = name[i].value;
		  		if(nameCheck === "") {
		  			alert("비어있는 제목이 있습니다.");
		  			return false;
		  		}
		  	}
		  	// 비어있는 이미지 검사
		  	for(let i = 0; i < cnt.length; i++) {
			const imageCheck = image[i].value;
		  		if(imageCheck === "") {
		  			alert("저장되지 않은 이미지가 있습니다.");
		  			return false;
		  		}
		  	}
	  	}
	}
  	if(confirm('배너 설정을 적용하시겠습니까?')){
	  	document.frm.action = "bannerSave";
	  	document.frm.submit();
	}
}

function imageLoad(num){
		var opt = "toolbar=no, menubar=no, resizable=no, width=450,height=200"; 
		window.open('imageLoad?num='+num, 'selectimg', opt);
}
