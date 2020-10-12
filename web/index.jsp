<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="views/common/header.jsp" %>
<!-- 메인섹션 -->
<section class="main">

	<!-- 광고배너 -->
	<div class="slideshow-container" onclick="">
		<!-- 화면에 나올 이미지와 텍스트(div와 img태그) -->
		<div class="mySlides fade">
			<div class="numbertext">1 / 3</div>
			<img src="<%=request.getContextPath() %>/images/mainImages/gogi.jpg" style="width: 100%">
			<div class="text">	
				삼겹살<br>23,000원
			</div>
			<a type="input" class="cart"><img src="<%=request.getContextPath() %>/images/mainImages/shopping-cart-solid.svg"></a>
			<!--장바구니에 현재 광고 상품 담기-->
		</div>
		
		<div class="mySlides fade">
			<div class="numbertext">2 / 3</div>
			<img src="<%=request.getContextPath() %>/images/mainImages/gim.jpg" style="width: 100%">
			<div class="text">
				김치찌개<br>15,000원
			</div>
			<a type="input" class="cart"><img src="<%=request.getContextPath() %>/images/mainImages/shopping-cart-solid.svg"></a>
			<!--장바구니에 현재 광고 상품 담기-->
		</div>

		<div class="mySlides fade">
			<div class="numbertext">3 / 3</div>
			<img src="<%=request.getContextPath() %>/images/mainImages/pasta.jpg" style="width: 100%">
			<div class="text">
				파스타<br>34,000원
			</div>
			<a type="input" class="cart"><img src="<%=request.getContextPath() %>/images/mainImages/shopping-cart-solid.svg"></a>
			<!--장바구니에 현재 광고 상품 담기-->
		</div>

		<!-- 이전, 다음으로 넘어가기 위한 화살표(a 태그) -->
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a> <br>

		<div class="dots" style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span>
		</div>
	</div>

	<!-- 광고배너 스크립트 -->
	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}
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