
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
   <%if(list.isEmpty()){ %>
   	
   <%}else{ %>
   <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartintopay.do')">상품전체결제</button>
   <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartDeleteAll.do')">상품전체삭제</button>
   <%} %>
   </div>
   </div>
   <section class="cart-section-block">
	        <%for(Product p : list){%>
           		<div class="cart-section-body-group2">
            	<div class="kkk">
               	<img src="<%=request.getContextPath() %>/upload/product/<%=p.getpImage1() %>" alt="상품이미지" style="width: 217px;height: 216px;">
                </div>
                <div>
                <p style="margin-left: 396px; font-size: 25px;"><%=p.getpName() %></p>
                <p style="margin-left: 396px; font-size: 25px;" class="cart-pricetext"><span>가격 :</span><%=p.getpPrice() %><span>원</span></p>
              	<div style="display: flex" class="count-con">
              	<p style="margin-left: 396px; font-size: 25px;">수량 :</p>
              	<!--<span  style="margin-left: 396px; font-size: 25px;" type="button" value="－" class="product-minus" id="plus">-</span>-->
               	<input style="border: none; font-size: 25px;" type="text" value="<%=p.getpCount() %>" class="pCount" readonly>
                <span style="font-size: 25px; margin-left: -176px;"> 개</span>
                <!-- style=" font-size: 25px; margin-left: 78px" type="button" value="＋" class="product-plus" id="minus">+</span><span style="margin-left: 4px; font-size: 25px;">-->
                </div>
                <div style=" font-size: 25px; margin-left: 394px;"><P>배송 도착 예상 날짜 : <%=p.getDelivery() %></P>
                </div>
                <div class="bTnDiv" style="margin-left: 392px;margin-top: 46px;">
                <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/onecartintopay.do?pNo=<%=p.getpNo()%>')">상품결제</button>
   				<button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartDelete.do?pNo=<%=p.getpNo()%>')">상품삭제</button>
                </div>
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
<%@include file="/views/common/footer.jsp" %>