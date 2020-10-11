/**
 * 
 */

//menu menubar scroll 영역///

$(window).scroll(function(event){
    if($(window).scrollTop() > $(".sns-btn-wrap-items-group").offset().top){

        $(".sns-btn-wrap-items").css("position","fixed");
    }
    else if(($(window).scrollTop)){
        $(".sns-btn-wrap-items").css("position","static");
    }
});

// <!-- $("#order-date option:selected").val(); -->
                          
// <!-- 여러개 선택시 Select box ID로 접근하여 여러 개 Value 값 가져오기.
$("#userListSB option:selected").attr('value2');
//value2에 userNumber 데이터
$("#userListSB option:selected").attr('value3');
//value3에 userPK 데이터 -->

// <!-- 텍스트읽어오기
// $("#userListSB option:selected").text(); -->
     
//------------------menugroup 날짜 선택시 출력하는 자바스크립트-----//
// $(window).event(function(event){
//     if($(window).click((e)=>{
        

//     })

// });

//------? img클릭시 상세정보창 표시 mouseDown을 이용해서 




// 날짜 선택창선택시 hidden에서 static으로 바뀌어 나타나게함.
$(".order_check_day").click(e=>{
    $(".order_check_day").toggle().css("transition",".5");
});
    // 목록 복사하는 자바스크립트
   function mouseClick(){
       $(".menu-title-choice-wrap").show().clone().insertAfter();
   }
   function mouseClick1(){
       $(".menu-title-choice-wrap").show().clone().insertAfter();
   }
   function mouseClick2(){
       $(".menu-title-choice-wrap").show().clone();
   }
   function mouseClick3(){
       $(".menu-title-choice-wrap").show().clone();
   }
   function mouseClick4(){
       $(".menu-title-choice-wrap").show().clone();
   }

//클릭시 창이 사라짐
function removeblock(e){
    $(e.target).parent().parent().remove();
}

//별점표시, 점수주기
$(function(){
const rating = $('.start_group');

rating.each(function(){
    const targetScore =$(this).attr('data-rate');
    console.log(targetScore);
    // $(this).find('img:nth-child(-n+'+targetScore+')').css({color:'red'});
    $(this).find('a:nth-child(-n+'+targetScore+')').css({color:'red'});
    
    
});
});


//gotoMainMenu();
function gotoMainMenu(){
	//페이지를 전환시켜주는명령어 실행
	location.replace("<%=request.getContextPath()%>/product/productList.jsp");
};
const pPrice = $("#pPrice").val();// 상품 가격
const pDiscount=$("#pDiscount").val();//할인 률
const pPoint= pPrice/pDiscount; //포인트 




//상품 name을 적용
//금액을 받아와야함.
//할인 률을 , 상품 이름 , 금액  갯수 적용 