<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.eol.notice.model.vo.Notice" %>
<link rel="stylessheet" type="text/css" href="/css/cart.css">

<%
	Notice n=(Notice)request.getAttribute("notice");
	
%>

<script>
	function fun_move_list(){
		location.replace("<%=request.getContextPath()%>/notice/noticeList");
	}
</script>

<%@ include file="/views/common/header.jsp"%>
<section id="notice-container">
	<h2>공지사항 상세화면</h2>
        <table id="tbl-notice">
                <th>글번호</th>
            <td><%=n.getnNumber() %></td>
        </tr>
        <tr>
            <th>제 목</th>
            <td><%=n.getnTitle() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=n.getnWriter()%></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td><%=n.getnHit()%></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
           		<%if(n.getFilePath()!=null){ %>
	           		<a href="<%=request.getContextPath()%>/notice/noticeFileDownload?fileName=<%=n.getFilePath()%>">
	           			<img src="<%=request.getContextPath()%>/images/file.png"
	           			width="20" height="20">
	           		</a>
           		<%} %>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><%=n.getnContent() %></td>
        </tr>
       <!--  관리자인경우 수정삭제가능 -->
       <%if(loginMember!=null&&(loginMember.getmId().equals("admin")||loginMember.getmId().equals(n.getnWriter()))) {%>
        <tr>
            <th colspan="2">
                <button type="button" value="등록하기" onclick="fn_move_list();">등록</button>
                <button type="button" value="삭제하기" onclick="" >수정</button>
                <button type="button" value="수정하기" onclick="">삭제</button>
            </th>
        </tr>
        <%} %>
    </table>
<%--     <div id="comment-container">
    	<div class="comment-editor">
    		<form action="<%=request.getContextPath()%>/notice/noticeCommentWrite" method="post">
    			<input type="hidden" name="nCoommentLevel" value="1">
    			<input type="hidden" name="nCommentWriter" value="<%=loginMember!=null?loginMember.getUserId():"" %>">
    			<input type="hidden" name="nRef" value="<%n.getnNumber()%>">
    			<input type="hidden" name="nCommentRef" value="0">
    			<textarea name="boardCommentContent" cols="55" rows="3"></textarea> 
       			<input type="submit" id="btn-insert" value="등록">
       		</form>
    	</div>
    
    </div> --%>
  </section>
  <%@ include file="/views/common/footer.jsp" %>
        
     
