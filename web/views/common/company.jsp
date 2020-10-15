<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/admin.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<!-- section -->

<style>
	.cg{
		display: grid;
		grid-template-columns:auto auto auto auto auto  ;
		justify-content: space-arround;
	
	}
	
	.cotainer-group,.div-container,.group, h1>p, h2>p{
		margin: 30px 0;
		padding: 30px 0;
	
	}
	.img2{
	height: 300px; 
	width:100%;
	background-attachment: fixed;
	
	}


</style>
    <section>

        <h1>회사소개  </h1>
        <div class="div-container">
            
            
            <div class="img">
                <img class="img2" src="<%=request.getContextPath() %>/images/product/women.jpg" >
            </div>
            <div class="text">
             
            </div>

  </div>
    <div class="cotainer-group">

        <h2>EOL--구성원</h2>
        <picture class="cg">
            <div class="person">
                  <li><img src="" alt="">박현우</li>    
                </div>
                <div class="person">
                    <li><img src="" alt="">이요셉</li>
            </div>
            <div class="person">
                <li><img src="" alt="">이하영</li>
            </div>
            <div class="person">
                <li><img src="" alt="">이윤나</li>
            </div>
            <div class="person">
                <li><img src="" alt="">이지훈</li>
            </div>
            
        </picture>
        <div class="group">
                <h2>다들 놀러가고 싶은 곳</h2>
                <p><img src="<%=request.getContextPath() %>/images/product/sunset.jpg" alt="" style="width: 100%;height:300px;"></p>
        </div>
        	<h1> 뚝딱쿡을 하게된이유</h1>
        <p> 싱글족이나 집에서손님이 방문할시에 
         파티음식 또는 손님 방문시에 특별한 음식을 해먹고 싶어하는 수요가 늘어나는 점을 착안하여  나중에 이런 kit시장이 커질거라 생각되어 시작을 하게되었습니다.</p>
         
         <h2> 초보자도 할수있다. 어떻게? </h2>
         <p>초보자도 만들수 있는 kit를 판매하는 사이트를 만들보게되었고  조리법을 몰라도 상세하게 조리법이 나와있어서 누구나 쉽게 만들수있고 ,
         좋은 재료등을 선별 각각  신선도가 계속 유지될수있도록    밀봉및 포장을 잘하여 집에서 같이 만들어 먹을수있는 kit이며 
         이걸로 같이 만드는 재미와  더불어 집에서 쉽게 접하지 못하는 이색요리등을  접할수있는 컨셉입니다.</p>   


    </div>
    
    </section>
<%@ include file="/views/common/footer.jsp"%>