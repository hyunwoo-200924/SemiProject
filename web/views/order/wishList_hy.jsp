<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.eol.member.model.vo.Member, com.eol.order.model.vo.Orders, com.eol.order.model.vo.WishList" %>

<%
	Member m = (Member) request.getSession().getAttribute("loginMember");
	List<WishList> list = (List)request.getAttribute("WishList");
	
	
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
.wish_box{
    display: grid;
    grid-template-columns: auto;
    font-size: 21px;
}
.baguny:hover{
	cursor: pointer;
}
.cooktime{
    position: relative;
    bottom: 26.5px;
    left: 50px;
    border-left: 2px solid #ccc;
    height: 21px;
    padding-left: 5px;
}
.serving:after{
content='';

}
</style>

<%@ include file="/views/common/header.jsp"%>

<section class="container">
			<%@ include file="/views/mypage/common/mypagenav.jsp" %>
			
			<div class="user_content_form_wrap">
				<div class="title">
					<h1>쇼핑찜</h1>
				</div>
				
				<div class="user_request">
				
					<div class="ono"><b>총  <%= list.size() %>개</b></div>
					<%for(WishList w : list){ %>
					<div class="orderDetailContent">
						<img src = '<%= request.getContextPath()%>/upload/product/<%= w.getpImage1() %>' style="width: 200px; height: 200px;">
						<div class="wish_box">
							<input type="hidden" id="pno" value="<%= w.getpNo() %>">
							<span><b><%= w.getpName() %></b></span>
							<span><%= w.getpPrice() %>원</span>
							<span class="serving"><%= w.getpServing() %>인분</span><span class="cooktime"><%= w.getpCookTime() %>분</span>	
						</div>
						<img src="<%=request.getContextPath() %>/images/product/cart40px.jpg" style="width:30px; height:30px; grid-column-start: 4; " class="baguny" onclick="cartInsert()">
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
