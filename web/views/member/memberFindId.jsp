<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css//member/memberFindId.css">
<form class="findIdContainer" action="<%=request.getContextPath() %>/findidEnd.do" method="post"> 
    <h1>아이디 찾기</h1>
    <div class="findIdText">
      	<h2>이름 &nbsp <input type="text" name="findName" id="findName" placeholder="이름을 입력하세요"></h2><br><br>
      	<h2 style="margin-left: 14px;">이메일 &nbsp<input type="text" name="findEmail" id="findEmail" placeholder="이메일을 입력 하세요"></h2><br><br>
      	<input class ="bTn"type="submit" name="check" id="check" value="확인">
	</div>
</form>
<%@ include file="/views/common/footer.jsp"%>