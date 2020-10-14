<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/member/memberFindPw.css">
<form class="findPWContainer" action="<%=request.getContextPath() %>/findPwResult.do" method="post"> 
        <h1>비밀번호 찾기</h1>
      	<div class="findPwText">
            	아이디 &nbsp <input type="text" name="findId" id="findId" placeholder="아이디를 입력하세요"><br><br>
            	이메일 &nbsp <input type="text" name="findEmail" id="findEmail" placeholder="이메일을 입력 하세요"><br><br>
            <input style="background: black;color: white;border: none;width: 218px;" type="submit" name="check" id="check" value="확인">
    	</div>
</form>
<%@ include file="/views/common/footer.jsp"%>