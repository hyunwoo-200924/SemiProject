<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.eol.member.model.vo.Member, com.eol.order.model.vo.Orders, com.eol.order.model.vo.WishList" %>

<%
	Member m = (Member) request.getSession().getAttribute("loginMember");
	
	Orders orderDetail = (Orders)request.getAttribute("orderDetail");
	
%>
<style>
.ono{
    padding-top: 25px;
    font-size: 25px;
}
.orderDetailContent{
    border: 1px solid black;
    width: 700px;
    height: 240px;
    margin-top: 20px;
    display: grid;
    grid-template-columns: auto auto auto auto;
        align-items: center;
    padding: 17px;
}
.price_box{
    display: grid;
    grid-template-columns: 1fr 3.5fr;
    font-size: 21px;
}
.baguny:hover{
	cursor: pointer;
}
</style>

<%@ include file="/views/common/header.jsp"%>

<section class="container">
			<%@ include file="/views/mypage/common/mypagenav.jsp" %>
			
			<div class="user_content_form_wrap">
				<div class="title">
					<h1>주문 내역 상세</h1>
				</div>
				
				<div class="user_request">
				
					<div class="ono">주문번호  <b><%=orderDetail.getoNo() %></b></div>
					<%for(Product p : orderDetail.getPs()){ %>
					<div class="orderDetailContent">
						<img src = '<%= request.getContextPath()%>/upload/product/<%= p.getpImage1() %>' style="width: 200px; height: 200px;">
						<div class="price_box">
							<input type="hidden" id="pno" value="<%= p.getpNo() %>">
							<span>상품명</span><span><b><%= p.getpName() %></b></span>
							<span>가격</span><span><b><%= p.getpPrice() %>원</b></span>
							<span>수량</span><span><b><%= p.getpCount() %>개</b></span>
						</div>
						<div style="font-size: 20px;"><%=orderDetail.getoStatus() %></div>
						<img src="<%=request.getContextPath() %>/images/product/cart40px.jpg" style="width:30px; height:30px grid-column: none;" class="baguny" onclick="cartInsert()">
					</div>
					<%} %>
				
				</div>
			</div>
		</section>
		<script>
		$('.baguny').mouseenter(function(){
			$(this).css('width',"40px").css('height',"40px");
		}).mouseleave(function(){
			$(this).css('width',"30px").css('height',"30px");
		})
		function cartInsert(){
			let pNo = $('#pno').val();
			location.href="<%=request.getContextPath()%>/views/cart/cartViewServlet?pNo="+pNo;
		}
		</script>
<%@ include file="/views/common/footer.jsp"%>
