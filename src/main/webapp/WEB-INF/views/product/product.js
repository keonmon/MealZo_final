/* index.jsp */
var nLocationNum = 0;
function nProduct_move(num,x){
    var imageLength= 308;
    
    if(num==-1) {
        if(nLocationNum==0){
            return;
        }
        nLocationNum--;
    }else{
        if(nLocationNum==2){
            return;
        }
        nLocationNum++;
    }
    var dist = imageLength * nLocationNum * (-1);
    document.getElementById("wrap_box1").style.left=dist+"px";
}
/* index.jsp */
var bLocationNum = 0;
function bProduct_move(num,x){
    var imageLength= 308;
    
    if(num==-1) {
        if(bLocationNum==0){
            return;
        }
        bLocationNum--;
    }else{
        if(bLocationNum==2){
            return;
        }
        bLocationNum++;
    }
    var dist = imageLength * bLocationNum * (-1);
    document.getElementById("wrap_box2").style.left=dist+"px";
}

/* index.jsp */
var spacenum= -400;
var evennum = 0;
function autoSlide(){
	window.setInterval(function(){
		var dist = -2000 * evennum + spacenum;
		document.getElementById("images").style.left=dist+"px";
		evennum++;
		if(evennum==7) evennum=0;
	},4000);
}
/* autoSlide()가 딜레이 없게 하기 위해 만듦 */
function startInterval(){
	var dist = -2000 * evennum + spacenum;
	document.getElementById("images").style.left=dist+"px";
	evennum++;
	return autoSlide();
}

function go_cart(){
   if(document.form1.quantity.value =="") {
      alert("수량을 입력하여 주세요.");
      documemt.form1.quantity.focus();
      }else if(document.form1.quantity.value=="0"){
       alert("수량을 입력해주세요");
       document.form1.quantity.focus();
   } else {
   		var goCart = confirm("해당 상품이 장바구니에 추가되었습니다\n장바구니로 이동하시겠습니까?");
   		if(goCart){
			document.form1.action = "meal.do?command=cartInsert";
			document.form1.submit();
		}else{
			document.form1.action = "meal.do?command=cartInsertReturn";
			document.form1.submit();
		}
   }
}


/* productForm.jsp */

$(function(){
 $('li:eq(0)');
 $('li:eq(1)');
 
 
  $('li').click(function(){
           var num=$(this).index() + 1;
           var selectName ='#content' + num;
            $('.contents').hide();
            $(selectName).show();
       });
   });
   
function printName() {
 	   const name = document.getElementById('quantity').value;
 	   const name2 = document.getElementById('price2').value;
 	   document.getElementById("result").innerText = (name * name2).toLocaleString('ko-KR')+"원";
    }
    
    
    
    
function go_search( comm ){
	if( document.formm.key.value == "" ){
		alert("검색버튼 사용시에는 검색어 입력이 필수입니다");
	 	document.formm.key.focus();
	 	return;
	 	
	 }else{
		var url = "meal.do?command=" + comm + "&sort=recently&sub=y&idx=0";   // 검색어로 검색한 결과의 1페이지로 이동
		document.formm.action = url;
		document.formm.submit();
	}
	 sessionStorage.clear();
}

function enterkey() {
    if (window.event.keyCode == 13) {
    	 go_search('productAllForm');
    }
}

