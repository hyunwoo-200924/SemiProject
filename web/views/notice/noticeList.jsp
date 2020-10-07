<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.eol.notice.model.vo.Notice" %>

<%
	List<Notice> list=(List)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp"%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cart.css">

    	<section class="notice-section">
        <div class="notice-section-container">
            <h1>고객센터</h1>
            <div class="notice-container-head">
                <span class="text"><a href="#"><h2>FAQ</h2></a></span>
                <span class="text"><a href="#"><h2>공지사항</h2></a></span>
                <span class="text"><a href="#"><h2>새벽배송/이용안내</h2></a></span>
            </div>
        </div>
        <table id="notice-products" style="">
            
            <tbody>
                <tr>
                    <th>번호</th>
                    <th>공지사항</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>
            </tbody>
            <tbody style="display:none;">
            <%if(list.isEmpty()){ %>
            <tr>
            	<td colspan="6">조회된 게시글이 없습니다.</td>
            </tr>
            <%}else{ 
                for(Notice n: list){ %>
                <tr>
                    <td><%=n.getnNumber() %></td>             
                    <td>
                    	<a href="<%=request.getContextPath() %>/notice/noticeView?no=<%=n.getnNumber() %>">
                    	 <%=n.getnTitle() %></a>
                    </td>
                    <td><%=n.getnWriter() %></td>
                    <td><%=n.getnRdate()%></td>
            
                
                <td><%=n.getnHit() %></td>
                </tr>
                <%}
            }%>
          		
            </tbody>
            
        </table>
        <div id="Notice-pageBar">
        	<%=request.getAttribute("pageBar")%>
        </div>
        <div class="btn-group">
        <%if(loginMember!=null){ %>
            <button type="button" name="글쓰기" id="changeUpbtn-write" class="btn" onclick="lacation.assing('<%=request.getContextPath()%>')">글쓰기</button>>
            <%} %>
            <button type="button" name="등록하기" id="updateBtn-write" class="btn">등록 </button>  
            <button type="button" name="수정하기" id="updateBtn-write" class="btn">수정</button>
            </div>

    </section>
    <%@ include file="/views/common/footer.jsp" %>
    