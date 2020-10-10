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


        <section>
         <h2>포인트</h2>
         <%if(pointlist.isEmpty()){ %>
         	<h1>포인트가 없습니다.</h1>
         <%} else{%>
         	<%for(Point p : pointlist){ %>
		         <div class="userPoint" style="border: 1px red solid;">
		             <p> 사용 가능 포인트</p><br>
		             <p>총 포인트 보여주기</p>
		         </div>
		        </section>
		        <section>
		            <div class="get_use_Point">
		                <h2>적립/사용내역</h2>
		                <hr>
		            </div>
		        </section>
		        <section>
		                <table id="tbl-board">
		                    <tr>
		                        <th>번호</th>
		                        <td><%=p.getPoNo() %></td>
		                    </tr>
		                    <tr>
		                        <th>상태</th>
		                        <td><%=p.getPoStatus() %></td>
		                    </tr>
		                    <tr>
		                        <th>날짜</th>
		                        <td><%=p.getPoDate() %></td>
		                    </tr>
		                    <tr>
		                        <th>포인트</th>
		                        <td><%=p.getPoPoint() %></td>
		                    </tr>
		        </section>
         	<%} %>
         <%} %>
     </form>
</section>
<%@ include file="/views/common/footer.jsp"%>