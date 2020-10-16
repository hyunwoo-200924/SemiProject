<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.eol.member.model.vo.*, com.eol.order.model.vo.Orders" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/memberJoinEnd.css">
	
	<% 
		Member m = (Member)request.getSession().getAttribute("loginMember");
		Orders o = (Orders)request.getAttribute("order");
	%>
	<style>
	#button{
		
	    margin-left: 500px;
    margin-top: 40px;
	}
	#button button{
		cursor: pointer;
		background-color: black;
		height: 25px;
		border: 0px;
		border-radius: 5px;
		text-decoration: none;
		font-color: white;	
	}
	
	</style>
<section>
        <div class="mainDiv">
           <div id="joinhead" style="border: red 1px solid;">
                <div id="join" style="text-align: center; font-size: 50px; border:none;">주 문 완 료</div>
                <!-- <div>
                    <table>
                        <tr id="joinMsg">
                            <th id="joinMent">본인인증</th>
                            <th><img src="angle-right-solid.svg" width="20px" height="20px"></th>
                            <th id="joinMent">회원정보 입력</th>
                            <th><img src="angle-right-solid.svg" width="20px" height="20px"></th>
                            <th id="joinMent">가입완료</th>
                        </tr>
                    </table>
                </div> -->
            </div>
            <div id="content">
                <h2 align="center" style="margin-top:100px">주문번호(<%=o.getoNo() %>)<br>주문이 정상처리가 되었습니다.</h2>
                <div id="button">
                    <button><a href="<%=request.getContextPath() %>/mainview.do" style="color: white;">메인화면으로 이동</a></button>
                    <%if(m!=null){ %>
                    <button><a href="<%=request.getContextPath()%>/orderViewList.do" style="color: white;">주문/결제 조회하기</a></button>
                    <%}else{ %>
                    <button><a href="<%=request.getContextPath()%>/login.do" style="color: white;">주문/결제 조회하기</a></button>
                    <%} %>
                </div>
            </div>
        </div>
     </section>
     