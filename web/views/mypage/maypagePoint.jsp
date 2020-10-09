<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.eol.member.model.vo.Point" %>
<%
	Point p = (Point)request.getAttribute("selectPoint");
%>
<section>
<%@ include file="/views/mypage/common/mypagenav.jsp" %>
<form action="#" style="display: block; width: 100%; height:300px; ">
        <section>
         <h2>포인트</h2>
         <div class="userPoint" style="border: 1px red solid;">
             <p> 사용 가능 포인트</p><br>
             <p><%=p.getpGet() %>-<%=p.getpUse() %></p>
         </div>
        </section>
        <section>
            <div class="get_use_Point">
                <h2>적립/사용내역</h2>
                <hr>
            </div>
        </section>
        <section>
                <table id="tbl-board">
                    <tr>
                        <th>번호</th>
                        <td>테이블 번호</td>
                    </tr>
                    <tr>
                        <th>제 목</th>
                        <td>ㅂ</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>2</td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td>3</td>
                    </tr>
                    <tr>
                        <th>내 용</th>
                        <td>ㄴ</td>
                    </tr>
        </section>
     </form>
</section>
<%@ include file="/views/common/footer.jsp"%>