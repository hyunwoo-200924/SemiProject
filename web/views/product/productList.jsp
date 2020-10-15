<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>

<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/menu.css">

<%@ include file="/views/common/header.jsp"%>
<%@ page
   import="java.util.List,com.eol.product.model.vo.Product, com.eol.member.model.vo.Member, com.eol.order.model.vo.WishList"%>
<%
   List<Product> list=(List)request.getAttribute("list");
   String pageBar=(String)request.getAttribute("pageBar");
   Member loginMember1 = (Member)request.getSession().getAttribute("loginMember");
   
   List<WishList> wl = (List)request.getAttribute("wl");
   List pNos = new ArrayList();
   if(loginMember1 != null && wl != null){
      for(WishList w : wl){
         pNos.add(w.getpNo());
      }
   }
   
   int result = 0;
   if(loginMember1 == null){
      result = 1;
   }
   
   String change = (String)request.getAttribute("change");
   
   Date now = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("MM월dd일 E요일");
   String today =(String)sf.format(now);
%>
<style>
.hart--img:hover{
   cursor:pointer;
}
</style>
<script>
   $(document).ready(function(){
         //생성자에 문자열을 넣어 특정 날짜 생성
      <%--    var date= "<%=today%>";
      console.log(today);//10월 오늘날짜로 출력 --%>
      var date=new Date();
      console.log(date);
      var year= date.getFullYear();
      var month=date.getMonth()+1;
      var day = date.getDate();
      
      var dayoftheweek=date.getDay();
      //먼스 00으로 표기
      if(month<10){
         month="0"+month;
      }
      //10보다 아래면 00이런식으로 표현
      if(day<10){
         day="0"+day;
      }
      
      $('#Tuesday').append(date.getDate()-1);
      $('#Wednesday').append(day);
      $('#Thursday').append(date.getDate()+1);
      $('#Friday').append(date.getDate()+2);
      $('#Saturday').append(date.getDate()+3);
   
      
   });
   
   
</script>

