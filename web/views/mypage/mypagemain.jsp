<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.eol.member.model.vo.Member" %>

<%
	Member m = (Member) request.getSession().getAttribute("loginMember");
	int coCount = (int) request.getAttribute("coCount");
%>

<%@ include file="/views/common/header.jsp"%>

      <section class="container">
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
         <div class="mypage">
            <div class="mypage_top">
               <div class="mypage_info">
                  <p><%=m.getmName() %></p><span><%=m.getmAddress() %></span>
               </div>
               <div class="mypage_point">
                  <p><span>CJ ONE 포인트</span><b><%=m.getmPonint() %>P</b></p>
                  <p><span>보유쿠폰</span><b><%=coCount %>장</b></p>
               </div>
            </div>
            <div class="mypage_body">
               <div>
                  <h2>주문/배송조회</h2>
                  <div class="order">
                     <div class="order_image"><span class="image1"></span><span>주문/결제</span></div>
                     <div></div>
                     <!-- <div class="order_image"><span class="image2"></span><span>재료준비</span></div>
                     <div></div> -->
                     <div class="order_image"><span class="image3"></span><span>배송준비</span></div>
                     <div></div>
                     <div class="order_image"><span class="image4"></span><span>배송중</span></div>
                     <div></div>
                     <div class="order_image"><span class="image5"></span><span>배송완료</span></div>
                  </div>
               </div>
               <div>
                  <h2>최근 구매한 메뉴</h2>
                  <div class="order_history">
                     <p class="no_list">최근 구매한 메뉴가 없습니다.</p>
                  </div>
               </div>
               <div>
                  <h2>쇼핑찜</h2>
                  <div class="order_basket">
                     <p class="no_list">찜목록에 담긴 메뉴가 없습니다.</p>
                  </div>
               </div>
            </div>
         </div>
      </section>
<%@ include file="/views/common/footer.jsp"%>
