<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.eol.member.model.vo.*, com.eol.order.model.vo.Orders" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/memberJoinEnd.css">
	
	
	<style>
	#button{
		
	    margin-left: 550px;
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
           <div id="joinhead" >
                <div id="join" style="text-align: center; font-size: 50px; border:none;">회 원 가 입 완 료</div>
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
                <h2 align="center" style="margin-top:80px; margin-bottom: 80px;">1,000P 지급 완료!</h2>
                <div id="button" style="margin-bottom: 20px;">
                    <button><a href="<%=request.getContextPath() %>/mainview.do" style="color: white;">메인화면으로 이동</a></button>
                  
                    <button><a href="<%=request.getContextPath()%>/login.do" style="color: white;">로그인하기</a></button>
                   
                </div>
            </div>
        </div>
     </section>
     
     <%@ include file="/views/common/footer.jsp" %>
     