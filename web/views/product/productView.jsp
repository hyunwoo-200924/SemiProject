<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eol.product.model.vo.Product" %>
<%@ page import ="java.util.List" %>
<%@ page import ="com.eol.cart.model.vo.Cart" %>
<%@ page import="com.eol.member.model.vo.Member"%>
<%@ page import="com.eol.review.model.vo.Review" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
   Product p=(Product)request.getAttribute("Product");
Member loginMember2 = (Member)request.getSession().getAttribute("loginMember");
   Cart c=(Cart)request.getAttribute("Cart");
Review r=(Review)request.getAttribute("Review");
   
Date now = new Date();
Date day1=new Date(now.getTime()+(1000*60*60*24*-1));//어제 
Date day2 = new Date(now.getTime()+(1000*60*60*24*+1));//내일
Date day3= new Date(now.getTime()+1000*60*60*24*+2);//내일모레
Date day4= new Date(now.getTime()+1000*60*60*24*+3);//3일후
SimpleDateFormat sf = new SimpleDateFormat("MM월dd일 E요일");

String today =(String)sf.format(now);
 String Wednesday=sf.format(day1);
 String Thursday=sf.format(day2);
 String Friday=sf.format(day3);
 String Saturday=sf.format(day4);
%>
<script>
function day(){
   
   $(document).ready(function(){
      var date= new Date();
      
      var year= date.getFullYear();
      var month = date.getMonth()+1;
      var day= date.getDate();
      
      var dayoftheweek= date.getDay();
      
      if(month<10){
         month="0"+month;
      }
      
      if(day<10){
         day="0"+day;
      }
   console.log($('#Wednesday').append(date.getMonth()+"월"+(date.get()-1)+"일"));
   console.log(date.getMonth()+"요일");
   });
};

