<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menu.css">


<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.eol.product.model.vo.Product, com.eol.member.model.vo.Member" %>
<%
	List<Product> list=(List)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
	Member loginMember1 = (Member)request.getSession().getAttribute("loginMember");
	
%>




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
                            <h4><a href="" class="head-left-title">배송일별</a></h4>
                            <h4><a href="" class="head-left-title">테마일별</a></h4>
                        </div>

                        <!-- 클릭을 하게되면 아래 date-change가 클릭한 날짜로 바뀜 -->
                        <!-- hover를 줘서 클릭하게되면 동그란색안에 숫자가 표현되게해야함 -->
                        <ul class="head-right">
                        
                            <li class="head-right-items1">화<p class="week-day">25</p></li>
                            <li class="head-right-items1">수<p class="week-day">26</p></li>
                            <li class="head-right-items1">목<p class="week-day">27</p></li>
                            <li class="head-right-items1">금<p class="week-day">28</p></li>
                            <li class="head-right-items1">토<p class="week-day">29</p></li>

                        </ul>
                    </div>
                </div>
                <div class="head-text-group">
                    <div class="head-text border-top">

                        <h2 class="h2"><span class="change_date_print">9월 22일 화요일</span>배송가능한 메뉴입니다.</h2>
                    </div>
                    <div class="head-text">

                        <div class="head-left">
                            <h5>뚝딱kit의 주문마감은 <span class="date-change">9월 25일(금)</span> 오전7시입니다.</h5>
                        </div>
                        <form>
                        <ul class="head-right">
                            <li class="head-right-items2"><a href="">신메뉴</a></li>
                            <li class="head-right-items2"><a href="">인기메뉴</a></li>
                            <li class="head-right-items2"><a href="">가격높은순</a></li>
                            <li class="head-right-items2"><a href="">가격낮은순</a></li>

                        </ul>
                        <form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 메뉴 이미지칸  3 x  3 배열 -->
    <div class="section-menu-group-container">
        <div class="section-menu-group-container1">
        		<% if(loginMember1!=null&&(loginMember1.getmId().equals("admin"))){%> 
					<button  onclick="location.assign('<%=request.getContextPath()%>/product/productWrite')">등록하기</button>
        		<%}%> 
					
            <section class="menu-group-section1">
                
            <%for(Product p : list) {%>
         	 <div>
					              
              <div class="menu-img-group">
                <div class="menu-img-group-wrap">
                    <div class="menu--img-group2">
                       <div class="menu--img-items-group"> 
                            <div class="menu--img-items">
                            
                            <div name="pNo" style="display:none;"><%=p.getpNo()%></div>
                                <!-- 메뉴상세페이지로이동 -->
                                <a href="<%=request.getContextPath()%>/product/productView?pNo=<%=p.getpNo()%>" name="plz" >
									<%if(p.getpImage1()!=null) {%>
                                    <img type="file" src="<%=request.getContextPath() %>/product/productFileDownload?fileName=<%=p.getpImage1() %>" style="width: 268px;height: 320px;" alt="menu" class="menu-click1">
                                    <%} %>
                                    <ul class="menu--text-group">
                                        <div class="new">
                                            <p>NEW</p>
                                        </div>
                                        <span class="menu--text"><%=p.getpServing()%>인분&nbsp;&nbsp;&nbsp;</span><span class="menu--text">조리시간<%=p.getpCooktime() %>분</span>
                                    </ul>
                                    <ul class="menu--text-group">
                                        <h4 class="menu--text--title"><%=p.getpDetailMain() %></h4>
                                    </ul>
                                    <ul class="menu--text-group">오늘의 핫딜
                                        <span class="menu--text--price"><%=p.getpPrice() %><span>원</span></span>  <span class="menu--text--price" style="text-decoration: line-through; color: red;"><%=p.getpPrice() %><span>원</span></span>
                                    </ul>
                                </a>
                                <!-- 리뷰페이지로 ~ -->
                                <a  href="<%=request.getContextPath() %>/review/review" class="menu--text-group">
                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>

                                   
                                </a>
                                
                                
                            </div>
                    </div>
                    </div>
                    
                    <!-- 이미지 클릭시에 찜또는 장바구니에 담아지기 -->
                    <div class="cart-hart">
                        <ul class="hart">
                        <!-- 찜 페이지 -->
                            <a href="<%=request.getContextPath()%>/views/cart/jjim.jsp">

                                <img src="<%=request.getContextPath() %>/images/product/hart40px.jpg" alt="찜" class="hart--img" onclick="hart();">
                            </a>
                            <!-- 장바구니페이지 -->
                            <a href="<%=request.getContextPath() %>/cartView.do">
                            <a href="<%=request.getContextPath() %>/views/cart/cartViewServlet?pNo=<%=p.getpNo() %>" id="cartBtn" name="cartBtn">

                                <img src="<%=request.getContextPath() %>/images/product/cart40px.jpg" alt="장바구니" class="cart--img" onclick="cartInsert()">
                            </a>
                        </ul>
                    </div>
                    </div>
                </div>
                
                            	<% if(loginMember1!=null&&(loginMember1.getmId().equals("admin"))){%>
            	<div>
            	
                            <div id="pNo" style="display:none;"><%=p.getpNo()%></div>
      		<input type="button" class="product-register" id="updateProduct" onclick="location.assign('<%=request.getContextPath() %>/product/productUpdate?pNo=<%=p.getpNo() %>')" value="수정">
      		<input type="button" class="product-register" id="deleteProduct" onclick="location.assign('<%=request.getContextPath() %>/product/productDelete?pNo=<%=p.getpNo() %>')" value="삭제">
           
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
    
    
    
<%@ include file="/views/common/footer.jsp"%>