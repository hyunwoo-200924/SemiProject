<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.eol.member.model.vo.Member"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/main.css">

<%
Member loginMember3 = (Member)request.getSession().getAttribute("loginMember");
%>
		<footer>
            <div id="footer">
                <div id="footerlogo">
                    <a href="<%=request.getContextPath() %>/mainview.do"><img src="<%=request.getContextPath() %>/images/mainImages/logo.png" alt="" width="150" height="45"></a>
                </div>
                <div id="footercenter">
                    <div id="footer1">
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/term.do">이용약관</a></li>
                            <li><a href="<%=request.getContextPath()%>/protect.do">개인정보처리방침</a></li>
                            <li><a href="<%=request.getContextPath()%>/legal.do">정책</a></li>
                            <li><a href="">사업자정보확인</a></li>
                        </ul>
                    </div>
                    <div id="footer2">
                        <p>회사명 : 얼(EOL) &nbsp; 대표이사명 : 이윤나 &nbsp; 사업자등록번호 : 20200608</p>
                        <p>회사 주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 4F &nbsp; 이메일 : eoleol@eol.com</p>
                        <p>Copyright © 1998-2020 EOL Food Meal Kit Ddukddakcook Institute All Right Reserved</p>
                    </div>
                </div>
                <div id="footer3">
                    <h3>고객센터 1111-2222</h3>
                    <%if(loginMember3 != null){ %>
                    <button onclick="location.href='<%= request.getContextPath() %>/questionWriteView'">1:1문의</button>
                    <%} else {%>
                    <button onclick="location.href='<%= request.getContextPath() %>/login.do'">1:1문의</button>
                    <%} %>
                </div>
            </div>
        </footer>
	</div>
</body>
</html>