<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="views/common/header.jsp" %>
<!-- 광고섹션 -->
        <section class="main">
            <div class="wrapper">
            	<div class="slides-container">
            		<ul class="slider">
            			<li class="item"><img class="img" src="<%=request.getContextPath() %>/images/mainImages/gogi.jpg" alt="" ></li>
		     			<li class="item"><img class="img" src="<%=request.getContextPath() %>/images/mainImages/gim.jpg" alt="" ></li>
		            	<li class="item"><img class="img" src="<%=request.getContextPath() %>/images/mainImages/pasta.jpg" alt=""></li>
		            </ul>
            	</div>
            
            	<!-- 화살표 -->
            	<div class="slides-btn">
            		<a class="prev" style="text-dacoration: none;">&#10094;</a>
            		<a class="next" style="text-decoration: none;">&#10095;</a>        
        		</div>
        	</div>
        	<script>
        		var slideWrapper = document.querySelector('.slides-container');//클래스명이 slides-container인 div태그에 접근
        		var slides = document.querySelectorAll('.item');//클래스명이 item인 li태그에 접근
        		var totalSlides = slides.length; // item의 갯수
        		
        		var sliderWidth = slideWrapper.clientWidth;//slides-container의 넓이
        		var slideIndex = 0;
        		var slider = document.querySelector('.slider');//클래스명에 slider인 ul태그에 접근
        		
        		slider.style.width = sliderWidth * totalSlides + 'px';//slides-container의 넓이와 item의 갯수를 곱한 값의 위치
        		
        		
        		function showSlides(n) {
        		    slideIndex = n;
        		    if (slideIndex == -1) {
        		        slideIndex = totalSlides - 1;
        		    } else if (slideIndex === totalSlides) {
        		        slideIndex = 0;
        		    }
        		    slider.style.left = -(sliderWidth * slideIndex) + 'px';
        		}

        		function plusSlides(n){
        		    showSlides(slideIndex += n);
        		}
        		  
        		function currentSlide(n) {
        		    showSlides(slideIndex = n);
        		}

        		var nextBtn = document.querySelector('.next');
        		var prevBtn = document.querySelector('.prev');

        		nextBtn.addEventListener('click', function () {
        		    plusSlides(1);
        		});
        		prevBtn.addEventListener('click', function () {
        		    plusSlides(-1);
        		});
        	</script>
        	
            <!-- 도트 -->
            <div>
                <span class="dot"></span> 
                <span class="dot"></span> 
                <span class="dot"></span> 
            </div>


            
       
            <!-- 추천메뉴 -->
            <div>
                <form action="">
                    <select name="category" id="cate">
                        <option value="한식">한식</option>
                        <option value="중식">중식</option>
                        <option value="일식">일식</option>
                        <option value="양식">양식</option>
                        <option value="기타">기타</option>
                    </select>
                </form>
                <div>
                    <h2>상품명</h2>
                    <p>가격/인분</p>
                    <img src="" alt=""><!--장바구니-->
                </div>
            </div>
            
       
            <!-- 실시간베스트 -->
            <h1>실시간베스트</h1>
            <table>
                <tr>
                    <td><img src="" alt="" width="" height="" href=""></td>
                    <td><img src="" alt="" width="" height="" href=""></td>
                    <td><img src="" alt="" width="" height="" href=""></td>
                </tr>
                <tr>
                    <td><a href="">상품명1</a></td>
                    <td><a href="">상품명2</a></td>
                    <td><a href="">상품명3</a></td>
                </tr>
                <tr>
                    <td><a href="">가격/인분</a></td>
                    <td><a href="">가격/인분</a></td>
                    <td><a href="">가격/인분</a></td>
                </tr>
            </table>
      
            <!-- 행사상품 -->
            <h1>행사상품</h1>
            <table>
                <tr>
                    <td><img src="" alt="" width="" height="" href=""></td>
                    <td><img src="" alt="" width="" height="" href=""></td>
                    <td><img src="" alt="" width="" height="" href=""></td>
                </tr>
                <tr>
                    <td><a href="">상품명1</a></td>
                    <td><a href="">상품명2</a></td>
                    <td><a href="">상품명3</a></td>
                </tr>
                <tr>
                    <td><a href="">가격/인분</a></td>
                    <td><a href="">가격/인분</a></td>
                    <td><a href="">가격/인분</a></td>
                </tr>
            </table>
        </section>
<%@ include file="views/common/footer.jsp" %>