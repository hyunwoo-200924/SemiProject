<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.eol.member.model.vo.Member, com.eol.order.model.vo.Orders, com.eol.order.model.vo.WishList" %>

<%
   Member m = (Member) request.getSession().getAttribute("loginMember");
   int coCount = (int) request.getAttribute("coCount");
   
   List<Orders> orderList = (List)request.getAttribute("orderList");
   List<WishList> JjimList = (List)request.getAttribute("JjimList");
   
   String[] oStatus = new String[4];
   if(!orderList.isEmpty()){
      switch(orderList.get(0).getoStatus()){
         case "결제완료" : oStatus[0] = "style='color: #AC0F0F;'"; break;
         case "배송준비" : oStatus[1] = "style='color: #AC0F0F;'"; break;
         case "배송중" : oStatus[2] = "style='color: #AC0F0F;'"; break;
         case "배송완료" : oStatus[3] = "style='color: #AC0F0F;'"; break;
      }
      
   }
%>
<style>
.order_history, .order_basket{
    display: grid;
    grid-template-columns: auto auto auto;
}
.recent{
      border: 1px solid #ccc;
    margin: 10px 5px;
    height: 345px;
    padding: 10px;
    width: 221px;
}
.recent_detail{
    display: grid;
    /* grid-template-rows: auto auto; */
       grid-template-columns: 0.8fr 1.5fr;
}
.recent_detail span{
   margin:2px;
}
.jjim span{
display:grid;
    text-align: center;
}
.recent:hover{
cursor: pointer;
}
.recent .orderContent{
    text-align: center;
    margin-bottom: 7px;
    font-size: 18px;
    font-weight: 900;
}
</style>

<%@ include file="/views/common/header.jsp"%>

      <section class="container">
<%@ include file="/views/mypage/common/mypagenav.jsp" %>
         <div class="mypage">
            <div class="mypage_top">
               <div class="mypage_info">
                  <p><%=m.getmName() %></p><span><%=m.getmAddress() %></span>
               </div>
               <div class="mypage_point">
                  <p><span>뚝딱쿡 포인트</span><b><%=m.getmPonint() %>P</b></p>
                  <p><span>보유쿠폰</span><b><%=coCount %>장</b></p>
               </div>
            </div>
            <div class="mypage_body">
               <%-- <div>
                  <h2>주문/배송조회</h2>
                  <div class="order">
                     <div class="order_image"><span class="image1" ></span ><span <%= oStatus[0] %>>주문/결제</span></div>
                     <div></div>
                     <div class="order_image"><span class="image3" ></span><span <%= oStatus[1] %>>배송준비</span></div>
                     <div></div>
                     <div class="order_image"><span class="image4" ></span><span <%= oStatus[2] %>>배송중</span></div>
                     <div></div>
                     <div class="order_image"><span class="image5" ></span><span <%= oStatus[3] %>>배송완료</span></div>
                  </div>
               </div> --%>
               <div>
                  <h2>최근 구매한 메뉴</h2>
                  <div class="order_history">
                  <%if(orderList.isEmpty()){ %>
                     <p class="no_list" style="grid-column: 1/4;">최근 구매한 메뉴가 없습니다.</p>
                  <%} else { %>
                        <%for(int i = 0; i < 3; i++){ 
                           if(orderList.size() >= i+1){
                              Orders o = orderList.get(i);%>   
                        <input id="oNo" type="hidden" value="<%= o.getoNo() %>">
                       <div class="recent" onclick="fn_orderDetail();">
                        <div class="orderContent"><<%= o.getOrderContent() %>></div>
                       <img src="<%= request.getContextPath() %>/upload/product/<%= o.getpImage1() %>" style="width: 200px; height: 200px; margin-bottom: 10px;">
                       <div class="recent_detail">
                          <span style="margin-top: 3px;">주문번호</span><span style="margin-top: 3px;"><b><%=o.getoNo() %></b></span>
                          <span>결제금액</span><span><b><%=o.getoPayment() %> 원</b></span>
                          <span>주문상태</span><span><b><%=o.getoStatus() %></b></span>
                          </div>
                       </div>
                          <%} %>
                       <%} %>
                  <%} %>
                  </div>
               </div>
               <div>
                  <h2>쇼핑찜</h2>
                  <div class="order_basket">
                  <%if(JjimList.isEmpty()){ %>
                     <p class="no_list" style="grid-column: 1/4;">찜목록에 담긴 메뉴가 없습니다.</p>
                  <%} else { %>
                        <%for(int i = 0; i < 3; i++){ 
                         if(JjimList.size() >= i+1){
                         WishList w = JjimList.get(i);%>   
                       <div class="recent" style="height:280px">
                       <input type="hidden" name="pNo" value=<%= w.getpNo() %>>
                       <img src="<%= request.getContextPath() %>/upload/product/<%= w.getpImage1() %>" style="width: 200px; height: 200px; margin-bottom: 10px;">
                       <div class="jjim">
                          <span style="margin-top: 3px;"><b><%=w.getpName() %></b></span>
                          <span><b><%=w.getpPrice() %> 원</b></span>
                       </div>
                       </div>
                          <%} %>
                       <%} %>
                  <%} %>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <script>
/*       $('.recent').click(function(){
         
      }) */
      function fn_orderDetail(){
         let oNo = $("#oNo").val();
         location.href="<%= request.getContextPath() %>/orderDetail.hy?oNo="+oNo;
         
      }
      </script>
<%@ include file="/views/common/footer.jsp"%>