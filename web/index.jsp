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
%>
<style>
/*section.main style*/
.section {
	padding-top: 40px;
	padding-bottom: 40px;
}


/*광고배너 스타일*/
* {
    margin: 0;
    padding: 0; 
    list-style: none;
}

.slider-title{
	background-color: white;
}

#slider-wrap {
    
    width: 100%;
    height: 400px;
    position: relative;
    overflow: hidden;
}

#slider-wrap ul#slider {
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
}

#slider-wrap ul#slider li {
    float: left;
    position: relative;
    width: 600px;
    height: 400px;
}

#slider-wrap ul#slider li>div {
    position: absolute;
    top: 20px;
    left: 35px;
}

#slider-wrap ul#slider li>div h3 {
    font-size: 36px;
    text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
    font-size: 21px;
}

#slider-wrap ul#slider li img {
    display: block;
    width: 100%;
    height: 100%;
}

/*btns*/
.slider-btns {
    position: absolute;
    width: 50px;
    height: 60px;
    top: 50%;
    margin-top: -25px;
    line-height: 57px;
    text-align: center;
    cursor: pointer;
    background: rgba(0, 0, 0, 0.1);
    z-index: 100;
    -webkit-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -ms-user-select: none;
    -webkit-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.slider-btns:hover {
    background: #0382a4bf;
}

#next {
    right: -50px;
    width: 50px;
    height: 50px;
    border-radius: 100px;
    color: #eee;
}

#previous {
    width: 50px;
    left: -50px;
    height: 50px;
    border-radius: 100px;
    color: white;
    align-items: center;
}

#slider-wrap.active #next {
    right: 0px;
}

#slider-wrap.active #previous {
    left: 0px;
}

/*bar*/
#slider-pagination-wrap {
    min-width: 20px;
    margin-top: 350px;
    margin-left: auto;
    margin-right: auto;
    height: 15px;
    position: relative;
    text-align: center;
}

#slider-pagination-wrap ul {
    width: 100%;
}

#slider-pagination-wrap ul li {
    margin: 0 4px;
    display: inline-block;
    width: 5px;
    height: 5px;
    border-radius: 50%;
    background: #fff;
    opacity: 0.5;
    position: relative;
    top: 0;
}

#slider-pagination-wrap ul li.active {
    width: 12px;
    height: 12px;
    top: 3px;
    opacity: 1;
    -webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
    box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

/*ANIMATION*/
#slider-wrap ul,
#slider-pagination-wrap ul li {
    -webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
    -o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
    transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}

/**********************************************/
/*추천메뉴 스타일*/
.recommend-container { /*추천메뉴의 전체적인 <div>부분*/
	max-width: 1260px;
	height: 500px;
	cursor: pointer;
	overflow: hidden;
	position: relative; 
	margin: auto; /*가운데로 잘 자리잡게 해줌*/
}

.taste-select {
	/* width: 600px;
	height: 80px; */
	position: absolute;
	top: 20%;
	left: 20px;
	font-size: 70px;
	
}

.recommend-img {
	width: 450px;
	height: 450px;
	margin: auto;
	padding: 40px;
}

.recommend-content {
	position: absolute;
	right: 200px;
	top: 20%;	
}
.recommend-name{
	font-size: 50px;
}
.recommend-content .cart {
	position: absolute;
	right: 200px;
	top: 30%;
}

/***********************************************************/
/*실시간 베스트, 행사상품 스타일*/
.best-container{
	padding-top: 20px;
	max-width: 1260px;
	height: auto;
	cursor: pointer;
	overflow: hidden;
	position: relative; 
	margin: auto;
}


.best-container h1{
	font-size: 40px;
	letter-spacing: 2px;
	padding: 30px;
	padding-bottom: 10px;
}

.main-best {
	margin: auto;
	text-align: center;
}
.main-best td img{
	width: 300px;
	height: 300px;
	
}

tr.name{
	font-size: 20px;
	font-weight: bolder;
}

.main-best td a{
	text-decoration: none;
	color: black;
}
</style>
<!-- 메인섹션 -->
<section class="main">

	<!-- 광고배너 -->

	<div id="slider-wrap">
        <ul id="slider">
        <% for( Product p : slidePlist ) {
        	System.out.println(p.getpImage1());%>
            <li>
                <div class="slider-title">
                    <h3><%=p.getpName() %></h3>
                    <span><%=p.getpPrice() %>원 / <%=p.getpServing() %>인분</span>
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
	<div class="recommend-container" >
		<div class="taste-select">
			<form action="">
				<select name="taste-category" class="taste-cate">
					<option value="새콤한맛">새콤한맛</option>
					<option value="짭짤한맛">담백한맛</option>
					<option value="매콤한맛">매콤한맛</option>
					<option value="담백한맛">담백한맛</option>
					<option value="이국적인맛">이국적인맛</option>
				</select>
			</form>
		</div>
		<div class="recommend-img">
			<img src="<%=request.getContextPath()%>/images/mainImages/gim.jpg" alt="" style="width:100%; height:100%;">
		</div>
		<div class="recommend-content">
			<div class="recommend-name">
				<h2>상품명</h2>
				<p>가격/인분</p>
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
					<td><img src="<%=request.getContextPath()%>/images/mainImages/gim.jpg" alt="" width="" height="" ></td>
					<td><img src="<%=request.getContextPath()%>/images/mainImages/gogi.jpg" alt="" width="" height="" ></td>
					<td><img src="<%=request.getContextPath()%>/images/mainImages/pasta.jpg" alt="" width="" height="" ></td>
				</tr>
				<tr class="name">
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
		</div>
	</div>

	<!-- 행사상품 -->
	
	<div class="best-container">
		<h1>핫딜상품</h1>
		<div class="best-table">
			<table class="main-best">
				<tr>
					<td><img src="<%=request.getContextPath()%>/images/mainImages/gim.jpg" alt="" width="" height="" ></td>
					<td><img src="<%=request.getContextPath()%>/images/mainImages/gogi.jpg" alt="" width="" height="" ></td>
					<td><img src="<%=request.getContextPath()%>/images/mainImages/pasta.jpg" alt="" width="" height="" ></td>
				</tr>
				<tr class="name">
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
		</div>
	</div>
</section>

<section class="fixed">
</section>
<%@ include file="views/common/footer.jsp" %>