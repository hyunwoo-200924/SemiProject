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
<!-- 로그인 페이지 화면 -->
    <div class="loginContainer">
        <form class="joinLoginContainer" action="<%=request.getContextPath()%>/loginfrm.do" method="post">
            <h1>로그인</h1>
            	아이디 &nbsp <input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요" value='<%=saveId != null?saveId:"" %>'><br><br>
            	비밀번호 &nbsp<input type="password" name="password" id="password"><br><br>
            <input type="checkbox" name="saveId" id="saveId" <%=saveId !=null?"checked":"" %>> 아이디저장
            <a href="#" onclick="location.replace('<%=request.getContextPath()%>/findId.do')">아이디 찾기</a>
            <a href="#" onclick="location.replace('<%=request.getContextPath()%>/findPw.do')">비밀번호 찾기</a><br><br>
            <input type="submit" name="loginBtn" id="loginBtn" value="로그인">
        </form>
        <div class="noUserLoginContainer">
        <form class="noUserLoginContainer" action="<%=request.getContextPath()%>/noMemorderNumview.do" method="post">
            <h1>비회원 주문조회</h1>
           	 주문번호 &nbsp <input type="text" name="orderNum" id="orderNum" placeholder="주문번호를 입력하세요"><br><br>
          	 비밀번호 &nbsp <input type="password" name="pw" id="pw"><br><br><br><br><br>
            <input type="submit" name="noMemorderNumview" id="" value="주문/배송조회">
          </form>
        </div>
    </div>
    <div class="loginImgContainer">
        <div class="loginImgContainerText">
      		<!--    카카오 아이콘<img src="#" alt="" aria-valuemax="">
        	아이콘<img src="#" alt="" aria-valuemax="">
        	아이콘<img src="#" alt="" aria-valuemax=""><br><br>-->
        <input type="submit" name="joinBtn" id="joinBtn" value="회원가입" onclick="location.replace('<%=request.getContextPath()%>/memberEnllor.do')">
        </div>
    </div>
<%@ include file="/views/common/footer.jsp"%>