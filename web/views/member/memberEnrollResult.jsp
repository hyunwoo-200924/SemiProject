<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.eol.member.model.vo.Member" %>
<%

	String checkedMemberId =(String) request.getAttribute("checkedMemberId");

%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css//member/memberEnrollCheckedResult.css">
<section>
       <%if(checkedMemberId ==""){ %>
           	<div class="findIdText">
               	<h1 style="font-size: 39px;margin: 50px;">등록되지 않은 회원 입니다.</h1>
               	<div class="context-Box">
               		<br><br>
               		회원가입을 하시면 뚝딱쿡의 다양한 혜택을 받으실 수 있습니다.<br><br>
               		아래의 회원 가입 버튼을 누르신후 가입 하세요!
               	</div>
           		<input class="backlogBtn" type="submit" value="회원가입" onclick="location.replace('<%=request.getContextPath()%>/memberjoin.do')">
  			</div>
    	<%}else{ %>
        	<div class="findIdText">
    			<h1>등록된 회원 입니다.</h1>
    			<h3 style="margin: 20px;margin-left: 65px;">회원님의 아이디를 확인해 주세요! </h3>
            	<h3>아이디 : <input style="border:none; margin-left: 17px;" type="text" id="searchMemberId" value="<%=checkedMemberId%>"></h3><br><br>
            	<input class="backlogBtn" type="button" name="check" id="check" value="로그인화면으로 돌아가기" onclick="location.replace('<%=request.getContextPath()%>/login.do')">
    		</div>
    </form>
    	<%} %>
</section>
<%@ include file="/views/common/footer.jsp"%>