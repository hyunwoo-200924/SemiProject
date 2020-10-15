<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.eol.order.model.vo.*, com.eol.product.model.vo.Product" %>

<%
	List<Orders> olist = (List)request.getAttribute("orderlist");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/orderviewlist.css">


<section>

<%@ include file="/views/mypage/common/mypagenav.jsp" %>

	
	<div class="content">
		<h1>주문 / 배송조회</h1>
		<!-- <form action="" name="orderView" id="orderView" method="post">
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
			</select> <input type="button" id="orderdate" value="조회">
		</form> -->
		
		<%if(olist.isEmpty()){ %>
		<div class="detail">
			<h1>주문내역이 없습니다!</h1>
		</div>
		<%}else{ %>
		<div class="detail">
			<div class="orderNumber">
			<span><%=o.getoPayDate() %> (<%=o.getoNo() %>)</span><button class="deliverybtn" onclick="">배송조회</button>
			<ul class="Button">
					<li><button onclick="">취소신청</button></li>
					<li><button>환불신청</button></li>
				</ul>
			
			</div>
			<% for(OrderDetail od : o.getDetails()){ %>
			<div class="odview">
			<div class="productView">
				<div class="order_pro_img">
					<img src="<%=request.getContextPath() %>/upload/product/<%=od.getOdproduct().getpImage1() %>" alt="" width="100" height="100">
				</div>
				<div class="order_pro_name">
					<h3><%=od.getOdproduct().getpName() %></h3>
					<p><%=od.getOdproduct().getpPrice() %> / <%=od.getOdQty() %></p>
				</div>
			</div>
			<div class="orderButton">
				<div class="arriveDate">
					<p><%=o.getoDeliveryStatus() %></p>
					<!-- 배송중 또는 배송완료 -->
					<p><%=o.getoDeliveryEDate() %> 도착예정</p>
				</div>
				<ul class="Button">
					<%-- <form action="<%=request.getContextPath() %>/cancel.do" name="cancel" id="cancel" method="">
					<input type="hidden" value="<%=o.getoNo() %>" name="canceloNo">
					</form> --%>
					<li><button>리뷰쓰기</button></li>
				</ul>
			</div>
			</div>
			<%} %>
			
		</div>
		<%} %>
	<%} %>
		</div>
</section>

<script>
$("#cancel").submit();
$("#orderdate").click()
</script>


<%@ include file="/views/common/footer.jsp"%>