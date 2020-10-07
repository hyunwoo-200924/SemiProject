<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/orderviewlist.css">

<section>
	<div class="aside"></div>
	<div class="content">
		<h1>주문 / 배송조회</h1>
		<form action="" name="orderView" id="orderView" method="">
			<select name="year" id="year">
				<option value="2019">2019년</option>
				<option value="2020">2020년</option>
			</select> <select name="month" id="month">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select> <input type="submit" value="조회">
		</form>
		<div class="detail">
			<div class="orderNumber">
				<p>2020 / 9 / 1 (20200901-89891212)</p>
			</div>
			<div class="productView">
				<div class="order_pro_img">
					<img src="임시로고.jpg" alt="" width="100" height="100">
				</div>
				<div class="order_pro_name">
					<h3>상품명</h3>
					<p>가격 / 수량</p>
				</div>
			</div>
			<div class="orderButton">
				<div class="arriveDate">
					<p>배송준비중</p>
					<!-- 배송중 또는 배송완료 -->
					<p>9 / 3 수요일 도착예정</p>
				</div>
				<ul class="Button">
					<li><button>
							<a href="">배송조회</a>
						</button></li>
					<li><button>
							<a href="">교환신청</a>
						</button></li>
					<li><button>
							<a href="">반품신청</a>
						</button></li>
					<li><button>
							<a href="">리뷰쓰기</a>
						</button></li>
				</ul>
			</div>
		</div>
</section>


<%@ include file="/views/common/footer.jsp"%>