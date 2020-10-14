
<%@page import="java.util.ArrayList"%>
<%@page import="com.eol.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@
	page import="java.util.List,java.util.ArrayList,com.eol.product.model.vo.Product"
 %>
 <%
 		
 		List<Product> list = (List)request.getSession().getAttribute("nonCartList");
 %>
    
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/cart.css">
<%@include file="/views/common/header.jsp" %>

<div class="cart-section-container">
    <h2 class="cart-head-text"> 장바구니 </h2>
    <div class="cart-login-container">
    	<p>로그인을 하시면 장바구니에 담긴 상품을 나중에도 확인하실 수 있습니다.</p>
    	<form action="<%=request.getContextPath() %>/login.do" method="post">
    	<input type="submit" class="logBtn" value="로그인하기" >
    	</form>
    </div>
   <div class="btnClass">
   <button class="btn" onclick="inputproduct();">상품결제</button>
   <button class="btn">삭제</button>
   </div>
   <section class="cart-section-block">
	        <%for(Product p : list){%>
           		<div class="cart-section-body-group2">
            	<div class="kkk">
               	<img src="<%=request.getContextPath() %>/upload/product/<%=p.getpImage1() %>" alt="상품이미지" style="width:200px;height:150px;">
                </div>
                <div>
                <p><%=p.getpName() %></p>
                <p class="cart-pricetext"><%=p.getpPrice() %><span>원</span></p>
             	<p class="producttextinput">수량</p>
              	<span type="button" value="－" class="product-minus" id="plus">-</span>
               	<input style="border: none;" type="text" value="<%=p.getpCount() %>" class="product-number" readonly >
                <span type="button" value="＋" class="product-plus" id="minus">+</span>
                <span>개</span>
                </div>
<<<<<<< HEAD
=======
                <div class="btnClass">
	            <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartintopay.do')">상품결제</button>
	            <button class="btn">삭제</button>
            	</div>
>>>>>>> branch 'master' of https://github.com/hyunwoo-200924/SemiProject.git
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
            </label>
        </div>
		<%} %>
    </section>
</div>
<%@include file="/views/common/footer.jsp" %>