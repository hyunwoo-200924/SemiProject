
<%@page import="java.util.ArrayList"%>
<%@page import="com.eol.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@
	page import="java.util.List,java.util.ArrayList,com.eol.product.model.vo.Product"
 %>
 <%
 		
 %>
    
 <link file="<%=request.getContextPath()%>/css/cart.css">   
<%@include file="/views/common/header.jsp" %>

<!-- cartpage -->
   <!-- section -->
<div class="cart-section-container">
    <h2 class="cart-head-text"> 장바구니 </h2>
    <section class="cart-section-block">
        <div class="cart-section-body">
            <div class="cart-section-body-group1">
                <label for=""><input type="radio">
            </div>
	           		
	           
	            <div class="cart-section-body-group2">
	               <img src="<%=request.getContextPath() %>/upload/product/" alt="상품이미지" style="width:200px;height:150px;">
	
	            </div>
	            <div class="cart-section-body-group3">
	                <p>zzzz</p>
	            </div>
	            <div class="cart-section-body-group3">
	                <select class="cart-selection" aria-placeholder="1" style="width:180px;height: 40px;">
	                    
	                </select>
            </div>
            <div class="cart-section-body-group4">
                <p class="cart-pricetext"><span>원</span></p>

            </div>
            <div class="product-number-group" id="quantity" data-unitprice="2800" value="#">
             	<p class="producttextinput">수량</p>
              	<span type="button" value="－" class="product-minus" id="plus">-</span>
               	<input style="border: none;" type="text" value="#" class="product-number" readonly >
                <span type="button" value="＋" class="product-plus" id="minus">+</span>
                <span>개</span>
            </div>
           <%--  <div class="product-price-number-group">
                 <p class="producttextinput">수량</p>
                 <input type="text" class="product-nember" name="" value="1" max="<%=p.getpCount() %>"readonly> <span>개</span></input>
                 <input type="text" class="product-pricetag" id="total-price" ><span>원</span></input>
            </div> --%>
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
            </label>
        </div>
        
            <div class="cart-btn">
                <!-- 선택상품클릭시 선택상품만 전체선택 -->
               <button class="btn">전체선택</button>
               <button class="btn">선택삭제</button>
               <!-- 상품 결제는 무조건 배송일이 같은 날로 선택되어 있는 상품끼리만 한번에 묶어서 결제 가능 -->
               <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartintopay.do')">상품결제</button>
            </div>
    </section>
</div>

<%@include file="/views/common/footer.jsp" %>