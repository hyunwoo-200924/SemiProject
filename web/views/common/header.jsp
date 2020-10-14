<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,
com.eol.product.model.vo.Product,
com.eol.member.model.vo.Member, java.util.ArrayList" %>

<%
	if(request.getSession().getAttribute("nonCartList") == null) {
		List nonCartList = new ArrayList();
		request.getSession().setAttribute("nonCartList", nonCartList);
	}
	//로그인 된 상태이면 loginMember에 값이 있다.
	//로그인 안된 상태이면 loginMEmber가 null값이 된다.
	Member loginMember = (Member)request.getSession().getAttribute("loginMember");
	
// 	Member m = new Member("lhy92312a");
// 	request.getSession().setAttribute("loginMember", m);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SemiProject</title>
<!-- header, footer style -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/hayong.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div id="container">
        <header>
        <% if(loginMember == null){ %>
            <!-- 검은top -->
            <div id="blacktop">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/memberEnrollCheckedView.do">회원가입</a></li>
                    <li><a href="<%=request.getContextPath()%>/login.do">로그인</a></li>
                    <li style="padding: 0px 20px 0px 0px;"><a href="#" >고객센터</a></li>
                </ul>
            </div>
            <%}else{ %>
             <!-- 검은top -->
            <div id="blacktop">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/mypageMain.do"><%=loginMember.getmName() %>님</a></li>
                    <li><a href="<%=request.getContextPath()%>/logOut.do">로그아웃</a></li>
                    <li style="padding: 0px 20px 0px 0px;"><a href="#" >고객센터</a></li>
                </ul>
            </div>
            	
            <%} %>
            <!-- 메인메뉴 -->
            <nav id="menu">
                <a href="<%=request.getContextPath() %>/mainview.do"><img id="headerlogo" src="<%=request.getContextPath()%>/images/mainImages/logo.png" alt="" width="150px" height="45px" style="margin: 20px 0;" herf=""></a><!--로고-->

				<div>
                <%if(loginMember != null && loginMember.getmId().equals("admin")){ %>

	                <ul>
	                    <li><a href="<%=request.getContextPath()%>/product/productList">상품관리</a></li>
	                    <li><a href="<%=request.getContextPath()%>">회원관리</a></li>
	                    <li><a href="<%=request.getContextPath()%>/adminQuestionList">게시판관리</a></li>
	                    <li><a href="<%=request.getContextPath()%>">쿠폰관리</a></li>
	                </ul>
                <%}else{ %>
	                <ul>
	                    <li><a href="<%=request.getContextPath()%>/companyView.do">회사소개</a></li>
	                    <li><a href="<%=request.getContextPath()%>/product/productList">메뉴</a></li>
	                    <li><a href="<%=request.getContextPath()%>/event.do">이벤트</a></li>
	                    <li><a href="<%=request.getContextPath()%>/mypageMain.do">마이페이지</a></li>
	                </ul>
                <a href="<%=request.getContextPath()%>/views/cart/hearderCartViewServlet"><img id="headerB" src="<%=request.getContextPath() %>/images/mainImages/shopping-cart-solid.svg" alt="" width="30px" height="30px"></a><!-- 장바구니 -->
                <%} %>
                </div>
            </nav>
        </header>
