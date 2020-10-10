
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                <img src="D:\programwork\semiProject\img\chamnamul.jpg" alt="상품이미지" style="width:200px;height:150px;">

            </div>
            <div class="cart-section-body-group3">
                <p>상품명111111</p>
            </div>
            <div class="cart-section-body-group3">
                <select class="cart-selection" aria-placeholder="1" style="width:180px;height: 40px;">
                    
                </select>

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
               <button class="btn" onclick="location.replace('<%=request.getContextPath()%>/cartintopay.do')">상품결제</button>
            </div>
    </section>
</div>

<%@include file="/views/common/footer.jsp" %>