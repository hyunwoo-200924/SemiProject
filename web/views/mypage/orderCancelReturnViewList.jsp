<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.eol.order.model.vo.*, com.eol.product.model.vo.Product" %>
	
	
<%
	List<Orders> olist = (List)request.getAttribute("orderlist");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/orderCancelReturnViewList.css">
<style>
	nav{
		    padding-left: 20px;
		        float: left;
	}
</style>

<section>
	<%@ include file="/views/mypage/common/mypagenav.jsp"%>
	<div class="content">
	<div style="border-bottom:1px gray solid; margin-bottom: 10px;">
		<h1>취소 / 반품 조회</h1>
		</div>
		<%if(olist.isEmpty()){ %>
		<div class="detail">
		<h1>취소/반품 내역이 없습니다!</h1>
		</div>
		<%}else{ %>
		<div class="detail">
		<%for(Orders o : olist) {%>
			<div class="orderNumber">
				<p><%=o.getoPayDate() %>(<%=o.getoNo() %>)</p>
			</div>
				<div class="arriveDate">
					<%if(o.getoStatus().equals("취소신청") || o.getoStatus().equals("취소완료")) {%>
					<p><%=o.getoStatus() %></p>
					<%}else{ %>
					<p><%=o.getoDeliveryStatus() %></p>
					<%} %>
				</div>
			<%for(OrderDetail od : o.getDetails()){ %>
			<div class="productView" onclick="location.href='<%=request.getContextPath()%>/product/productView?pNo=<%=od.getpNo()%>'" style="cursor: pointer;">
				<div class="order_pro_img">
					<img src="<%=request.getContextPath() %>/upload/product/<%=od.getOdproduct().getpImage1() %>" alt="" width="100" height="100">
				</div>
				<div class="order_pro_name">
					<h3><%=od.getOdproduct().getpName() %></h3>
					<p><%=od.getOdproduct().getpPrice() %> / <%=od.getOdQty() %></p>
				</div>
			</div>
			<%} %>
			
			
			<%} %>
		</div>
		<%} %>
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>