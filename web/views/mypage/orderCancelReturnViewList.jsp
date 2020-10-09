<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.eol.order.model.vo.*, com.eol.product.model.vo.Product" %>
	
	
<%
	List<Orders> olist = (List)request.getAttribute("orderlist");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/orderCancelReturnViewList.css">


<section>
	<%@ include file="/views/mypage/common/mypagenav.jsp"%>
	<div class="content">
		<h1>취소 / 반품 조회</h1>
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
		<%for(Orders o : olist) {%>
			<div class="orderNumber">
				<p><%=o.getoRDate() %>(<%=o.getoNo() %>)</p>
			</div>
			<%for(OrderDetail od : o.getDetails()){ %>
			<div class="productView">
				<div class="order_pro_img">
					<img src="<%=request.getContextPath() %>/images/product/<%=od.getOdproduct().getpImage1() %>" alt="" width="100" height="100">
				</div>
				<div class="order_pro_name">
					<h3><%=od.getOdproduct().getpName() %></h3>
					<p><%=od.getOdproduct().getpPrice() %> / <%=od.getOdQty() %></p>
				</div>
			</div>
			<%} %>
			<div class="orderButton">
				<div class="arriveDate">
					<%if(o.getoStatus().equals("취소신청") || o.getoStatus().equals("취소완료")) {%>
					<p><%=o.getoStatus() %></p>
					<%}else{ %>
					<p><%=o.getoDeliveryStatus() %></p>
					<%} %>
				</div>
				<ul class="Button">
					<li><button>
							<a href="">상세보기</a>
						</button></li>
				</ul>
			</div>
			<%} %>
		</div>
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>