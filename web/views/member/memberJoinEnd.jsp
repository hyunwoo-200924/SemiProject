<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/memberJoinEnd.css">
<section>
        <div class="mainDiv">
           <div id="joinhead" style="border: red 1px solid;">
                <div id="join">'회 원 가 입'</div>
                <div>
                    <table>
                        <tr id="joinMsg">
                            <th id="joinMent">본인인증</th>
                            <th><img src="angle-right-solid.svg" width="20px" height="20px"></th>
                            <th id="joinMent">회원정보 입력</th>
                            <th><img src="angle-right-solid.svg" width="20px" height="20px"></th>
                            <th id="joinMent">가입완료</th>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="content">
                <h2 align="center" style="margin-top:100px">'1,000 포인트가 지급되었습니다.'</h2>
                <div id="button">
                    <button><a href="<%=request.getContextPath() %>/mainview.do">메인화면으로 이동</a></button>
                    <button><a href="<%=request.getContextPath()%>/login.do">로그인하기</a></button>
                </div>
            </div>
        </div>
     </section>
     
<%@ include file="/views/common/footer.jsp"%>