<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css//member/memberFindId.css">
<section>
	<form class="findIdContainer" action="<%=request.getContextPath() %>/findidEnd.do" method="post"> 
        <h1>아이디 찾기</h1>
        <div class="findIdText">
            	이름 &nbsp <input type="text" name="findName" id="findName"><br><br>
            	이메일 &nbsp <input type="text" name="findEmail" id="findEmail"><br><br>
            	<input type="submit" name="check" id="check" value="확인">
    	</div>
    </form>
</section>
<%@ include file="/views/common/footer.jsp"%>