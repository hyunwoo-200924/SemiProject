<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/hayong.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<nav class="mypage_left">
	<h2>마이페이지</h2>
	<ul>
		<li class="mypage_left_title1">나의 주문정보</li>
		<li><a href="<%=request.getContextPath() %>/orderViewList.do">주문/배송조회</a></li>
		<li><a href="<%=request.getContextPath() %>/orderCancelReturnViewList.do">취소/반품조회</a></li>
		<li>선물내역</li>
		<li class="mypage_left_title1">나의혜택</li>
		<li>쿠폰</li>
		<li><a href="<%=request.getContextPath() %>/pointPage.do">포인트</a></li>
		<li class="mypage_left_title1">나의활동</li>
		<li><a href="<%=request.getContextPath() %>/review/reviewlist">리뷰</a></li>
		<li>맛취향</li>
		<li>쇼핑찜</li>
		<li>1:1문의</li>
		<li class="mypage_left_title1">나의 정보</li>
		<li>개인정보변경</li>
		<li>회원탈퇴</li>
	</ul>
</nav>