<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" herf="<%=request.getContextPath()%>/css/menu.css">
<%@ include file="/views/common/header.jsp"%>



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
                        <ul class="head-right">
                            <li class="head-right-items2"><a href="">신메뉴</a></li>
                            <li class="head-right-items2"><a href="">인기메뉴</a></li>
                            <li class="head-right-items2"><a href="">가격높은순</a></li>
                            <li class="head-right-items2"><a href="">가격낮은순</a></li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 메뉴 이미지칸  3 x  3 배열 -->
    <div class="section-menu-group-container">
        <div class="section-menu-group-container1">

            <section class="menu-group-section1">
                <div class="menu-img-group">
                    <div class="menu-img-group-wrap">
                    <!-- menu--img-group1 클릭을 하게되면 메뉴상세페이지로 넘어가게 자바스크립트 -->
                    <div class="menu--img-group1">
                        <div class="menu--img-items">
                            <img src="D:\programwork\semiProject\img\gaabasmenu.jpg" alt="menu" class="menu-click1">
                            <ul class="menu--text-group">
                                <li class="menu--text">3인분</li>
                                <li class="menu--text">조리10분</li>
                            </ul>
                            <ul class="menu--text-group">
                                <h4 class="menu--text--title">감바스알아히요</h4>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">34,800<span>원</span></li>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">34,800<span>원</span></li>
                            </ul>
                            
                            
                        </div>
                    </div>
                    
                    <!-- 이미지 클릭시에 찜또는 장바구니에 담아지기 -->
                    <div class="cart-hart">
                        <ul class="hart">
                        <!-- 찜 페이지 -->
                            <a href="">

                                <img src="" alt="찜" class="hart--img" onclick="hart();"></img>
                            </a>
                            <!-- 장바구니페이지 -->
                            <a href="">

                                <img src="" alt="" class="cart--img" onclick="cartInsert()"></img>
                            </a>
                        </ul>
                    </div>
                 </div>   
                </div>
            
            <div class="menu-img-group">
                <div class="menu-img-group-wrap">
                    <div class="menu--img-group2">
                       <div class="menu--img-items-group"> 
                            <div class="menu--img-items">
                                <!-- 메뉴상세페이지로이동 -->
                                <a href="">

                                    <img src="D:\programwork\semiProject\img\cheezemenu.jpg" alt="menu" class="menu-click1">
                                </a>
                                <ul class="menu--text-group">
                                    <div class="new">
                                        <p>NEW</p>
                                      </div>
                                    <li class="menu--text">3인분</li>
                                    <li class="menu--text">조리10분</li>
                                </ul>
                                <ul class="menu--text-group">
                                    <h4 class="menu--text--title">눈꽃치즈 닭갈비</h4>
                                </ul>
                                <ul class="menu--text-group">
                                    <li class="menu--text--price">34,800<span>원</span></li>
                                </ul>
                                <ul class="menu--text-group">
                                    <li class="menu--text--price">34,800<span>원</span></li>
                                </ul>
                                
                                
                            </div>
                    </div>
                    </div>
                    
                    <!-- 이미지 클릭시에 찜또는 장바구니에 담아지기 -->
                    <div class="cart-hart">
                        <ul class="hart">
                        <!-- 찜 페이지 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\hart40px.jpg" alt="찜" class="hart--img" onclick="hart();"></img>
                            </a>
                            <!-- 장바구니페이지 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\cart40px.jpg" alt="" class="cart--img" onclick="cartInsert()"></img>
                            </a>
                        </ul>
                    </div>
                    </div>
                </div>
             <div class="menu-img-group">
                 <div class="menu-img-group-wrap"> 
                    <div class="menu--img-group3">
                        <div class="menu--img-items">
                            <!-- 메뉴상세페이지로 이동 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\chapbeemenu.jsp.jpg" alt="menu" class="menu-click1">
                            </a>
                            <ul class="menu--text-group">
                                <li class="menu--text">3인분</li>
                                <li class="menu--text">조리10분</li>
                            </ul>
                            <ul class="menu--text-group">
                                <h4 class="menu--text--title">부채살 찹스테이크</h4>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">34,800<span>원</span></li>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">34,800<span>원</span></li>
                            </ul>
                            
                            
                        </div>
                    </div>
                    
                    <!-- 이미지 클릭시에 찜또는 장바구니에 담아지기 -->
                    <div class="cart-hart">
                        <ul class="hart">
                        <!-- 찜 페이지 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\hart40px.jpg" alt="찜" class="hart--img" onclick="hart();"></img>
                            </a>
                            <!-- 장바구니페이지 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\cart40px.jpg" alt="" class="cart--img" onclick="cartInsert()"></img>
                            </a>
                        </ul>
                    </div>
                </div>
            </div>
             <div class="menu-img-group">
                 <div class="menu-img-group-wrap">
                    <div class="menu--img-group4">
                        <div class="menu--img-items">
                            <a href="">

                                <img src="D:\programwork\semiProject\img\forkbbqmenu.jpg" alt="menu" class="menu-click1">
                            </a>
                            <ul class="menu--text-group">
                                <div class="new">
                                    <p>NEW</p>
                                  </div>
                                <li class="menu--text">3인분</li>
                                <li class="menu--text">조리10분</li>
                            </ul>
                            <ul class="menu--text-group">
                                <h4 class="menu--text--title">돼지고기 맥적구이</h4>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">20,800<span>원</span></li>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">20,800<span>원</span></li>
                            </ul>
                            
                            
                        </div>
                    </div>
                    
                    <!-- 이미지 클릭시에 찜또는 장바구니에 담아지기 -->
                    <div class="cart-hart">
                        <ul class="hart">
                        <!-- 찜 페이지 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\hart40px.jpg" alt="찜" class="hart--img" onclick="hart();"></img>
                            </a>
                            <!-- 장바구니페이지 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\cart40px.jpg" alt="" class="cart--img" onclick="cartInsert()"></img>
                            </a>
                        </ul>
                    </div>
                </div>
               </div> 
                <!-- 이미지안에 품절 또는 추가 이미지안에 품절, 추가상품준비중 이라고 표시 관리자모드로이다  -->
                <div class="menu-img-group">
                    <div class="menu-img-group-wrap">
                    <div class="menu--img-group5">
                        <div class="menu--img-items">
                            <!-- 메뉴상세페이지로이동 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\ddoinjangmenu.jpg" alt="menu" class="menu-click1">
                            </a>
                            <ul class="menu--text-group">
                                <div class="new">
                                    <p>NEW</p>
                                  </div>
                                <li class="menu--text">3인분</li>
                                <li class="menu--text">조리10분</li>
                            </ul>
                            <ul class="menu--text-group">
                                <h4 class="menu--text--title">모둠버섯된장전골</h4>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">20,800<span>원</span></li>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">20,800<span>원</span></li>
                            </ul>
                            
                            
                        </div>
                    </div>
                    
                    <!-- 이미지 클릭시에 찜또는 장바구니에 담아지기 -->
                    <div class="cart-hart">
                        <ul class="hart">
                        <!-- 찜 페이지 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\hart40px.jpg" alt="찜" class="hart--img" onclick="hart();"></img>
                            </a>
                            <!-- 장바구니페이지 -->
                            <a href="">

                                <img src="D:\programwork\semiProject\img\cart40px.jpg" alt="" class="cart--img" onclick="cartInsert()"></img>
                            </a>
                        </ul>
                    </div>
                </div>
            </div>
                <!-- 이미지안에 품절 또는 추가상품준비중 시  안에 흰색글씨로 보이기해주기 -->
                <div class="menu-img-group">
                    <div class="menu-img-group-wrap">

                        <div class="menu--img-group6">
                            <div class="menu--img-items">
                            <!-- 메뉴상세 페이지로 이동 -->
                            <a href="">
                                
                                <img src="D:\programwork\semiProject\img\ddanhobakmenu.jpg" alt="menu" class="menu-click1">
                            </a>
                            <ul class="menu--text-group">
                                <div class="new">
                                    <p>NEW</p>
                                </div>
                                <li class="menu--text">3인분</li>
                                <li class="menu--text">조리10분</li>
                            </ul>
                            <ul class="menu--text-group">
                                <h4 class="menu--text--title">단호박 치즈오리불고기</h4>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">34,800<span>원</span></li>
                            </ul>
                            <ul class="menu--text-group">
                                <li class="menu--text--price">34,800<span>원</span></li>
                            </ul>
                            
                            
                        </div>
                    </div>
                    
                    <!-- 이미지 클릭시에 찜또는 장바구니에 담아지기 -->
                    <div class="cart-hart">
                        <ul class="hart">
                            <!-- 찜 페이지 -->
                            <a href="">
                                
                                <img src="D:\programwork\semiProject\img\hart40px.jpg" alt="찜" class="hart--img" onclick="hart();"></img>
                            </a>
                            <!-- 장바구니페이지 -->
                            <a href="">
                                
                                <img src="D:\programwork\semiProject\img\cart40px.jpg" alt="" class="cart--img" onclick="cartInsert()"></img>
                            </a>
                        </ul>
                    </div>
                </div>
                    
            </div>
                
            </section>
        </div>
    </div>
</div>
    
    
    
<%@ include file="/views/common/footer.jsp"%>