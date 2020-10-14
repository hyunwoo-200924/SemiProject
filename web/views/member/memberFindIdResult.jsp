<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.eol.member.model.vo.Member" %>
<%

	String searchMemberId =(String) request.getAttribute("searchMemberId");

%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css//member/memberFindId.css">
<section>
       <%if(searchMemberId == null){ %>
			<section>
             	<div class="findIdText">
                 	<h1 style="font-size: 39px; margin: 150px;">아이디 찾기</h1>
                	<div style="height: 99px; font-size: 27px;">고객님께서 입력하신 정보가 정확한지<br> 확인 후 다시 시도해 주세요 </div>
                	<input style="background: black;color: white; border: none; width: 276px;" type="submit" value="아이디 다시 찾기" onclick="location.replace('<%=request.getContextPath()%>/views/member/memberFindId.jsp')">
             	</div>
    		</section>
    	<%}else{ %>
        	<div class="findIdText">
    			<h1 style="font-size: 39px; margin: 150px;">아이디 찾기</h1>
    			<h3 style="height: 99px; font-size: 27px; margin-right: -66px;">고객님의 아이디 찾기가 완료 되었습니다.</h3>
            	<h3 style="margin-left: -77px; margin-top: 24px; font-size: 27px;">아이디 : <input style="border:none;" type="text" id="searchMemberId" value="<%=searchMemberId%>"></h3><br><br>
            	<input  style="background: black;color: white; border: none; width: 276px;" type="button" name="check" id="check" value="로그인화면으로 돌아가기" onclick="location.replace('<%=request.getContextPath()%>/login.do')">
    		</div>
    </form>
    	<%} %>
</section>
<%@ include file="/views/common/footer.jsp"%>