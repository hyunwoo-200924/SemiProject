<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.eol.cart.model.vo.Cart, com.eol.product.model.vo.Product, com.eol.member.model.vo.*" %>
    
<%@ include file="/views/common/header.jsp" %>

<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/orderpay.css">

<%
	Member m = (Member)request.getSession().getAttribute("loginMember");
	List<Cart> clist = (List)request.getAttribute("cartList");
%>

<div class="present-section-container-block">
    <h1>결제하기</h1>
    <!-- 그리드 2개 파트로 나눈섹션 -->
    <section class="present-section-container-block-wrap">
        <!-- 큰 그리드 1 -->
        <div class="present-section-container">
            <!-- 배송지블록 개인정보 -->
            <div class="present-section-container-group1">
                <div class="present-section-group1">
                    <div class="present-items-group1-1">
                        <div class="present-order-person">
                            <h3 class="info-title">주문자</h3>
                            <label class="order-person-group">
                                <%= m.getmName() %> <input type="text" name="">
                                
                            </label>
                            <label class="order-person-group">
                                <%=m.getmPhone() %><input type="text" name="">
                                
                            </label>
                        </div>
                    </div>
                </div>
        
                <!-- 배송지 주소 입력 블록 -->
                <div class="present-section-group2">
                    <div class="present-items-group2-2">
                        <h3 class="info-title">배송 정보</h3>
                        <button class="btn-small">기존주소선택</button>
                        <button class="btn-small">배송지추가</button>
                        <div class="present-items-img">
                            
                            <!-- 주소창에 입력후에 자동생성되게 자바스크립트 -->
                            <label for="">
                                <div class="persnal-info">
                                    <label>이름<input type="text" placeholder="이름을 입력하세요" class="text-inputtag"></label>
                                    <label>연락처<input type="text" placeholder="예)010-0000-0000" class="text-inputtag"></label>
                                </div>
                                <div class="persnal-info">
                                    <label>주소<input type="text" class="address-text"  style="width: 300px;height: 25px; margin: 5px 0;"></input></label>
                                    <button class="btn-small">주소검색</button>
                                    
                                </div>
                            </label>
                        </div>
                        
                    </div>
                </div>
                <!-- 배송 도착날짜 확인및 상품 확인 블록 -->
                
                <div class="present-section-group4">
                    <div class="present-items-group4-4">
                    <%for(Cart c : clist) { %>
                        <h3 class="info-title"><%=c.getoDeliveryEDate() %>도착예정</h3>
                        <div class="present-items-imggroup">
                            <img src="<%=request.getContextPath() %>/images/product/<%=c.getProduct().getpImage1() %>" alt="상품이미지" class="items-img" style="width:200px;height:150px">
                            <div class="present-items-img-text">
                                <p class=preset-items-title>상품명:<span class="items-payitems"><%=c.getProduct().getpName() %></span></p>
                                <p class="present-items-title">가격:<span class="items-payitems"><%=c.getProduct().getpPrice() %><span>원</span></p>
                                <p class="present-items-title">수량:<span class="items-payitems"><%=c.getcQty() %></span></p>
                            </div>
                        </div>
                       	
                            <div>
                            <%int total = c.getProduct().getpPrice()*c.getcQty();%>
                            	<p>총액 : <%=total %></p>
                            </div>
                        <%} %>
                    </div>
                </div>

                <!-- 할인및 포인트 적용 블록 -->
                <div class="present-section-group5">
                    <div class="present-items-group5-5">
                        <div class="present-items">
                            <!-- 할인 포인트및 할인 적용금액 자바스크립트 -->
                            <p>쿠폰 적용</p>
                            
                                <p class="right"><span >2000</span><span>원 할인쿠폰</span></p>

                        </div>
                        <div class="present-items">
                            <p>포인트적용</p>
                            <!-- 포인트적용후 차감되는 자바스크립트 -->
                            <p class="right"><span>0</span>point</p>
                        </div>
                    </div>
                </div>
                
                <div class="orderway">
                	<p>결제수단 선택</p>
             
            	</div>
        </div>
        
        
        <!-- 결제창 블록 && 큰 그리드 2 -->
        <div class="present-section-container-group2">
            <!-- 결제창 정보 block -->
            <div class="present-section-group3">
                <div class="present-items-group3-3">
                    <div class="present-items-small-group"></div>
                    <h3>결제 정보</h3>
                    <div class="pay-items">
                        <p class="pay-items-text-left middle">총상품금액</p>
                        <p class="pay-items-text-right">0<span>원</span></p>
                        
                    </div>
                    <div class="pay-items">
                        <p class="pay-items-text-left middle">배송비</p>
                        <p class="pay-items-text-right">3000<span>원</span></p>
                        
                    </div>
                    <div class="pay-items1">
                        <h3>할인 금액</h3>
                        <div class="pay-items-small">
                            <!-- <div class="pay-items">
                                <p class="pay-items-text-left middle">상품할인</p>
                                <p class="pay-items-text-right">1000<span>원</span></p>

                            </div> -->
                            <div class="pay-items">
                                <p class="pay-items-text-left middle">쿠폰할인</p>
                                <p class="pay-items-text-right">2000<span>원</span></p>

                            </div>
                            
                        </div>
                    </div>
                    <div class="pay-items">
                        <p class="pay-items-text-left middle">포인트사용</p>
                        <p class="pay-items-text-right">0<span class="middle">Point</span></p>
                        
                    </div>
                    <div class="pay-items">
                        <p class="pay-items-text-left middle">결제 금액</p>
                        <p class="pay-items-text-right">0<span>원</span></p>
                        
                    </div>
                    <div class="info-agreed">
                        <input type="checkbox" class="info-agreed">
                        <textarea style="width:300px;height: 50px; overflow:scroll"><p>개인정보및 배송지제출에 동의하시겠습니까?</p></textarea>
                    </div>
                    <div class="pay-button">
                        <button class="pay-deside-button btn" style="width: 550px;height:50px;justify-content:center;margin: 20px 0;">결제하기</button>
                    </div>
                </div>
            </div>
            <!-- 결제창block 끝 -->
        </div>
    </div>
    </section>
</div>

<%@ include file="/views/common/footer.jsp"%>