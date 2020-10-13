<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.eol.member.model.vo.Member" %>
<%

	String checkedMemberId =(String) request.getAttribute("checkedMemberId");

%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css//member/memberFindId.css">
<section>
       <%if(checkedMemberId ==""){ %>
			<section>
             	<div class="findIdText">
                 	<h1>등록되지 않은 회원 입니다.</h1>
                	<input type="submit" value="회원가입" onclick="location.replace('<%=request.getContextPath()%>/memberjoin.do')">
             	</div>
    		</section>
    	<%}else{ %>
        	<div class="findIdText">
    			<h2>등록된 회원 입니다.</h2>
    			<div>회원님의 아이디를 확인해 주세요! </div>
            	아이디 : <input style="border:none;" type="text" id="searchMemberId" value="<%=checkedMemberId%>"><br><br>
            	<input type="button" name="check" id="check" value="로그인화면으로 돌아가기" onclick="location.replace('<%=request.getContextPath()%>/login.do')">
    		</div>
    </form>
    	<%} %>
</section>
<%@ include file="/views/common/footer.jsp"%>