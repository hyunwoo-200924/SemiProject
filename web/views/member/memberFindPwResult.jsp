<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/member/memberFindPw.css">
<form class="findPWContainer" action="<%=request.getContextPath() %>/login.do" method="post"> 
        <h1>임시 비밀번호가 메일로 발송 되었습니다.<br>확인 부탁 드립니다.</h1>
      	<div class="findPwText">
            <input type="submit" name="check" id="check" value="로그인페이지로 돌아가기">
    	</div>
</form>
<%@ include file="/views/common/footer.jsp"%>