<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eol.order.model.vo.*, java.util.List" %>

<%
	Member m = (Member)request.getSession().getAttribute("loginMember");
	Orders o=(Orders)request.getAttribute("nMOrder");
	List<OrderDetail> list = (List)request.getAttribute("odlist");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/noneorderDelivery.css">
<style>
nav{
	    float: left;
}
section h1{
	left: 200px;
    top: 250px;
}
div.content2{
left: 220px;
    top: 350px;
}
div.content3 {
    position: absolute;
    left: 220px;
    top: 450px;
    padding: 10px;
}
div.content5 {
    position: absolute;
    left: 230px;
    top: 560px;
}
.content4 {
    position: absolute;
    left: 230px;
    top: 700px;
}
.arriveDate p {
    font-size: 16px;
}
ul.Button{
padding-bottom: 40px;
}
.Button li{
float: left;

}
</style>
<%@ include file="/views/mypage/common/mypagenav.jsp" %>

<section>
 <h1>주문 / 배송 상세내역 조회</h1>
                <div class="content2">
                    <h2 class="cont_title">주문자 정보</h2>
                    <div class=cont_content>
                    <p>이름 : <%=o.getoName() %></p>
                    <p>연락처 : <%=o.getoPhone() %></p>
                    </div>
                </div>

                <div class="content3">
                    <h2 class="cont_title">배송정보</h2>
                    <div class="cont_content">
                        <p>배송지 : <%=o.getoAddress() %></p>
                        <p><%=o.getoStatus() %> : <%=o.getoPayDate() %></p>
                    </div>
                </div>
                
                <div class="content4">
                   <div class="orderNumber">
                        <p><%=o.getoPayDate() %> (<%=o.getoNo() %>)</p>
                    </div>
                       <%if(o.getoStatus().equals("결제완료")) {%>
                       <div id="delivery">
                        <div class="arriveDate">
                            <p><%=o.getoDeliveryStatus() %></p><!-- 배송중 또는 배송완료 -->
                            <p><%=o.getoDeliveryEDate() %> 도착예정</p>
                        </div>
                       
                       
                       <input type="hidden" id="oStatus" value="<%=o.getoStatus()%>">
                       <input type="hidden" id="oDeliveryStatus" value="<%=o.getoDeliveryStatus()%>">
                       
                     <button class="deliview"  onclick="delivery();">배송조회</button>
                     </div>
                     <%} %>
                     
			                    <div class="orderButton">
			                      
			                      <input type="hidden" name="oNo" value="<%=o.getoNo()%>"/>
			                       
			                        <ul class="Button">
			                        
			                      
			                        <%if(o.getoStatus().equals("결제완료") && o.getoDeliveryStatus().equals("배송준비중")){ %>
			                            <li><button id="cancel">취소신청</button></li>
			                            <%}%>
			                          <%if(o.getoDeliveryStatus().equals("배송완료")){ %>
			                            <li><button id="returnask">환불신청</button></li>
			                            <li><button id="orderdone">구매확정</button></li>
			                            <%} %>
			                        </ul>
			                    </div>
                    <div class="productView">
                    <%for(OrderDetail od : list) {%>
                    <form action="<%=request.getContextPath() %>/review/reviewWrite" method="post" id="submitReview">
                    <input type="hidden" name="odNo" id="odNo" value="<%=od.getOdNo()%>">
                    <input type="hidden" name="odpNo" id="odpNo" value="<%=od.getpNo()%>">
                    <input type="hidden" name="pName" id="pName" value="<%=od.getOdproduct().getpName()%>">
                    <input type="hidden" name="mName" id="mName" value="<%=m.getmName()%>">
                    </form>
                        <div class="orderproduct">
                            <div class="order_pro_img">
                                <img src="<%=request.getContextPath() %>/upload/product/<%=od.getOdproduct().getpImage1() %>" alt="" width="150" height="150">
                            </div>
                            <div class="order_pro_name">
                                <h3><%=od.getOdproduct().getpName() %></h3>
                                <p><%=od.getOdproduct().getpPrice() %>원 / 수량 : <%=od.getOdQty() %></p>
                            </div>
			                            <%if(o.getoDeliveryStatus().equals("구매확정")){ %>
			                            <button id="toReview"  
			                            			style="
														    margin-left: 400px;
														    margin-top: 100px;
														    cursor: pointer;
															background-color: black;
															height: 25px;
															border: 0px;
															border-radius: 5px;
															text-decoration: none;
															color: white
														">리뷰쓰기</button>
			                            <%} %>
                        </div>
                        <%} %>
                        <div class="ordernotice">
                            <p>도착일, 배송지변경 및 주문취소는<br>
                                주문마감기한인 <%=o.getoDeliveryDate() %> 07:00 까지 가능합니다.</p>
                        </div>
                    </div>
                </div>
                <div class="content5">
                    <h2 class="cont_title">결제정보</h2>
                    <table class="cont_content">
                        <tr>
                            <td>결제수단 : <%=o.getoPayWays() %></td>
                            <td>총 상품금액 : <%=o.getoPayment()-3000 %>원 </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>총 배송비 : 3,000원</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>총결제금액 <%=o.getoPayment() %> </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
        
        <script>
       $("#toReview").click(function(){
    	   
        	$("#submitReview").submit();
        	console.log($("#odNo").val());
        	console.log($('#odpNo').val());
        	console.log($('#pName').val());
        	console.log($('#mName').val());
       });
        
        
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