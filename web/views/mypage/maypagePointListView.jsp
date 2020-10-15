<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.eol.member.model.vo.Point" %>

<%
	List<Point> pointlist = (List)request.getAttribute("pointlist");
%>

<%@ include file="/views/common/header.jsp"%>

<section>

<form action="#" style="display: block; width: 100%; height:300px; ">

<%@ include file="/views/mypage/common/mypagenav.jsp" %>


<%@ include file="/views/common/footer.jsp"%>
	<div>
		<h1 style="margin-left: 745px; display: block; width: 100%;margin-top: -245px;">나의 포인트</h1>
	</div>
	<%if(pointlist.isEmpty()){ %>
	<div>
		<h2 style="margin-left: 728px; margin-top: 167px;"> 포인트가 없습니다.</h2>
	</div>
	<%} else{%>
	<%for(Point p : pointlist){ %>
				<div class="cart-section-body-group2">
                <div style="margin-left: 484px;margin-top: 63px;">
                <p style="margin-left: 5px; font-size: 20px;">번호 :<%=p.getPoNo() %></p>
              	<div style="display: flex" class="count-con">
               	<input style="border: none; font-size: 20px;" type="text" value="<%=p.getPoStatus() %>" class="pCount" readonly>
                </div>
                <div style=" font-size: 20px; margin-left: 394px;"><P style="margin-left: -391px;"><%=p.getPoDate() %></P>
                </div>
                <div style=" font-size: 20px; margin-left: 394px;"><P style="margin-left: -389px;">포인트 :<%=p.getPoPoint() %></P>
                </div>
                </div>
            	</div>
		
		<%} %>
    <%} %>