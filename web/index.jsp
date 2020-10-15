<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eol.product.model.vo.Product, java.util.List, com.eol.product.service.ProductService " %>
<%@ include file ="views/common/header.jsp" %>
<%
	//List<Product> slidePlist = request.getAttribute("slidePlist");
	//List<Product> bestPlist = request.getAttribute("bestPlist");
	//List<Product> hotdealPlist = request.getAttribute("hotdealPlist");
%>
<%
	List<Product> slidePlist = (List)new ProductService().slidePlist();
	List<Product> bestPlist = (List)new ProductService().bestPlist();
	List<Product> hotdealPlist = (List)new ProductService().hotdealPlist();
	Product pro = new ProductService().todayPro();
%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/index.css">
<!-- 메인섹션 -->
<section class="main">

	<!-- 광고배너 -->

	<div id="slider-wrap">
        <ul id="slider">
        <% for( Product p : slidePlist ) {
        	System.out.println(p.getpImage1());%>
            <li id="slider-click" onclick="location.href='<%=request.getContextPath()%>/product/productView?pNo=<%=p.getpNo()%>'">
                <div class="slider-title">
                    <h3><%=p.getpName() %></h3>
                    <span><%=p.getpPrice() %>원 / <%=p.getpServing() %>인분</span>
                    <p><%=p.getpDetailMain() %></p>
                </div>
                <img src="<%=request.getContextPath()%>/upload/product/<%=p.getpImage1()%>">
            </li>
    	<%} %>
    	<%-- <li>
                <div class="slider-title">
                    <h3>상품명</h3>
                    <span>상품가격 / 상품인분</span>
                </div>
                <img src="<%=request.getContextPath()%>/images/mainImages/gogi.jpg">
            </li>
            <li>
                <div>
                    <h3>Slide #2</h3>
                    <span>Sub-title #2</span>
                </div>
                <img src="https://fakeimg.pl/350x200/D27328/000?text=22222">
            </li>
    
            <li>
                <div>
                    <h3>Slide #3</h3>
                    <span>Sub-title #3</span>
                </div>
                <img src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
            </li> --%>
    
           
        </ul>
    
        <div class="slider-btns" id="next"><span>▶</span></div>
        <div class="slider-btns" id="previous"><span>◀</span></div>
    
        <div id="slider-pagination-wrap">
            <ul>
            </ul>
        </div>
    </div>


	<!-- 광고배너 스크립트 -->
	<script>
	 //slide-wrap
	var slideWrapper = document.getElementById('slider-wrap');
	//current slideIndexition
	var slideIndex = 0;
	//items
	var slides = document.querySelectorAll('#slider-wrap ul li');
	//number of slides
	var totalSlides = slides.length;
	//get the slide width
	var sliderWidth = slideWrapper.clientWidth;
	//set width of items
	slides.forEach(function (element) {
	    element.style.width = sliderWidth + 'px';
	})
	//set width to be 'x' times the number of slides
	var slider = document.querySelector('#slider-wrap ul#slider');
	slider.style.width = sliderWidth * totalSlides + 'px';

	// next, prev
	var nextBtn = document.getElementById('next');
	var prevBtn = document.getElementById('previous');
	nextBtn.addEventListener('click', function () {
	    plusSlides(1);
	});
	prevBtn.addEventListener('click', function () {
	    plusSlides(-1);
	});

	// hover
	slideWrapper.addEventListener('mouseover', function () {
	    this.classList.add('active');
	    clearInterval(autoSlider);
	});
	slideWrapper.addEventListener('mouseleave', function () {
	    this.classList.remove('active');
	    autoSlider = setInterval(function () {
	        plusSlides(1);
	    }, 3000);
	});


	function plusSlides(n) {
	    showSlides(slideIndex += n);
	}

	function currentSlides(n) {
	    showSlides(slideIndex = n);
	}

	function showSlides(n) {
	    slideIndex = n;
	    if (slideIndex == -1) {
	        slideIndex = totalSlides - 1;
	    } else if (slideIndex === totalSlides) {
	        slideIndex = 0;
	    }

	    slider.style.left = -(sliderWidth * slideIndex) + 'px';
	    pagination();
	}

	//pagination
	slides.forEach(function () {
	    var li = document.createElement('li');
	    document.querySelector('#slider-pagination-wrap ul').appendChild(li);
	})

	function pagination() {
	    var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
	    dots.forEach(function (element) {
	        element.classList.remove('active');
	    });
	    dots[slideIndex].classList.add('active');
	}

	pagination();
	var autoSlider = setInterval(function () {
	    plusSlides(1);
	}, 3000);
	</script>



	<!-- 추천메뉴 -->
	<div class="recommend-container" onclick="location.href='<%=request.getContextPath()%>/product/productView?pNo=<%=pro.getpNo()%>'" >
	<h1>오늘의 추천메뉴</h1>
		<!-- <div class="taste-select">
			<form action="">
				<select name="taste-category" class="taste-cate">
					<option value="새콤한맛">새콤한맛</option>
					<option value="짭짤한맛">담백한맛</option>
					<option value="매콤한맛">매콤한맛</option>
					<option value="담백한맛">담백한맛</option>
					<option value="이국적인맛">이국적인맛</option>
				</select>
			</form>
			
		</div> -->
		<div class="recommend-img" style="background: linear-gradient(
            to right,
            rgba(255, 255, 255, 0) 10%,
            rgba(255, 255, 255, 0.25) 25%,
            rgba(255, 255, 255, 0.5) 50%,
            rgba(255, 255, 255, 0.75) 75%,
            rgba(255, 255, 255, 1) 100%
          ), url(<%=request.getContextPath()%>/upload/product/<%=pro.getpImage1() %>);
          background-repeat: no-repeat;
	background-size: 100% 100%;">
			<%-- <img src="<%=request.getContextPath()%>/images/mainImages/gim.jpg" alt="" style="width:100%; height:100%;"> --%>
		</div>
		<div class="recommend-content">
			<div class="recommend-name">
				<h2 style="margin-top: 20px;"><%=pro.getpName() %></h2>
				<p><%=pro.getpPrice() %>원 / <%=pro.getpServing() %>인분</p>
				<br><br>
				<p class="dmain"><%=pro.getpDetailMain() %></p>
			</div>
			<div class="cart">
				<img src="<%=request.getContextPath() %>/images/mainImages/shopping-cart-solid.svg" alt="">
			</div>
		</div>
	</div>
	<!-- 실시간베스트 -->
	<div class="best-container">
		<h1>실시간베스트</h1>
		<div class="best-table">
			<table class="main-best">
				<tr>
				<% for(Product p : bestPlist){%>
					<td onclick="location.href='<%=request.getContextPath()%>/product/productView?pNo=<%=p.getpNo()%>'">
						<img src="<%=request.getContextPath()%>/upload/product/<%=p.getpImage1() %>" alt="" width="" height="" >
					</td>
				<%} %>
				</tr>
				<tr class="name">
				<%for(Product p : bestPlist) {%>
					<td onclick="location.href='<%=request.getContextPath()%>/product/productView?pNo=<%=p.getpNo()%>'">
						<%=p.getpName() %>
					</td>
				<%} %>
				</tr>
				<tr>
				<%for(Product p : bestPlist) {%>
					<td onclick="location.href='<%=request.getContextPath()%>/product/productView?pNo=<%=p.getpNo()%>'">
						<%=p.getpPrice() %>원 / <%=p.getpServing() %>인분
					</td>
				<%} %>
				</tr>
			</table>
		</div>
	</div>

	<!-- 행사상품 -->
	
	<div class="best-container">
		<h1>핫딜상품</h1>
		<div class="best-table">
			<table class="main-hot">
			<%for(Product p : hotdealPlist){ 
				if(p.getpDiscount()!=0){%>
				<tr onclick="location.href='<%=request.getContextPath()%>/product/productView?pNo=<%=p.getpNo()%>'">
					<td><img src="<%=request.getContextPath()%>/upload/product/<%=p.getpImage1() %>" alt="" width="" height="" ></td>
					<td class="name"><%=p.getpDetailMain()%><br><%=p.getpName() %></td>
					<td><%=p.getpPrice() %>원 / <%=p.getpServing() %>인분</td>	
					<td><p class="discount"><%=p.getpDiscount() %>% 에누리</td>
				</tr>
				<%}
			} %>
				<!-- <tr class="name">
					
					<td><a href="">상품명2</a></td>
					<td><a href="">상품명3</a></td>
				</tr>
				<tr>
					
					<td><a href="">가격/인분</a></td>
					<td><a href="">가격/인분</a></td>
				</tr> -->
			</table>
		</div>
	</div>
</section>

<section class="fixed">
</section>
<%@ include file="views/common/footer.jsp" %>