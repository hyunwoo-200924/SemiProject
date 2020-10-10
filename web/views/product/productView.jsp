<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/menu.css">    
<script>
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

</script>
<%@ include file="/views/common/header.jsp"%>
	
	  <!-- <section -->
    <section  class="menu-container-group">
        <div class="section">
            <div class="container">
                
                <div class="img">
                   <iframe class="big_img" width="600" height="500" src="img\beefstake.mp4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                   <div class="img-parents">
                     <div class="img-container">
                         <ul class="slideshow-container">
                             <li class="myslides fade">
                                 <iframe  data-target="img\cheese.mp4" width="50" height="50" src="img\cheese.mp4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="img-img-small" alt="동영상"></iframe>
                               
                             </li>
                             <li class="myslides fade">
                             
                                 <img src="img\cheesechic.jpg"  data-target="cheeze-resipy-medium.gif" alt="이미지1" style="width: 50px; height: 50px;" class="img-img-small">
                               
                             </li>
                             <li class="myslides fade">
                               
                                 <img src="D:\programwork\semiProject\img\cheesechic.jpg" data-target="cheesechic.jpg" alt="이미지2" style="width: 50px; height: 50px;" class="img-img-small">
                                 
                             </li>
                             <li class="myslides fade">
                 
                                 <img src="D:\programwork\semiProject\img\cheezemenu.jpg" data-target="cheezemenu.jpg" alt="이미지3" style="width: 50px; height: 50px;" class="img-img-small">
                                
                             </li>
                         </ul>
                     </div>
                 </div>
                 <!-- 이미지칸 -->
                 </div>
            </div>
        </div>
        <div class="text-container">
            <div class="text-container2">
                <div class="text-group">
                  <img src="img\new64.png" alt="new" id="new">
                </div>
            </div>
            <div class="text-group">
                      <h2 class="h2-text">
                         양념닭고기와 쫄깃한 떡과 치즈까지
                         눈꽃치즈닭갈비
                     </h2>
                         <h3 class="h3-text">원산지: 상품정보 참조</h3>
                         <ul class="text-menu-group ">
                             <li class="text-menu">3인분</li>
                             <li class="text-menu">조리20분</li>
                             <li class="text-menu">준비50분<img src="img\mul.png" alt="상세설명"></li>
                             <li class="text-menu">적당히매운맛</li>
                         </ul>
                         <dl class="text-items">판매가
                             <dd class="price text-right" name="P_">35,000<span>원</span></dd>
                         </dl>
                         <dl class="text-items">할인가
                             <dd class="price text-right">35,000<span>원</span></dd>
                         </dl>
                         <dl class="text-items">포인트적립
                             <dd  class="text-right">0.5% <img src="img\mul.png" alt="정보" class="info-img"></dd>
                         </dl>
                         <dl class="text-items">배송방법 :
                                 <dd class="delivery text-right">선택배송</dd>
                             </dl>
                         <dl class="text-items">배송비:
                             <dd class="delivery" class="text-right">3000원    4만원이상 무료 </dd>
                         </dl>
                         </div>
                         <div class="container-wrap">
                             <div class="button-container">
                                 <!-- 날짜선택시 품목명 갯수 선택할 박스  생성. -->
                                 <label for=""><input type="radio" class="botton-group" name="choice-radio" id="cartPut()" checked>장바구니</input></label>
                                 <label for=""><input type="radio" class="botton-group" name="choice-radio" id="presentbtn()">선물하기</input></label>
                             </div>
                             <div class="etc_txt" id="cart_txt" style="display:block;">
                                 <span>주문 마감시간 오전 7시</span>
                              </div>
                              
                              <!-- $("#order-date option:selected").val(); -->
                              
                           <!-- 여러개 선택시 Select box ID로 접근하여 여러 개 Value 값 가져오기.
                             $("#userListSB option:selected").attr('value2');
                             //value2에 userNumber 데이터
                             $("#userListSB option:selected").attr('value3');
                             //value3에 userPK 데이터 -->
                             
                             <!-- 텍스트읽어오기
                                 $("#userListSB option:selected").text(); -->
                                
                             </div>
                             
                             <!-- 제이쿼리 사용시 nextAll()로 이용하여 클릭하세요hidden을 static으로 -->
                             <a type="" name="order-date" id="order-date">
                                 
                                 <div value="order-date01" class="order_check_day">    배송을  원하는 날짜를 고르세요. <img src="D:\programwork\semiProject\img\check25.jpg" alt="체크" hidden></div>
                                 
                                 <!-- 갯수를 30개로 가정하고 시작하자! -->
                                 <div value="order-date00" class="order_check_day" style="display: none;">    배송을  원하는 날짜를 고르세요. <img src="D:\programwork\semiProject\img\check25.jpg" alt="체크" hidden></div>
                                 <div value="order-date01" class="order_check_day" id="order_check_day1" style="display:none;" onclick="mouseClick();">      9월 22일(화)
                                     <span>5개!</span><img src="D:\programwork\semiProject\img\check25.jpg" alt="체크" >
                                 </div>
                                 <div value="order-date02" class="order_check_day" id="order_check_day2" style="display: none;" onclick="mouseClick1();">      9월 23일(수)
                                     <span>5개!</span><img src="D:\programwork\semiProject\img\check25.jpg" alt="체크" >
                                 </div>
                                 <div value="order-date03"class="order_check_day" id="order_check_day3" style="display: none;" onclick="mouseClick2();">       9월 24일(목)
                                     <span>2개!</span><img src="D:\programwork\semiProject\img\check25.jpg" alt="체크" >
                                 </div>
                                 <div value="order-date04" class="order_check_day" id="order_check_day4" style="display: none;" onclick="mouseClick3();">      9월 25일(금)
                                     <span>0개!</span><img src="D:\programwork\semiProject\img\check25.jpg" alt="체크" >
                                 </div>
                                 <div value="order-date05" class="order_check_day" id="order_check_day5" style="display: none;" onclick="mouseClick4();">      9월 26일(토)
                                     <span>2개</span><img src="D:\programwork\semiProject\img\check25.jpg" alt="체크" >
                                 </div>
                             </a>
                             <!-- 날짜선택시 박스생성  
                                 display:none;을 주게되면 화면에 자리잡고있던 영역이 없어지면서 화면상에서 사라짐
                                 visibility:hidden은  확실히 요소는 보이지 않지만, 
                                 div 영역은 확실히 잡고 있습니다.-->
 
                             <div class="menu-title-choice-wrap" style="display:none;">
                                 <div class="menu-date-container-box1">
                                     <div class="menu-date-text">
                                         날짜 출력
                                     </div>
                                     <button class="menu-delivery-delete-btn" onclick="removeblock(event);">x</button>
                                 </div>
                                 <div class="menu-date-container-box2">
                                     <div class="menu-date-text">
                                         돼지맥적구이
                                     </div>
                                     <div class="product-number-group">
                                         <input type="button" value="－" class="product-minus">
                                         <p value="0" class="product-number">0</p>
                                         <input type="button" value="＋" class="product-plus">
                                     </div>
                                     
                                     <p class="product-price">23,000<span>원<span></p>
                                     </div>
                                </div>
                                 <!-- 날짜선택시 박스생성끝 -->
                                 <div class="product-price-number-group">
                                     <p>수량
                                         <span class="product-nember">0 <span>개</span></span>
                                         
                                     </p>
                                     <p><span class="product-pricetag">0<span>원</span></span></p>
                                 </div>
                                 <!-- 찜 이미지 및 버튼 재배치함 9-26 -->
                                 
                                 <div class="jjim-btn-container">
                                    <a href=""><img src="D:\programwork\semiProject\img\hart.jpg" alt="찜" class="jjim"></a>
                                    <button class="cart-botton-items" id="buybtn()">장바구니</button>
                                    
                                 </div>
                             
                         </div>
                     </div>
             </div>
           
             <div class="etc_info_wrap">
                 <div class="review_btn_wrap">
                     <a href="#tab03" class="review_btn" id="review_btn" role="button">
                         <!-- 스크립트 요청사항: 클릭시 리뷰탭.on클래스 추가하고 #tab03으로 이동 -->
                         <div class="rating_wrap">
                             <span class="rating_star">
                                 <span class="star">
                                     <div class="start_group" data-rate="6">
                                         <a src="img\starb50px.png" alt="별모양" id="star1">★</a> </a>
                                         <a src="img\starb50px.png" alt="별모양" id="star1" >★</a>
                                         <a src="img\starb50px.png" alt="별모양" id="star1" >★</a>
                                         <a src="img\starb50px.png" alt="별모양" id="star1" >★</a>
                                         <a src="img\starb50px.png" alt="별모양" id="star1" >★</a>
                                     
                                         <span style="width:95.39999%;">
                                             <span class="hide">별점</span>
                                             <span class="num">0</span>
                                         </span>
                                     </div>
                                     <!-- 백그라운드 커스텀 영역 -->
                                     <!-- background image활성화영역 20%에 한개씩 점수가 채워짐 -->
                                 </span>
                             </span>
                         </div>
                     </a>
                 </div>
                 <div class="sns_btn_wrap">
                     <!-- 자바스크립트 영역 a태그에 기능추가 -->
                     <div class="sns-btn-wrap-items-group">
 
                         <div class="sns-btn-wrap-items" style="top:0px;background-color: white;width:1270px;height: 50px; border-bottom: 2px solid #333;">
                             
                                 
                                     <span class="hide span-text"><a href="">리뷰바로가기</a></span>
                                     
                                     <span class="span-text">리뷰수
                                         <em>0</em>
                                     </span>
                  
                                
                                     <!-- 클릭시 상세탭에 div#recipe_wrap영역으로 이동 -->
                                     <span class="span-text">
                                         <a href="#">
                                             레시피
                                         
                                         </a>
                                     </span>
                                     
                                     <span  class="span-text">   
                                     <a href="#" data-control="modal" role="button">
                                             공유하기
                                         </a>
                                     </span>
                                 </div>
                             </div>
                         </div>
             </div>
             <!-- 마케팅 영역 -->
         </div> 
    </section>
    <!-- 요리이미지및 상세 설명 -->
    <div class="section-detail">
        <div class="section-detail-container">
            <div class="resipy-img-group">
                <img src="img\gambas.gif" alt="요리상품소개" class="resipy-img">
                <img src="img\gamas3.jpg" alt="요리상품소개" class="resipy-img">
                <img src="img\gambas2.jpg" alt="요리상품소개" class="resipy-img">
             </div>
            <div class="text-detail">
                   <h2 class="h2-text">눈꽃치즈 닭갈비</h2>
                     <p class="h2-text">
                         춘천 명동거리의 닭갈비골목 부럽지 않은 쿡킷 닭갈비를 소개해드려요. 쫄깃한 닭다리살을 먹기좋은 형태로 잘라, 매콤하면서도 계속 생각나는 양념, 그리고 닭갈비의 맛과 재미를 높이는 고구마, 양배추, 당근, 깻잎, 양파, 떡사리, 그리고 눈꽃치즈까지 신선한 상태 그대로 보내드려요.</p>
         </div>
         <div class="text-detail">
             <h2 class="h2-text">맛있는 양념이 배인 닭고기와 아삭한 양배추, 달달한 고구마에 쫄깃한 떡까지</h2>
               <p class="h2-text">
                 매운 정도가 자극적이지 않아 맛있게 먹을 수 있죠. 매운 맛을 좋아하신다면 함께 보내드리는 고춧가루를 기호에 맞게 첨가해드세요. 집에서도 푸짐하고 맛있게 드실 수 있으니 아이들에게는 치즈를 더 뿌려주고, 부부는 시원한 맥주 한 잔 기울이시면 행복한 저녁 한 끼가 될거에요.</p>
   </div>
        </div>
 
    </div>
    <!-- 요리 레시피 -->
    <div class="resipy-menu-detail-text">
        <div class="resipy-menu-detail-text-group">
         <div class="resipy-h3-text">
             <h2 class="resipy-h3-text-legft">이렇게 요리하세요</h2>
                <h2 class="resipy-h3-text-right"><img src="D:\programwork\semiProject\img\time30px.jpg" alt="조리시간">10분</h2>
 
         </div>  
         <div class="resipy-imag-group-container-group">
 
             <div class="resipy-imag-group-container">
                 <img src="D:\programwork\semiProject\img\cheeze-resipy-small.jpg" alt="레시피이미지1">   
                 
                 <h3>STEP
                     <h3>01</h3>
                 </h3>
                 <p>달궈진 프라이팬에 양념에 재운 닭다리살과 혼합채소Ⅰ [고구마, 당근], 떡사리를 넣고 중불에 약 4분, 센 불에 약 4분간 볶아줍니다.</p>
                     
                     
                     
                 </div>
                 <div class="resipy-imag-group-container">
                     <img src="D:\programwork\semiProject\img\cheeze-resipy-small3.jpg" alt="레시피이미지1">   
                     
                     <h3>STEP
                         <h3>02</h3>
                     </h3>
                     <p>양배추, 혼합채소II[깻잎, 대파], 혼합채소III [양파, 홍고추]를 넣고 센 불에 약 4분간 더 볶아줍니다.
                         *기호에 따라 동봉되어 있는 참기름을 추가하여 섞어주세요.</p>
                         
                         
                         
                     </div>
 
             <div class="resipy-imag-group-container">
                 <img src="D:\programwork\semiProject\img\cheeze-resipy-small4.jpg" alt="레시피이미지1">   
                 
                 <h3>STEP
                     <h3>03</h3>
                 </h3>
                 <p>닭다리살과 고구마가 다 익으면 전자레인지용 그릇에 옮겨 담아 치즈를 뿌려줍니다.
                     *전자레인지 조리가 어려우신 경우, 2)에 치즈를 뿌리고 살짝 열을 가해 치즈를 녹여주세요.</p>
                     
                     
                     
                 </div>
                 <div class="resipy-imag-group-container">
                     <img src="D:\programwork\semiProject\img\GAMBAS_RESIPY1.jpg" alt="레시피이미지1">   
                     
                     <h3>STEP
                         <h3>04</h3>
                     </h3>
                     <p>3)을 전자레인지에 넣고 약 3분간 치즈가 녹을 때까지 조리해서 완성합니다.</p>
                         
                         
                         
                     </div>
                     
                 </div>
          </div>
    </div>
	

<%@ include file="/views/common/footer.jsp"%>