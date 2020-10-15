
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
    <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartintopay.do')">상품전체결제</button>
    <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartDeleteAll.do')">상품전체삭제</button>
   	</div>
   	</div>
    <section class="cart-section-block">
	        <%for(Cart c : memberCart){%>
           		<div class="cart-section-body-group2">
            	<div class="kkk">
               	<img src="<%=request.getContextPath() %>/upload/product/<%=c.getpImage1() %>" alt="상품이미지" style="width: 217px;height: 216px;">
                </div>
                <div>
                <p style="margin-left: 391px; font-size: 25px;"><%=c.getpName() %></p>
                <p style="margin-left: 396px; font-size: 25px;" class="cart-pricetext"><span>가격 :</span><%=c.getpPrice() %><span>원</span></p>
              	<div style="display: flex" class="count-con">
              	<p style="margin-left: 396px; font-size: 25px;">수량 :</p>
              	<!--<span  style="margin-left: 396px; font-size: 25px;" type="button" value="－" class="product-minus" id="plus">-</span>-->
               	<input style="border: none; font-size: 25px;" type="text" value="<%=c.getcQty() %>" class="pCount" readonly>
                <!--  <span  style=" font-size: 25px; margin-left: 78px" type="button" value="＋" class="product-plus" id="minus">+</span><span style="margin-left: 4px; font-size: 25px;">-->
                <span style="font-size: 25px; margin-left: -176px;"> 개</span>
                </div>
                <div style=" font-size: 25px; margin-left: 394px;"><P>배송 도착 예상 날짜 :<%=c.getoDeliveryEDate() %> </P></div>
                </div>
                <div class="bTnDiv" style="margin-left: -313px;margin-top: 178px;">
                <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/onecartintopay.do?cNo=<%=c.getcNo()%>')">상품결제</button>
    			<button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartDelete.do?pNo=<%=c.getpNo()%>')">상품삭제</button>
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
    <hr>
    <div style="display: flex; width: 100%; height: 500px;justify-content: center;margin-top: 193px;">
    	<h1>장바구니에 상품이 없습니다.</h1>
    </div>
<%} %>
<%@include file="/views/common/footer.jsp" %>