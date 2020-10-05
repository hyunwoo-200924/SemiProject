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
       <%if(searchMemberId == ""){ %>
			<section>
             	<div class="findIdText">
                 	<h1>아이디 찾기</h1>
                	<div>고객님께서 입력하신 정보가 정확한지<br> 확인 후 다시 시도해 주세요 </div>
                	<input type="submit" value="아이디 다시 찾기" onclick="location.replace('<%=request.getContextPath()%>/views/member/memberFindId.jsp')">
             	</div>
    		</section>
    	<%}else{ %>
        	<div class="findIdText">
    			<h2>아이디 찾기</h2>
    			<div>고객님의 아이디 찾기가 완료 되었습니다.! </div>
            	아이디 : <input style="border:none;" type="text" id="searchMemberId" value="<%=searchMemberId%>"><br><br>
            	<input type="button" name="check" id="check" value="로그인화면으로 돌아가기" onclick="location.replace('<%=request.getContextPath()%>/login.do')">
    		</div>
    </form>
    	<%} %>
</section>
<%@ include file="/views/common/footer.jsp"%>