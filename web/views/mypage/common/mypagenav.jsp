<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/hayong.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<style>


</style>
<nav class="mypage_left">
	<h2>마이페이지</h2>
	<ul>
		<li class="mypage_left_title1">나의 주문정보</li>
		<li onclick="location.href='<%=request.getContextPath() %>/orderViewList.do'">주문/배송조회</li>
		<li onclick="location.href='<%=request.getContextPath() %>/orderCancelReturnViewList.do'">취소/반품조회</li>
		<li>선물내역</li>
		<li class="mypage_left_title1">나의혜택</li>
		<li onclick="location.href='<%=request.getContextPath() %>/couponList'">쿠폰</li>
		<li onclick="location.href='<%=request.getContextPath() %>/pointPageView.do'">포인트</li>
		<li class="mypage_left_title1">나의활동</li>
		<li onclick="location.href='<%=request.getContextPath() %>/review/reviewList'">리뷰</li>
		<li onclick="">맛취향</li>
		<li onclick="location.href='<%=request.getContextPath() %>/wishListView'">쇼핑찜</li>
		<li onclick="location.href='<%=request.getContextPath() %>/questionList'">1:1문의</li>
		<li class="mypage_left_title1">나의 정보</li>
		<li onclick="location.href='<%=request.getContextPath() %>/memberUpdatePwViewCheck'">개인정보변경</li>
		<li onclick="location.href='<%=request.getContextPath() %>/MemberDeleteView'">회원탈퇴</li>
	</ul>
</nav>