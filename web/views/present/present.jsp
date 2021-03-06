<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/cart.css">
<%@ include file="/views/common/header.jsp"%>
	<div class="present-section-container-block">
	<!-- //선물하기 페이지 -->
    <h1>선물하기</h1>
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
                                이름 <input type="text" name="">
                                
                            </label>
                            <label class="order-person-group">
                                연락처<input type="text" name="">
                                
                            </label>
                        </div>
                    </div>
                </div>
                <!-- 배송지 주소 입력 블록 -->
                <div class="present-section-group2">
                    <div class="present-items-group2-2">
                        <h3 class="info-title">선물받는분 정보</h3>
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
                                <div class="persnal-info">
                                    <label for="">
                                        <textarea name="message" id="msg" cols="30" rows="10" placeholder="따뜻한 마음을 메세지로 전하세요~!"></textarea>
                                       <button class="btn-small">메세지저장</button>
                                    </label>
                                   
                                </div>
                            </label>
                        </div>
                        
                    </div>
                </div>
                <!-- 배송 도착날짜 확인및 상품 확인 블록 -->
                
                <div class="present-section-group4">
                    <div class="present-items-group4-4">
                        <h3 class="info-title">이상품의 도착예정날짜는<span class="delivery-date">"9월 25일(금)"</span>입니다.</h3>
                        <div class="present-items-imggroup">
                            <img src="D:\programwork\semiProject\img\oyakkodong.jpg" alt="상품이미지" class="items-img" style="width:200px;height:150px">
                            <div class="present-items-img-text">
                                <p class=preset-items-title>상품명:<span class="items-payitems">맛난음식</span></p>
                                <p class="present-items-title">가격:<span class="items-payitems">0<span>원</span></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 할인및 포인트 적용 블록 -->
                <div class="present-section-group5">
                    <div class="present-items-group5-5">
                        <div class="present-items">
                            <!-- 할인 포인트및 할인 적용금액 자바스크립트 -->
                            <p>쿠폰 적용</p>
                            
                                <p class="right"><span >1000</span><span>원</span></p>

                        </div>
                        <div class="present-items">
                            <p>포인트적용</p>
                            <!-- 포인트적용후 차감되는 자바스크립트 -->
                            <p class="right"><span>0</span>point</p>
                        </div>
                    </div>
                </div>
             
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
                            <div class="pay-items">
                                <p class="pay-items-text-left middle">상품할인</p>
                                <p class="pay-items-text-right">1000<span>원</span></p>

                            </div>
                            <div class="pay-items">
                                <p class="pay-items-text-left middle">주문할인</p>
                                <p class="pay-items-text-right">2000<span>원</span></p>

                            </div>
                            
                        </div>
                    </div>
                    <div class="pay-items">
                        <p class="pay-items-text-left middle">포인트</p>
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