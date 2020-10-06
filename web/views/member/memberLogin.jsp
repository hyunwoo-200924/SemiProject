<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.eol.member.model.vo.Member" %>
<%
	//로그인 된 상태이면 loginMember에 값이 있다.
	//로그인 안된 상태이면 loginMEmber가 null값이 된다.
	/* Member loginMember= (Member)session.getAttribute("loginMember"); */
	
	//아이디 저장하기
	Cookie[] cookies =request.getCookies();
	
	String saveId=null;
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
			}
		}
	}


%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/member/memberLogin.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<!-- 로그인 페이지 화면 시작 -->
	<div class="loginTxtFrm">
        	<h1 class="log_menu">회원 로그인</h1>
        	<h1 class="nonLog_menu">비회원 주문조회</h1>
    </div>
    <form class="joinLoginContainer" action="<%=request.getContextPath()%>/loginfrm.do" method="post">
	    <div class="loginContainer" ">
            	<input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요" value='<%=saveId != null?saveId:"" %>'><br><br>
            	<input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요"><br><br>
            <input type="checkbox" name="saveId" id="saveId"<%=saveId!=null?"checked":"" %>><label for="saveId">아이디저장</label>&nbsp;&nbsp;
            <a href="#" onclick="location.replace('<%=request.getContextPath()%>/findId.do')">아이디 찾기</a>
            <a href="#" onclick="location.replace('<%=request.getContextPath()%>/findPw.do')">비밀번호 찾기</a><br><br>
            <input type="submit" name="loginBtn" id="loginBtn" value="로그인">
            <input type="submit" name="joinBtn" id="joinBtn" value="회원가입" onclick="location.replace('<%=request.getContextPath()%>/memberjoin.do')">
    	</div>   
    </form>
    <!-- 로그인 페이지 화면 끝 -->
    
    <!-- 비회원 주문 페이지 화면 시작 -->
    <form class="noUserLoginContainer" action="<%=request.getContextPath()%>/noMemorderNumview.do" method="post">
    	<div class="noUserLogin-Container" style="display: none">
           	 <input type="text" name="orderNum" id="orderNum" placeholder="주문번호를 입력하세요"><br><br>
          	 <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요"><br><br><br><br><br>
            <input type="submit" name="noMemorderNumview" id="" value="주문/배송조회">
	    </div>
    </form>
    
    <!-- 비회원 주문 페이지 화면 끝 -->
 <!--Script 시작 -->
 <script type="text/javascript">
 	
	$(function() {
		/* 회원 로그인 버튼 클릭시 이벤트 처리 */
		$('.log_menu').click(function() {
			$('.loginContainer').show();
			$('.noUserLogin-Container').hide();
		})
		
		/*비회원 주문조회 클릭시 이벤트 처리 */
		$('.nonLog_menu').click(function() {
			$('.noUserLogin-Container').show();
			$('.loginContainer').hide();
		})
	})
 
 </script>
<%@ include file="/views/common/footer.jsp"%>