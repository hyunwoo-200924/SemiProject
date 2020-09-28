<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/member/memberEnrollCheckedView.css">
<section>
        <div class="joinText"> 
            <p>'회원관리 여부 확인'</p>
        </div>
        <div class="join1">
            	이름 <input type="text" name="joinNmae" id="joinName"><br><br>
            	생년월일 <input type="text" name="joinBirth" id="joinBirth"><br><br>
            	전화번호 <input type="text" name="joinPhone" id="joinPhone"><br><br>
            <input type="submit" name="ckJoin" id="ckJoin" value="가입여부 확인" onclick="location.replace('<%=request.getContextPath()%>/MemberEnrollCheck1.do')">
        </div>
</section>
<%@ include file="/views/common/footer.jsp"%>