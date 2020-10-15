<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.eol.order.model.vo.*, com.eol.product.model.vo.Product" %>

<%
	List<Orders> olist = (List)request.getAttribute("orderlist");////결제상태가 결제완료 이고, 배송상태가 배송중, 배송준비중, 배송완료, 구매확정인 것들만 담긴 오더리스트
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/orderviewlist.css">

<style>
nav{
float: left;
}
</style>

<section>

<%@ include file="/views/mypage/common/mypagenav.jsp" %>

	
	<div class="content">
		<h1>주문 / 배송조회</h1>
		<%if(olist.isEmpty()){ %>
		<div class="detail">
			<h1>주문내역이 없습니다!</h1>
		</div>
		<%}else{ %>
		<%for (Orders o : olist){ %>
		<div class="detail">
		<p><%=o.getoPayDate() %> (<%=o.getoNo() %>)</p>
		
				<div class="arriveDate">
					<p><%=o.getoDeliveryStatus() %></p>
					<!-- 배송중 또는 배송완료 -->
					<p><%=o.getoDeliveryEDate() %> 도착예정</p>
					<input type="hidden" id="oStatus" value="<%=o.getoStatus()%>">
                       <input type="hidden" id="oDeliveryStatus" value="<%=o.getoDeliveryStatus()%>">
				
				<form id="detailvieworder" action="<%=request.getContextPath() %>/memberOrderDetail" method="post">
					<input type="hidden" name="oooNo" value="<%=o.getoNo() %>">
					<input type="submit" class="odbtn" value="상세정보">
				</form>
							                       
			<button class="deliverybtn" onclick="delivery();">배송조회</button>
			
				</div>
			
			
			
			<div class="orderNumber">
			
			<input type="hidden" name="oNo" value="<%=o.getoNo()%>"/>
			
			<ul class="Button">
			
			<%if(o.getoDeliveryStatus().equals("배송준비중")){ %>
					<li><button id="cancel">취소신청</button></li>
					<%} %>
					<%if(o.getoDeliveryStatus().equals("배송완료")){ %>
					<li><button id="returnask">환불신청</button></li>
					<li><button id="orderdone">구매확정</button></li>
			                            <%} %>
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
					<p><%=od.getOdproduct().getpPrice() %>원 / 수량 : <%=od.getOdQty() %></p>
				</div>
			</div>
			<div class="orderButton">
				<%if(o.getoDeliveryStatus().equals("구매확정")){ %>
			                            <button id="review">리뷰쓰기</button>
			                            <%} %>
			</div>
			</div>
			<%} %>
			<%} %>
		</div>
		<%} %>
	
		</div>
</section>

<script>
function delivery(){
	console.log(document.getElementById("oStatus").value);
	var st = "결제완료";
	var dst = "베송준비중";
	if(document.getElementById("oStatus").value == st && document.getElementById("oDeliveryStatus").value == dst){
		console.log(document.getElementById("oStatus").value);
		alert("배송이 시작되면 조회가능합니다.");
		
		return false;
	}
	
		//배송조회 api 
	
}

$('#cancel').click(function(){
	   var identity = $("input[name='oNo']").val();
	   $.ajax({
	        type:"POST",
	        url:"<%=request.getContextPath()%>/cancelask",
	        data : {"oNo" : identity },
	        dataType : "text",
	        success: function(text){
	            console.log(text);
	           	alert("요청사항 전송 성공!");
	            $("#cancel").css("display","none");
	            $("#delivery").css("display","none");
	        },
	        error: function() {
	            alert("요청사항 전송 실패!");
	        }  
	    });

});

$('#returnask').click(function(){
	   var identity = $("input[name='oNo']").val();
	   console.log(identity);
	   $.ajax({
        type:"POST",
        url:"<%=request.getContextPath()%>/returnask",
        data : {"oNo" : identity },
        dataType : "text",
        success: function(text){
            console.log(text);
           	alert("요청사항 전송 성공!");
            $("#returnask").css("display","none");
            $("#orderdone").css("display","none");
        },
        error: function() {
            alert("요청사항 전송 실패!");
        }  
    });
})

$('#orderdone').click(function(){
	   var identity = $("input[name='oNo']").val();
	   console.log(identity);
	   $.ajax({
        type:"POST",
        url:"<%=request.getContextPath()%>/orderdone",
        data : {"oNo" : identity },
        dataType : "text",
        success: function(text){
            console.log(text);
           	alert("요청사항 전송 성공!");
            $("#returnask").css("display","none");
            $("#orderdone").css("display","none");
         	$("#review").css("display","block");
        },
        error: function() {
            alert("요청사항 전송 실패!");
        }  
    });
})


</script>


<%@ include file="/views/common/footer.jsp"%>