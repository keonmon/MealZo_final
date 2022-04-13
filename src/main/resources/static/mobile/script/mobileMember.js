
//로그인 
function loginCheck(){
	 if(document.loginFrm.id.value==""){
		alert("아이디는 필수 입력사항입니다");
		document.loginFrm.id.focus();
		document.contractFrm.action = "mobileLogin";
	}
	if(document.loginFrm.pwd.value==""){
		alert("비밀번호를 입력하세요");
		document.loginFrm.pwd.focus();
		document.contractFrm.action = "mobileLogin";
	}
	document.contractFrm.action = "mobileLogin";
	document.contractFrm.submit();
}

function go_next(){
if( document.contractFrm.okon[1].checked == true ){ 
	alert("회원약관에 동의하셔야 회원으로 가입이 가능합니다");
	} else {
		document.contractFrm.action = "mobileJoinForm";
		document.contractFrm.submit();
	}
}


//회원가입

function idcheck(){
if( document.joinForm.id.value=="" ){
		alert("아이디를 입력하고 중복체크를 진행하세요" );
		document.joinForm.id.focus();
		return;
	}
	var url = "mobileIdcheck?id=" + document.joinForm.id.value;
	var opt = "toolbar=no, menubar=no, resizable=no, width=90%, height=90%, scrollbars=no";
	window.open(url, "mobileIdCheck", opt);	
}

function idok( id ){
	opener.joinForm.id.value = id;
	opener.joinForm.reid.value = id;
	self.close();
}

function post_zip(){
	var url = "mobileFindZipNum";
	var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550,";
	opt = opt + " height=300, top=300, left=300";
	window.open( url, "우편번호 찾기", opt );
}

function result( zipNum, sido, gugun, dong){
	opener.document.joinForm.zip_num.value=zipNum;
	opener.document.joinForm.addr1.value=sido+" "+gugun+" "+dong;
	self.close();
}

function go_save(){
	if (document.joinForm.id.value == "") {
		alert("아이디를 입력하여 주세요."); 	    
	    document.joinForm.id.focus();
	} else if(document.joinForm.reid.value != document.joinForm.id.value){
		alert("아이디 중복확인을 하지 않았습니다");		
		document.joinForm.id.focus();
	} else if(document.joinForm.pwd.value == "") {
	    alert("비밀번호를 입력해 주세요.");	    
	    document.joinForm.pwd.focus();
	} else if(document.joinForm.pwd.value != document.joinForm.pwdCheck.value) {
	    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");	    
	    document.joinForm.pwd.focus();
	} else if(document.joinForm.name.value == "") {
	    alert("이름을 입력해 주세요.");	    
	    document.joinForm.name.focus();
	} else if(document.joinForm.email.value == "") {
	    alert("이메일을 입력해 주세요.");	   
	    document.joinForm.email.focus();
	} else{
		document.joinForm.action = "mobileJoin";
	    document.joinForm.submit();
	}
}


// 여기서추가 2.15~

function findCheck(){
	if(document.IdForm.security.value==""){
		alert("보안문자를 입력하지 않았습니다");
		return false;
	}
	if(document.IdForm.idx.value=="1"){
		if(document.IdForm.security.value!="02524") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="2"){
		if(document.IdForm.security.value!="09785") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="3"){
		if(document.IdForm.security.value!="12298") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="4"){
		if(document.IdForm.security.value!="14830") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="5"){
		if(document.IdForm.security.value!="30747") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="6"){
		if(document.IdForm.security.value!="31082") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="7"){
		if(document.IdForm.security.value!="43517") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="8"){
		if(document.IdForm.security.value!="57177") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="9"){
		if(document.IdForm.security.value!="70028") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="10"){
		if(document.IdForm.security.value!="77057") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	if(document.IdForm.idx.value=="11"){
		if(document.IdForm.security.value!="79397") {
			alert("보안문자가 일치하지 않습니다");
			return false;
		}	
	}
	
	if(document.IdForm.name.value==""){
      alert("이름은 필수 입력사항입니다");
      document.IdForm.name.focus();
      return false;
   }
   	
   	var selected2 = $("#selected2").val();
	if(selected2 == "pwd"){
		if(document.IdForm.id.value==""){
     	 alert("아이디는 필수 입력사항입니다");
     	 document.IdForm.id.focus();
     	 return false;
		}
	}
	
	var selected = $("#selected").val();
	if(selected == "email"){
		if(document.IdForm.email.value==""){
	      alert("이메일은 필수 입력사항입니다");
	      document.IdForm.email.focus();
	      return false;
	    }
	}else{
		if(document.IdForm.phone.value==""){
	      alert("휴대폰은 필수 입력사항입니다");
	      document.IdForm.phone.focus();
	      return false;
	    }
	}
   	document.IdForm.action = "mobileFindIdStep1";
   	document.IdForm.submit();
}

function go_update(){
	if (document.joinForm.pwd.value == "") {
	    alert("비밀번호를 입력해 주세요.");
	    document.joinForm.pwd.focus();
	}else if ((document.joinForm.pwd.value != document.joinForm.pwdCheck.value)) {
	    alert("비밀번호가 일치하지 않습니다.");
	    document.joinForm.pwd.focus();
	}else if (document.joinForm.name.value == "") {
	    alert("이름을 입력해 주세요.");
	    document.joinForm.name.focus();
	} else if (document.joinForm.email.value == "") {
	    alert("이메일을 입력해 주세요.");
	    document.joinForm.email.focus();
	}else {
	    document.joinForm.action = "mobileMemberUpdate";
	    document.joinForm.submit();
		
		
	}
}

function go_mypage(){
	document.joinForm.action = "mobileMypageForm";
	document.joinForm.submit();
}

function withdrawalConfirm(){
	var answer = confirm("회원탈퇴를하면 장바구니 및 이용내역이 모두 없어집니다. 탈퇴하시겠습니까?");
	if( answer ){
	location.href="mobileWithdrawal";
	}
}

function checknum() {
		document.IdForm.action = "mobileFindIdStep2";
		document.IdForm.submit();
	}

