/*** 메인 슬라이더 ***/
var evennum = 0;
var space = 400
totalSlides = $('#sliderWrap ul li').length;	// 이미지 개수
sliderWidth = $('#sliderWrap').width();
$(document).ready(function(){
			// 전체 이미지 너비
	  
  /* 슬라이드 구조 */
	$('#sliderWrap').width(sliderWidth*totalSlides);
  
    // 다음 슬라이드
	$('#buttonR').click(function(){
		slideRight();
	});
  
	// 이전 슬라이드
	$('#buttonL').click(function(){
		slideLeft();
	});
  
  
  /* 슬라이더 설정 */
  var autoSlider = setInterval(slideRight, 3000);	//자동 슬라이드
  
  //슬라이드개수에 따른 하단 li추가
  $.each($('#sliderWrap ul li'), function() { 
     var li = document.createElement('li');
     $('#remote ul').append(li);    
  });
	//하단 li
	pagination();
	  
	//마우스 hover시 동작
	$('.slide_event').hover(
		function(){ 
		    clearInterval(autoSlider); 
		}, 
		function(){ 
			autoSlider = setInterval(slideRight, 3000); 
		}
  	);
});
	
	
/*** SLIDE LEFT ***/
function slideLeft(){
  evennum--;
  if(evennum==-1){ evennum = totalSlides-1; }
  $('#sliderWrap ul#images').css('left', -(sliderWidth*evennum + space));  
  pagination();
}

/*** SLIDE RIGHT ***/
function slideRight(){
  evennum++;
  if(evennum==totalSlides){ evennum = 0; }
  $('#sliderWrap ul#images').css('left', -(sliderWidth*evennum + space)); 
  pagination();
}
	
/* 하단 li 설정 */
function pagination(){
  $('#remote ul li').removeClass('active');
  $('#remote ul li:eq('+evennum+')').addClass('active');
}


/***신상 베스트 드래그 슬라이드 
let sliders = document.querySelectorAll(".slider_p");
let innerSliders = document.querySelectorAll(".wrap_box");
let presseds = [false,false];
let startx = [];
let x = [];
alert=('slider=' + sliders + '/inner='+innerSliders);
sliders.forEach((slider, index) => {
    slider.addEventListener("mousedown", e => {
        presseds[index] = true;
        startx[index] = e.offsetX - innerSliders[index].offsetLeft
        slider.style.cursor = "grabbing";
    })

    slider.addEventListener("mouseenter", () => {
        slider.style.cursor = "grab";
    })

    slider.addEventListener("mouseup", () => {
        slider.style.cursor = "grab";
    })

    window.addEventListener("mouseup", () => {
        presseds[index] = false;
    })

    slider.addEventListener("mousemove", e => {
        if (!presseds[index]) return;
        e.preventDefault();
        x[index] = e.offsetX;

        innerSliders[index].style.left = `${x[index] - startx[index]}px`
        checkboundary(index) 
    })
})


function checkboundary(index) {
    let outer = sliders[index].getBoundingClientRect()
    let inner = innerSliders[index].getBoundingClientRect()

    if (parseInt(innerSliders[index].style.left) > 0) {
        innerSliders[index].style.left = "0px"
    } else if (inner.right < outer.right) {
        innerSliders[index].style.left = `-${inner.width - outer.width}px`
    }
}	End 신상 베스트 드래그 슬라이드 ***/


/* index 신상 슬라이드*/
var nLocationNum = 0;
function nProduct_move(num,x){
    var imageLength= 40;
    
    if(num==-1) {
        if(nLocationNum==0){
            return;
        }
        nLocationNum--;
    }else{
        if(nLocationNum==4){
            return;
        }
        nLocationNum++;
    }
    var dist = imageLength * nLocationNum * (-1);
    document.getElementById("wrap_box1").style.left=dist+"vw";
} 



/* index 베스트 슬라이드 */
var bLocationNum = 0;
function bProduct_move(num,x){
    var imageLength= 40;
    
    if(num==-1) {
        if(bLocationNum==0){
            return;
        }
        bLocationNum--;
    }else{
        if(bLocationNum==4){
            return;
        }
        bLocationNum++;
    }
    var dist = imageLength * bLocationNum * (-1);
    document.getElementById("wrap_box2").style.left=dist+"vw";
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
			document.form1.action = "mobileCartInsert";
			document.form1.submit();
		}else{
			document.form1.action = "mobileCartList";
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
 	   const name = document.form1.quantity.value;
 	   const name2 = document.getElementById('price2').value;
 	   document.getElementById("result").innerText = (name * name2).toLocaleString('ko-KR')+"원";
    }
    
    
function add () {
	hm = document.form1.quantity;
	hm.value ++ ;
}

function del () {
	hm = document.form1.quantity;
	result = document.form1.result;
		if (hm.value > 1) {
			hm.value -- ;
			result.value = parseInt(hm.value) * pricee2;
		}
}
    
    
function go_search( comm ){
	if( document.formm.key.value == "" ){
		alert("검색어를 입력해주세요🤔");
	 	document.formm.key.focus();
	 	return;
	 	
	 }else{
		var url =  comm + "?sort=recently&sub=y&idx=0";   // 검색어로 검색한 결과의 1페이지로 이동
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


function go_order(){
   if(document.form1.quantity.value =="") {
      alert("수량을 입력하여 주세요.");
      documemt.form1.quantity.focus();
      }else if(document.form1.quantity.value=="0"){
       alert("수량을 입력해주세요");
       document.form1.quantity.focus();
     } else {
        var goOrder = confirm("해당 상품이 바로결제되었습니다\n나의쇼핑으로 이동하시겠습니까?");
        if(goOrder){
        document.form1.action = "orderInsert";
        document.form1.submit();
      }else{
        document.form1.action = "orderInsertReturn";
        document.form1.submit();
      }
   }
}

   
function printName() {
 	   const name = document.form1.quantity.value;
 	   const name2 = document.getElementById('price2').value;
 	   document.getElementById("result").innerText = (name * name2).toLocaleString('ko-KR')+"원";
    }
    
    
function add () {
	hm = document.form1.quantity;
	hm.value ++ ;
}

function del () {
	hm = document.form1.quantity;
	result = document.form1.result;
		if (hm.value > 1) {
			hm.value -- ;
			result.value = parseInt(hm.value) * pricee2;
		}
}