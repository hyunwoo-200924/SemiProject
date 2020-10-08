<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.eol.member.model.vo.Member" %>

<%
	Member m = (Member) request.getSession().getAttribute("loginMember");
	int coCount = (int) request.getAttribute("coCount");
%>

<%@ include file="/views/common/header.jsp"%>

      <section class="container">
<%@ include file="/views/mypage/common/mypagenav.jsp" %>
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