</script>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/menu.css">  
   
     <!-- <section -->
    <section  class="menu-container-group">
        <div class="menu-section">
      
            <div class="menu-container">
                
                <div class="img">
                   <iframe class="big_img" width="600" height="500" src="<%=request.getContextPath() %>/upload/product/<%=p.getpVideo() %>" frameborder="0" allow="accelerometer; autoplay;  picture-in-picture" allowfullscreen></iframe>
                   <div class="img-parents">
                     <div class="img-container">
                         <ul class="slideshow-container">
                             <li class="myslides1 fade">
                                 <iframe  data-target="" width="50" height="50" src="<%=request.getContextPath() %>/upload/product/<%=p.getpVideo() %>" frameborder="0" allow="accelerometer; gyroscope; picture-in-picture" allowfullscreen class="img-img-small0" alt="동영상"></iframe>
                               
                             </li>
                             <li class="active myslides1 fade">
                             
                                 <img src="<%=request.getContextPath() %>/upload/product/<%=p.getpImage1() %>"  data-target="cheeze-resipy-medium.gif" alt="이미지1" style="width: 50px; height: 50px;" class="img-img-small1">
                               
                             </li>
                             <li class="myslides1 fade">
                               
                                 <img src="<%=request.getContextPath() %>/upload/product/<%=p.getpImage2() %>" data-target="cheesechic.jpg" alt="이미지2" style="width: 50px; height: 50px;" class="img-img-small2">
                                 
                             </li>
                             <li class="myslides1 fade">
                 
                                 <img src="<%=request.getContextPath() %>/upload/product/<%=p.getpImage3() %>" data-target="cheezemenu.jpg" alt="이미지3" style="width: 50px; height: 50px;" class="img-img-small3">
                                
                             </li>
                         </ul>
                     </div>
                 </div>
                 <!-- 이미지칸 -->
                 </div>
            </div>
        </div>

        <div class="text-container" >


            <div class="text-container2">
                <div class="text-group">
                  <img src="<%=request.getContextPath() %>/images/product/new64.png" alt="new" id="new">
                </div>
            </div>
            <div class="text-group">
                      <h2 class="h2-text">
                      <%=p.getpDetailMain() %>
                     </h2>
                         <h3 class="h3-text">원산지: 상품정보 참조</h3>
                         <ul class="text-menu-group ">
                             <li class="text-menu"><%=p.getpServing() %>인분</li>
                             <li class="text-menu">&nbsp;조리 <%=p.getpCooktime() %>분</li>
                             <li class="text-menu">&nbsp;준비 <%=p.getpReadytime() %>분<img src="" alt=""></li>
                             <%if(p.getpTaste()==1){ %>
                                <li class="text-menu">보통 매운맛</li>
                             <%} else if(p.getpTaste()==2){ %>
                                <li class="text-menu">약간 매운맛</li>
                             <%} else if(p.getpTaste()==3){ %>
                                <li class="text-menu">적당히 매운맛</li>
                             <%} else if(p.getpTaste()==4){ %>
                                <li class="text-menu">아주 매운맛</li>
                             <%} %>
                         </ul>
                         <dl class=".menuview-text-items">
                            판매가
                             <dt class="price text-right" name="pPrice" id="ppPrice"><%=p.getpPrice() %>원</dt>
                         </dl>
                         <dl class=".menuview-text-items">
                            할인율
                             <dt class="price text-right" name="pDiscount" id="ppDiscount"><%=p.getpDiscount() %>%</dt>
                         <dl class=".menuview-text-items">
                               포인트적립
                             <dt  class="text-right" name="" id="pPoint">10%</dt>
                         </dl>
                         <dl class=".menuview-text-items">
                               배송방법 :
                                 <dt class="delivery text-right">선택배송</dt>
                             </dl>
                         <dl class=".menuview-text-items">
                                  배송비 :
                             <dt class="delivery" class="text-right">3000원    4만원이상 무료 </dt>
                         </dl>
                   </div>
                         <div class="container-wrap">
                             <div class="button-container">
                                 <!-- 날짜선택시 품목명 갯수 선택할 박스  생성. -->

                                 <label ><input type="radio" class="botton-group" name="choice-radio" id="cartPut();"checked>장바구니</input></label>
                                 <label ><input type="radio" class="botton-group" name="choice-radio" id="presentbtn();">선물하기</input></label>

                             </div>
                             <div class="etc_txt" id="cart_txt" style="display:block;">
                                 <span>주문 마감시간 오전 7시</span>
                              </div>
                              <script>
                                 
                              </script>
                                
                             </div>
                             
                             <!-- 제이쿼리 사용시 nextAll()로 이용하여 클릭하세요hidden을 static으로 -->
                             <a  name="order-date" id="order-date">
                                 
                                 <div value="order-date01" class="order_check_day" id="selected_stock">    배송을  원하는 날짜를 고르세요. <span  style="display:hidden; font-size:25px;"></span></div>
                                 
                                 <!-- 갯수를 30개로 가정하고 시작하자! -->
                                   
                                    <input name="oDeliveryEDate1" value="<%=Wednesday%>" class="order_check_day" id="Tuesday" style="display:none;" onclick="mouseClick();">
                                     <span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;"></span>
                                    </input>
                                    <input  name="oDeliveryEDate2" value="<%=today%>" class="order_check_day" id="Wednesday" style="display: none;" onclick="mouseClick1();">     
                                        <span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;"></span>
                                    </div>
                                    <input name="oDeliveryEDate3" value="<%=Thursday%>"class="order_check_day" id="Tursday" style="display: none;" onclick="mouseClick2();">    
                                      <span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;"></span>
                                    </input>
                                    <input name="oDeliveryEDate4" value="<%=Friday%>" class="order_check_day" id="Friday" style="display: none;" onclick="mouseClick3();">    
                                        <span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;"></span>
                                    </input>
                                    <input name="oDeliveryEDate5" value="<%=Saturday%>" class="order_check_day" id="Saturday" style="display: none;" onclick="mouseClick4();"><%=Saturday%>    
                                        <span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;"></span>
                                 </input>
                             </a>
                             
                             <script>
                            document.ready(function(){
                               
                             if($('#Tuesday').click()
                               
                            })
                          
                             
                             
                            //클릭시 슬라이드바 
                             $(function(){
                                $("#selected_stock").click(function(){
                                   $(this).nextAll().attr("display","none").slideToggle(500);
                                  
                                
                             });
                                
                             });
                                
                             // 목록 복사하는 자바스크립트
                             function mouseClick(){
                              
                                 $(".menu-title-choice-wrap").show().clone().insertAfter();
                             }
                             function mouseClick1(){
                                 $(".menu-title-choice-wrap").show().clone().insertAfter();
                             }
                             function mouseClick2(){
                                 $(".menu-title-choice-wrap").show().clone().insertAfter();
                             }
                             function mouseClick3(){
                                 $(".menu-title-choice-wrap").show().clone().insertAfter();
                             }
                             function mouseClick4(){
                                 $(".menu-title-choice-wrap").show().clone().insertAfter();
                             }
                           //클릭시 창이 사라짐
                             function removeblock(e){
                                 $(e.target).parent().parent().remove();
                             }      



                            
                              
             
                             </script>
                             
                             
                             
                             <!-- 날짜선택시 박스생성  
                                 display:none;을 주게되면 화면에 자리잡고있던 영역이 없어지면서 화면상에서 사라짐
                                 visibility:hidden은  확실히 요소는 보이지 않지만, 
                                 div 영역은 확실히 잡고 있습니다.-->
 
                             <div class="menu-title-choice-wrap" style="display:none;">
                                 <div class="menu-date-container-box1">
                                     <div class="menu-date-text">
                                         날짜 출력
                                     </div>
                                     <button type="button" class="menu-delivery-delete-btn" onclick="removeblock(event);">x</button>
                                 </div>
                                 <div class="menu-date-container-box2">
                                     <div class="menu-date-text" value=""><%=p.getpName()%>
                        
                                     </div>
                                     <div class="product-number-group" id="quantity" data-unitprice="2800" value=<%=p.getpPrice() %>>
                                    
                                         <span type="button" value="－" class="product-minus" id="plus">-</span>
                                         <input type="text" value="1" class="product-number" readonly>
                                         <span type="button" value="＋" class="product-plus" id="minus">+</span>
                                     </div>
                                    

                                     

                                     <p type="" class="product-price" readonly><span id="price">원<span></p>

                                     </div>
                                </div>
                                
                                 <!-- 날짜선택시 박스생성끝 -->
                                 <form class="product-price-number-group" name="form" method="post" action="<%=request.getContextPath()%>/views/cart/cartViewServlet?pNo=<%=p.getpNo()%>">
                                     <p class="producttextinput" name="">수량

                                         <input type="hidden" class="product-nember" name="pCount" value="currentCount" max="<%=p.getpStock()%>"readonly/>개
                                         <input type="hidden" name="pNo" value="<%=p.getpNo() %>">
                                     </p>
                                     <p><input type="text" class="product-pricetag" id="total-price" readonly><span>원</span></input></p>
                                 </form>
                                      <script>
                              ///슬라이드바 효과
                              
                        $(window).scroll(function(event){
                            if($(window).scrollTop() > $(".sns-btn-wrap-items-group").offset().top){
                        
                               /*  $(".sns-btn-wrap-items").css("position","fixed"); */
                                $(".sns-btn-wrap-items").css({position:"fixed"});
                            }
                            else if(($(window).scrollTop)){
                             /*    $(".sns-btn-wrap-items").css("position","static"); */
                                $(".sns-btn-wrap-items").css({position:"static"});
                            }
                        });

                                               
                                   
                                       var tdprice1=(parseInt(<%=p.getpPrice()%>));
                                       var discount=(parseInt(<%=p.getpDiscount()%>));
                                      var $tdprice= tdprice1-(tdprice1/discount);
                                       console.log("#ppPrice");

                                      //상품수량가격변경하기
                                      var $input2=$('.producttextinput'),
                                      $qytInput2=$input2.find('input');
                                      var $quantity=$('#quantity'),
                                      $unitprice= $quantity.attr('data-unitprice'),
                                      $qtyBtn=$quantity.find('span'),
                                      $qytInput=$quantity.find('input'),
                              
                                      $tagetTotal=$('#total-price'),
                                      $tagetTotal2=$('.product-price');
                                      
                                      //$atybtn클릭하면 그요소가 class명 prev있다면 참이고 (플러스를 클릭햇으면)
                              //aytinput value 기존값에서 1증가 거짓이면 (마이너스를 클릭햇으면 $qyinput value 기존값에서 1차감) 
                                      
                                      $qtyBtn.click(function(){
                                            var currentCount=$qytInput.val();//input의 값을 가져와서
                                         if($(this).hasClass('product-plus')){
                                            currentCount++;
                                            $qytInput.val(currentCount);
                                            $qytInput2.val(currentCount);
                                         }else{
                                            if(currentCount > 1){//최소한개는 사게 만들어준다.
                                               
                                      currentCount--;//값이 true면 마이너스해라
                                      $qytInput.val(currentCount);//다시 input에 값을 집어넣는다.
                                      $qytInput2.val(currentCount);
                                            }
                                         }
                                             //수량단가 변수 total에 저정하고 그걸 .price값으로 변경
                                             console.log("curren값 :"+currentCount);
                                             var total2=(parseInt((parseInt(currentCount)) * $tdprice));
                                             console.log("갯수x가격="+total2);
                                             console.log(currentCount);
                                            $tagetTotal.val(""+total2); 
                                            console.log($tagetTotal.val(total2));
                                            $tagetTotal2.text(total2+"원");
                                            

                                      });
                                      </script>
                                
                                
                                 <!-- 찜 이미지 및 버튼 재배치함 9-26 -->
                                 
                                 <div class="jjim-btn-container">
                                 
                                 
                                    <a href=""><img src="<%=request.getContextPath() %>/images/product/hart40px.jpg" alt="찜" class="jjim"></a>

                                   
                                    
                                    
                                    
                                <script>
                                   const basket1=(function cartPut(){
                                      $("input:radio[name='choice-radio']").attr("checked",true);
                                       location.replace('<%=p.getpName()%><%=request.getContextPath()%>/views/cart/cartViewServlet');
                                   });
                                    const basket2=(function presentbtn(){
                                      $("input:radio[name='choice-radio']").attr("checked",true);
                                       location.replace('<%=p.getpName()%><%=request.getContextPath()%>/views/cart/cartViewServlet');
                                   });
                                   function submitCart(){
                                      document.form.submit();
                                   }
                                </script>
                                
                           <%if( currentCount!=0) {%>
                                    <button type="button" class="cart-botton-items" id="buybtn" onclick="document.form.submit();">장바구니</buttton>
                           <% }%>
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
                                     <a class="start_group" data-rate="10" >
                                         <span  alt="별모양" id="star1">★</span> 
                                         <span  alt="별모양" id="star1" >★</span>
                                         <span  alt="별모양" id="star1" >★</span>
                                         <span  alt="별모양" id="star1" >★</span>
                                         <span  alt="별모양" id="star1" >★</span>
                                     
                                         <span style="width:95.39999%;">
                                             <span class="hide">별점</span>
                                             <span class="num" alt=""></span>
                                         </span>
                                         
                                     </a>
                                     <script>
                                     //별점표시, 점수주기
                                    $(function(){
                                     const rating = $('.num').text();
                                     console.log(rating);

                                     $(".start_group").each(function(){
                                         const targetScore = (parseInt($(this).attr('data-rate')));//형변환해주고 
                                         console.log(targetScore);//여기서 프리트해서 값확인
                                         $(".num").text(targetScore);//별점 출력
                                         //정수인지 아닌지 확인
                                         if(($(this).attr('data-rate'))!==targetScore){
                                            console.log("정수:참");
                                         }else console.log("문자열:거짓");
                                         // $(this).find('img:nth-child(-n+'+targetScore+')').css({color:'red'});
                                        $(this).find('a:nth-child(-n+'+targetScore+')').css({color:'#f00'});
                                           console.log(('a:nth-child(-n+'+targetScore+')'));
                                 console.log($(this).find('a:nth-child(-n+'+targetScore+')'));
                               })
                                     }); 
                                     

                                     </script>
                                     
                                     
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
                <img src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpDetailImage1() %>" alt="요리상품소개" class="resipy-img">
                <img src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpDetailImage2() %>" alt="요리상품소개" class="resipy-img">
                <img src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpDetailImage3() %>" alt="요리상품소개" class="resipy-img">
             </div>
            <div class="text-detail">
                   <h2 class="h2-text"><%=p.getpDetailTitle1()%></h2>
                     <p class="h2-text"><%=p.getpDetailContent1() %></p>
         </div>
         <div class="text-detail">
             <h2 class="h2-text"><%=p.getpDetailTitle2()%></h2>
               <p class="h2-text"><%=p.getpDetailContent2() %></p>
   </div>
        </div>
 
    </div>
    <!-- 요리 레시피 -->
    <div class="resipy-menu-detail-text">
        <div class="resipy-menu-detail-text-group">
         <div class="resipy-h3-text">
             <h2 class="resipy-h3-text-legft">이렇게 요리하세요</h2>
                <h2 class="resipy-h3-text-right"><img src="<%=request.getContextPath() %>/images/product/time30px.jpg" alt="조리시간">조리시간<%=p.getpCooktime() %>분</h2>
 
         </div>  
         <div class="resipy-imag-group-container-group">
 
             <div class="resipy-imag-group-container">
                 <img src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpRecipeImage1() %>" alt="레시피이미지1">   
                 
                 <h3>STEP
                     <h3>01</h3>
                 </h3>
                 <p><%=p.getpRecipeContent1() %></p>
                     
                     
                     
                 </div>
                 <div class="resipy-imag-group-container">
                     <img src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpRecipeImage2() %>" alt="레시피이미지2">   
                     
                     <h3>STEP
                         <h3>02</h3>
                     </h3>
                     <p><%=p.getpRecipeContent2() %></p>
                         
                         
                         
                     </div>
 
             <div class="resipy-imag-group-container">
                 <img src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpRecipeImage3() %>" alt="레시피이미지3">   
                 
                 <h3>STEP
                     <h3>03</h3>
                 </h3>
                 <p><%=p.getpRecipeContent3() %></p>
                     
                     
                     
                 </div>
                 <div class="resipy-imag-group-container">
                     <img src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpRecipeImage4() %>" alt="레시피이미지4">   
                     
                     <h3>STEP
                         <h3>04</h3>
                     </h3>
                     <p><%=p.getpRecipeContent4() %></p>
                         
                         
                         
                     </div>
                     
                 </div>
          </div>
    </div>
   

<%@ include file="/views/common/footer.jsp"%>