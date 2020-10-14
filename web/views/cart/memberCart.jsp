
<%@page import="java.util.ArrayList"%>
<%@page import="com.eol.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@
	page import="java.util.List,java.util.ArrayList,com.eol.cart.model.vo.Cart"
 %>
 <%
 		
 		List<Cart> memberCart = (List)request.getSession().getAttribute("memberCart");
 		
 		
 %>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cart.css">
<%@include file="/views/common/header.jsp" %>

<%if(!memberCart.isEmpty()){ %>
	<div class="cart-section-container">
    <h2 class="cart-head-text"> 장바구니 </h2>
    <div class="btnClass">
    <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartintopay.do')">상품결제</button>
    <button class="btn">삭제</button>
   	</div>
   	</div>
    <section class="cart-section-block">
	        <%for(Cart c : memberCart){%>
           		<div class="cart-section-body-group2">
            	<div class="kkk">
               	<img src="<%=request.getContextPath() %>/upload/product/<%=c.getpImage1() %>" alt="상품이미지" style="width:200px;height:150px;">
                </div>
                <div>
                <p style="margin-left: 396px; font-size: 25px;"><%=c.getpName() %></p>
                <p style="margin-left: 396px; font-size: 25px;" class="cart-pricetext"><span>가격 :</span><%=c.getpPrice() %><span>원</span></p>
              	<div style="display: flex" class="count-con">
              	<span  style="margin-left: 396px; font-size: 25px;" type="button" value="－" class="product-minus" id="plus">-</span>
               	<input style="border: none; font-size: 25px;" type="text" value="<%=c.getcQty() %>" class="pCount" readonly>
                <span  style=" font-size: 25px; margin-left: 78px" type="button" value="＋" class="product-plus" id="minus">+</span><span style="margin-left: 4px; font-size: 25px;">개</span>
                </div>
                <div style=" font-size: 25px; margin-left: 394px;"><P>배송 도착 예상 날짜 : </P></div>
                </div>
            	</div>
            <script>
            $(function(){
            	$('.product-minus').click(function(e){
            	e.preventDefault();
            	var stat = $('.pCount').val();
            	var num = parseInt(stat,10);
            	num--;
            	if(num<=0){
            	alert('더이상 줄일수 없습니다.');
            	num =1;
            	}
            	$('.pCount').val(num);
            	});
            	$('.product-plus').click(function(e){
            	e.preventDefault();
            	var stat = $('.pCount').val();
            	var num = parseInt(stat,10);
            	num++;

            	$('.pCount').val(num);
            	});
            	});
               </script>
            </label>
		<%} %>
    </section>
<%}else{ %>
	<div class="cart-section-container">
    	<h2 class="cart-head-text"> 장바구니 </h2>
    </div>
<%} %>
<%@include file="/views/common/footer.jsp" %>