<!-- section -->
<div class="menu-group-container">
   <section class="menu-head-group">
      <div class="head-group">
         <div class="head">
            <div class="head-text-group">
               <div class="head-text">

                  <h1>뚝딱KIT메뉴</h1>
               </div>
               <div class="head-text">

                  <div class="head-left">
                     <h4>
                        <a href="" class="head-left-title">배송일별</a>
                     </h4>
                     <h4>
                        <a href="" class="head-left-title">테마일별</a>
                     </h4>
                  </div>

                  <!-- 클릭을 하게되면 아래 date-change가 클릭한 날짜로 바뀜 -->
                  <!-- hover를 줘서 클릭하게되면 동그란색안에 숫자가 표현되게해야함 -->
                  <ul class="head-right">
                     <li class="head-right-items1">화
                        <p class="week-day" id="Tuesday"></p>
                     </li>
                     <li class="head-right-items1">수
                        <p class="week-day" id="Wednesday"></p>
                     </li>
                     <li class="head-right-items1">목
                        <p class="week-day" id="Thursday"></p>
                     </li>
                     <li class="head-right-items1">금
                        <p class="week-day" id="Friday"></p>
                     </li>
                     <li class="head-right-items1">토
                        <p class="week-day" id="Saturday"></p>
                     </li>
                  </ul>
               </div>
            </div>
            <div class="head-text-group">
               <div class="head-text border-top">

                  <h2 class="h2">
                     <span class="change_date_print"><%=today %> </span>부터 배송가능한
                     메뉴입니다.
                  </h2>
               </div>
               <div class="head-text">

                  <div class="head-left">
                     <h5>
                        뚝딱kit의 주문마감은 <span class="date-change"></span> 오전7시입니다.
                     </h5>
                  </div>
                  <ul class="head-right">
                     <li class="head-right-items2">
                        <%change="new"; %><button class="btnnone"
                           onclick="location.replace('<%=request.getContextPath()%>/product/productSort?change=<%=change %>')">신메뉴</button>
                     </li>
                     <li class="head-right-items2">
                        <%change="hot"; %><button class="btnnone"
                           onclick="location.replace('<%=request.getContextPath()%>/product/productSort?change=<%=change %>')">인기메뉴</button>
                     </li>
                     <li class="head-right-items2">
                        <%change="low"; %><button class="btnnone"
                           onclick="location.replace('<%=request.getContextPath()%>/product/productSort?change=<%=change %>')">높은가격순</button>
                     </li>
                     <li class="head-right-items2">
                        <%change="high"; %><button class="btnnone"
                           onclick="location.replace('<%=request.getContextPath()%>/product/productSort?change=<%=change %>')">낮은가격순</button>
                     </li>
                  </ul>
               </div>
            </div>

         </div>
      </div>
   </section>

   <!-- 메뉴 이미지칸  3 x  3 배열 -->
   <div class="section-menu-group-container">
      <div class="section-menu-group-container1">
         <% if(loginMember1!=null&&(loginMember1.getmId().equals("admin"))){%>
         <button
            onclick="location.assign('<%=request.getContextPath()%>/product/productWrite')">등록하기</button>
         <%}%>

         <section class="menu-group-section1">

            <%for(Product p : list) {%>
            <div>

               <div class="menu-img-group">
                  <div class="menu-img-group-wrap">
                     <div class="menu--img-group2">
                        <div class="menu--img-items-group">
                           <div class="menu--img-items">

                              <div id="wishListPno" name="pNo" style="display: none;"><%=p.getpNo()%></div>
                              <!-- 메뉴상세페이지로이동 -->
                              <a
                                 href="<%=request.getContextPath()%>/product/productView?pNo=<%=p.getpNo()%>"
                                 name="plz"> <%if(p.getpImage1()!=null) {%> <img
                                 type="file"
                                 src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpImage1() %>"
                                 style="width: 268px; height: 320px;" alt="menu"
                                 class="menu-click1"> <%} %>
                                 <ul class="menu--text-group">
                                    <div class="new">
                                       <p>NEW</p>
                                    </div>
                                    <span class="menu--text"><%=p.getpServing()%>인분&nbsp;&nbsp;&nbsp;</span>
                                    <span class="menu--text">조리시간<%=p.getpCooktime() %>분
                                    </span>
                                 </ul>
                                 <ul class="menu--text-group">
                                    <h4 class="menu--text--title"><%=p.getpDetailMain() %></h4>
                                 </ul>
                                 <ul class="menu--text-group">
                                    <span class="menu--text--price"> <%if(p.getpDiscount() != 0){ %>
                                       오늘의 핫딜 <%=p.getpPrice() - (p.getpPrice() * p.getpDiscount()/100) %>원
                                    </span>
                                    <%} %>
                                    </span>

                                    <%if(p.getpDiscount() == 0){ %>
                                    <span class="menu--text--price"><%=p.getpPrice() %>원
                                       <%} else{%> <span class="menu--text--price"
                                       style="text-decoration: line-through; color: red;">
                                          <%=p.getpPrice() %> <span>원</span>
                                    </span> <%} %> <span>
                                 </ul>
                              </a>
                              <!-- 리뷰페이지로 ~ -->
                              <a href="<%=request.getContextPath() %>/review/review"
                                 class="menu--text-group">
                                 <div id="star">
                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                 </div>
                              </a>


                           </div>
                        </div>
                     </div>

                     <!-- 이미지 클릭시에 찜또는 장바구니에 담아지기 -->
                     <div class="cart-hart">
                        <ul class="hart">
                           <!-- 찜 페이지 -->
                           <%-- <a href="<%=request.getContextPath()%>/views/cart/jjim.jsp"> --%>
                     <input type="hidden" value="<%=p.getpNo()%>">
                     <%if(loginMember1 != null && pNos!= null && pNos.contains(p.getpNo())){ %>
                              <img src="<%=request.getContextPath() %>/images/jjim.jpg" alt="찜" class="hart--img" style="width:40px; height:36px">
                              <%} else{%>
                              <img src="<%=request.getContextPath() %>/images/product/hart40px.jpg" alt="찜" class="hart--img" style="width:40px; height:36px">
                              <%} %>
                           <!-- </a> -->
                           <!-- 장바구니페이지 -->
                           <%-- <a href="<%=request.getContextPath() %>/cartView.do"> --%> <a
                              href="<%=request.getContextPath() %>/views/cart/cartViewServlet?pNo=<%=p.getpNo() %>"
                              id="cartBtn" name="cartBtn"> <img
                                 src="<%=request.getContextPath() %>/images/product/cart40px.jpg"
                                 alt="장바구니" class="cart--img" onclick="cartInsert()">
                           </a>
                        </ul>
                     </div>
                  </div>
               </div>

               <% if(loginMember1!=null&&(loginMember1.getmId().equals("admin"))){%>
               <div>

                  <div id="pNo" style="display: none;"><%=p.getpNo()%></div>
                  <input type="button" class="product-register" id="updateProduct"
                     onclick="location.assign('<%=request.getContextPath() %>/product/productUpdate?pNo=<%=p.getpNo() %>')"
                     value="수정"> <input type="button" class="product-register"
                     id="deleteProduct"
                     onclick="location.assign('<%=request.getContextPath() %>/product/productDelete?pNo=<%=p.getpNo() %>')"
                     value="삭제">

                  <!--버튼 위치 수정  -->
               </div>
               <%}%>
            </div>
            <%} %>
         </section>
      </div>
      <%--   <%=pageBar() %> --%>
      <div id="pageBar">
         <%=pageBar %>
      </div>
   </div>
</div>
<script>
   
   
   $('.hart--img').click(function(){
      
      if(<%=result%> == 1){
         
         if(confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?') == true){
            location.href='<%= request.getContextPath() %>/login.do';
         }
         
      } else {
         
         if($(this).attr('src') == '<%=request.getContextPath() %>/images/jjim.jpg'){
            //찜 취소
            let pNo = $(this).prev().val();
              console.log(pNo);
            $(this).attr('src','<%=request.getContextPath() %>/images/product/hart40px.jpg');
            
            $.ajax({
               url:"<%= request.getContextPath() %>/deletetWishList",
               data:{pNo:pNo},
               success: function(data){
                  console.log(data)
                  alert('찜 취소!');
               }
            })
            
            
         } else {
            //찜하기
            let pNo = $(this).prev().val();
            console.log(pNo);
            $(this).attr('src','<%=request.getContextPath() %>/images/jjim.jpg');
            
            $.ajax({
               url:"<%= request.getContextPath() %>/insertWishList",
               data:{pNo:pNo},
               success: function(data){
                  console.log(data)
                  alert('찜목록에 담겼습니다. 마이페이지 > 쇼핑찜에서 확인해주세요!');
               }
            })
            
         }
         
         
      }
      
   
   })
      
</script>



<%@ include file="/views/common/footer.jsp"%>