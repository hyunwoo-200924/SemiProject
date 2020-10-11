<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eol.order.model.vo.Orders" %>

<%
	Orders o=(Orders)request.getAttribute("nMOrder");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/noneoderDelivery.css">

<section>
   			<nav class="mypage_left">
                 <h2>마이페이지</h2>
                <ul>
                    <li class="mypage_left_title1">나의 주문정보</li>
                    <li>주문/배송조회</li>
                    <li>취소/반품조회</li>
                    <li>선물내역</li>    
                    <li class="mypage_left_title1">나의혜택</li>
                    <li>쿠폰</li>
                    <li>포인트</li>
                    <li class="mypage_left_title1">나의활동</li>
                    <li>리뷰</li>
                    <li>맛취향</li>
                    <li>쇼핑찜</li>
                    <li>1:1문의</li>
                    <li class="mypage_left_title1">나의 정보</li>
                    <li>개인정보변경</li>
                    <li>회원탈퇴</li>
                </ul>
              </nav>
            <div class="content">
            
                <div class="content1">
                    <h1 class="cont_title">주문 / 배송조회</h1>
                    <div class=cont_content>
                    <table class="orderDate">
                        <tr>
                            <td>주문일시<br>
                            <%= o.getoPayDate() %></td>
                            <td>주문번호<br>
                            <%= o.getoNo() %></td>
                        </tr>
                    </table>
                    </div>
                </div>


                <div class="content2">
                    <h2 class="cont_title">주문자 정보</h2>
                    <div class=cont_content>
                    <p>이름 : <%=o.getoName() %></p>
                    <p>연락처 : <%=o.getoPhone() %></p>
                    </div>
                </div>

                <div class="content3">
                    <h2 class="cont_title">배송정보</h2>
                    <div class="cont_content">
                        <p>배송지 : <%=o.getoAddress() %></p>
                        <p><%=o.getoStatus() %> : <%if(o.getoPayDate()!= null){ %>
                        	<%=o.getoPayDate() %>
                        <%} %></p>
                    </div>
                </div>
                
                <div class="content4">
                   <div class="orderNumber">
                        <p><%=o.getoPayDate() %> (<%=o.getoNo() %>)</p>
                    </div>
                    <div class="productView">
                        <div class="orderproduct">
                            <div class="order_pro_img">
                                <img src="<%=request.getContextPath() %>/images/mainImages/gogi.jpg" alt="" width="100" height="100">
                            </div>
                            <div class="order_pro_name">
                                <h3>상품명</h3>
                                <p>가격 / 수량</p>
                            </div>
                        </div>
                        <div class="ordernotice">
                            <p>도착일, 배송지변경 및 주문취소는<br>
                                주문마감기한인 <%=o.getoDeliveryDate() %> 07:00 까지 가능합니다.</p>
                        </div>
                    </div>
                    <div class="orderButton">
                        <div class="arriveDate">
                            <p>배송준비중</p><!-- 배송중 또는 배송완료 -->
                            <p><%=o.getoDeliveryEDate() %> 도착예정</p>
                        </div>
                        <ul class="Button">
                     <!--        <li><button><a href="">배송조회</a></button></li> -->
                            <li><button><a href="">교환신청</a></button></li>
                            <li><button><a href="">반품신청</a></button></li>
                            <li><button><a href="">리뷰쓰기</a></button></li>
                        </ul>
                    </div>
                </div>
                <div class="content5">
                    <h1 class="cont_title">결제정보</h1>
                    <table class="cont_content">
                        <tr>
                            <td>결제수단 신용카드(신용카드/일시불)</td>
                            <td>총 상품금액 : <%=o.getoPayment() %> </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>총 배송비 : 3,000원</td>
                        </tr>
                        <tr>
                            <td><button>결제수단 변경</button></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>총결제금액 </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
<%@ include file="/views/common/footer.jsp"%>