
<%@page import="com.eol.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@
	page import="java.util.List,com.eol.cart.model.vo.Cart,javax.servlet.http.Cookie"
 %>
 <%
 /*  	List<Cart> list = (List)request.getSession().getAttribute("nonlistCart");
 */
 	List<Cart> list = (List)session.getAttribute("nonselectCart");
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
           <%for(Cart c : list){%>
            <div class="cart-section-body-group2">
                <img src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=c.getProduct().getpImage1() %>" alt="상품이미지" style="width:200px;height:150px;">

            </div>
            <div class="cart-section-body-group3">
                <p><%=c.getProduct().getpName() %></p>
            </div>
            <div class="cart-section-body-group3">
                <select class="cart-selection" aria-placeholder="1" style="width:180px;height: 40px;">
                    
                </select>
			<%} %>
            </div>
            <div class="cart-section-body-group4">
                <p class="cart-pricetext">1212 <span>원</span></p>

            </div>
                
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