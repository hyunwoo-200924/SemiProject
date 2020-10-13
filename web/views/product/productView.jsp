<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.eol.product.model.vo.Product" %>

<%
	Product p=(Product)request.getAttribute("Product");
%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/menu.css">  

<script defer>





</script>

	
	  <!-- <section -->
    <section  class="menu-container-group" onload="init();">
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
        <form class="text-container" name="form" method="post" action="">
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
                             <li class="text-menu"><%=p.getpServing() %></li>
                             <li class="text-menu"><%=p.getpCooktime() %></li>
                             <li class="text-menu"><%=p.getpReadytime() %><img src="<%=request.getContextPath() %>/images/product/mul.png" alt="상세설명"></li>
                             <li class="text-menu"><%=p.getpTaste() %></li>
                         </ul>
                         <dl class="text-items">판매가
                             <dd class="price text-right" name="pPrice" value="<%=p.getpPrice() %>" id="pPrice"><%=p.getpPrice() %><span>원</span></dd>
                         </dl>
                         <dl class="text-items">할인가
                             <dd class="price text-right" name="pDiscount" value="<%=p.getpDiscount() %>" id="pDiscount"><span>원</span></dd>
                         </dl>
                         <dl class="text-items">포인트적립
                             <dd  class="text-right" name="" id="pPoint" value="<%=p.getpDiscount() %>"><img src="<%=request.getContextPath() %>/images/product/mul.png" alt="정보" class="info-img"></dd>
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
                                 <label ><input type="radio" class="botton-group" name="choice-radio" id="cartPut();"checked>장바구니</input></label>
                                 <label ><input type="radio" class="botton-group" name="choice-radio" id="presentbtn();">선물하기</input></label>
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
                             <a  name="order-date" id="order-date">
                                 
                                 <div value="order-date01" class="order_check_day" id="selected_stock">    배송을  원하는 날짜를 고르세요. <span  style="display:hidden; font-size:25px;">√</span></div>
                                 
                                 <!-- 갯수를 30개로 가정하고 시작하자! -->
	                                
	                                 <div name="pOderday1" value="order-date01" class="order_check_day" id="order_check_day1" style="display:none;" onclick="mouseClick();">      9월 22일(화)
	                                     <span></span><span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;">√</span>
	                                 </div>
	                                 <div  name="pOderday1" value="order-date02" class="order_check_day" id="order_check_day2" style="display: none;" onclick="mouseClick1();">      9월 23일(수)
	                                     <span>개</span><span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;">√</span>
	                                 </div>
	                                 <div name="pOderday1" value="order-date03"class="order_check_day" id="order_check_day3" style="display: none;" onclick="mouseClick2();">       9월 24일(목)
	                                     <span>개</span><span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;">√</span>
	                                 </div>
	                                 <div name="pOderday1" value="order-date04" class="order_check_day" id="order_check_day4" style="display: none;" onclick="mouseClick3();">      9월 25일(금)
	                                     <span>개</span><span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;">√</span>
	                                 </div>
	                                 <div name="pOderday1" value="order-date05" class="order_check_day" id="order_check_day5" style="display: none;" onclick="mouseClick4();">      9월 26일(토)
	                                     <span>개</span ><span alt="체크" style="displa:none; font-size:25px; bold: 1000;" style="display:none;">√</span>
                                 </div>
                             </a>
                             
                             <script>
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
							/* 	//+_ 연산자
								var sell_price;
								var amount;
								
								function init () {
									sell_price = document.form.sell_price.value;
									amount = document.form.amount.value;
									document.form.sum.value = sell_price;
									change();
								}
								
								function add () {
									hm = document.form.amount;
									sum = document.form.sum;
									hm.value ++ ;
								
									sum.value = parseInt(hm.value) * sell_price;
								}
								
								function del () {
									hm = document.form.amount;
									sum = document.form.sum;
										if (hm.value > 1) {
											hm.value -- ;
											sum.value = parseInt(hm.value) * sell_price;
										}
								}
								
								function change () {
									hm = document.form.amount;
									sum = document.form.sum;
								
										if (hm.value < 0) {
											hm.value = 0;
										}
									sum.value = parseInt(hm.value) * sell_price;
								}  
										 */						
                             //// 날짜 출력
                             function gdate(){
					var sImg = "<IMG SRC=http://www.blueb.co.kr/SRC/javascript/image7/date/";
					var eImg = ".gif BORDER=0>";
					var now = new Date();
					var month = (now.getMonth() + 1);
					var date = now.getDate();
					var year = now.getYear();
						now = null;     month += "";     date += "";     year += "";
					var text = "";
					text += "<TABLE BGCOLOR=#000000 CELLPADDING=4><TR><TD>"; 
				
					for (var i = 0; i < year.length; ++i) {
						text += sImg + year.charAt(i) + eImg;
					}
						text += sImg + "slash" + eImg;
				
					for (var i = 0; i < month.length; ++i) {
						text += sImg + month.charAt(i) + eImg;
					}
						text += sImg + "slash" + eImg;
				
					for (var i = 0; i < date.length; ++i) {
						text += sImg + date.charAt(i) + eImg;
					}
					text += "</TD></TR></TABLE>";
					document.write(text);
					
					
				}

                            
                         /*      
                           //별점표시, 점수주기
                             $(function(){
                             const rating = $('.start_group');

                             rating.each(function(){
                                 const targetScore =$(this).attr('data-rate');
                                 console.log(targetScore);
                                 // $(this).find('img:nth-child(-n+'+targetScore+')').css({color:'red'});
                                 $(this).find('a:nth-child(-n+'+targetScore+')').css({color:'red'});
                                 
                                 
                             })
                             }); */
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
                                    

                                     
                                     <input type="hidden" class="product-price" name="sum"  value="" id="price" readonly><span>원<span></p>
                                     </div>
                                </div>
                                
                                 <!-- 날짜선택시 박스생성끝 -->
                                 <div class="product-price-number-group">
                                     <p class="producttextinput">수량
                                         <input type="text" class="product-nember" name="" value="1" max="<%=p.getpStock()%>"readonly> <span>개</span></input>
                                         
                                     </p>
                                     <p><input type="text" class="product-pricetag" id="total-price" ><span>원</span></input></p>
                                 </div>
                                		<script>
                                		//상품수량가격변경하기
                                		var $input2=$('.producttextinput'),
                                		$qytInput2=$input2.find('input');
                                		var $quantity=$('#quantity'),
                                		$unitprice= $quantity.attr('data-unitprice'),
                                		$qtyBtn=$quantity.find('span'),
                                		$qytInput=$quantity.find('input'),
                              
                                		$tagetTotal=$('#total-price'),
                                		$tagetTotal1=$('.product-price');
                                		
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
                                				 var total2= currentCount * $unitprice;
                                				$tagetTotal.text(total2+"원"); 
                                				$tagetTotal1.text(total2+"원");
                                		});
                                		</script>
                                
                                
                                 <!-- 찜 이미지 및 버튼 재배치함 9-26 -->
                                 
                                 <div class="jjim-btn-container">
                                    <a href=""><img src="<%=request.getContextPath() %>/images/product/hart40px.jpg" alt="찜" class="jjim"></a>
                                   	<a href="/cart/cart.jsp"><span class="jjim" style="font-size: 40px;width: 40px; height="40px;">♥</span></a>
                                 </div>
                                 <input type="button" class="cart-botton-items" id="buybtn()" onclick="location.replace('<%=request.getContextPath() %>/views/cart/cartViewServlet?pNo=<%=p.getpNo() %>')" value="장바구니">
                         </div>
                     </div>
             </form>
           
             <div class="etc_info_wrap">
                 <div class="review_btn_wrap">
                     <a href="#tab03" class="review_btn" id="review_btn" role="button">
                         <!-- 스크립트 요청사항: 클릭시 리뷰탭.on클래스 추가하고 #tab03으로 이동 -->
                         <div class="rating_wrap">
                             <span class="rating_star">
                                 <span class="star">
                                     <a class="start_group" data-rate="6">
                                         <span  alt="별모양" id="star1">★</span> 
                                         <span  alt="별모양" id="star1" >★</span>
                                         <span  alt="별모양" id="star1" >★</span>
                                         <span  alt="별모양" id="star1" >★</span>
                                         <span  alt="별모양" id="star1" >★</span>
                                     
                                         <span style="width:95.39999%;">
                                             <span class="hide">별점</span>
                                             <span class="num">0</span>
                                         </span>
                                     </a>
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
                <h2 class="resipy-h3-text-right"><img src="<%=request.getContextPath() %>/images/product/time30px.jpg" alt="조리시간"><%=p.getpCooktime() %></h2>
 
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