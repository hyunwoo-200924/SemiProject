<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ include file="/views/common/header.jsp"%>

		<section class="container">
			<nav class="mypage_left">
           		<h2>마이페이지</h2>
                <ul>
                    <li class="mypage_left_title1">나의 주문정보</li>
                    <li>주문/배송조회</li>
                    <li>취소/반품조회</li>
                    <li>선물내역</li> 	
                    <li class="mypage_left_title1">나의혜택</li>
                    <li>쿠폰</li>
                    <li>포인트</li>
                    <li class="mypage_left_title1">나의활동</li>
                    <li>리뷰</li>
                    <li>맛취향</li>
                    <li>쇼핑찜</li>
                    <li>1:1문의</li>
                    <li class="mypage_left_title1">나의 정보</li>
                    <li class="active">개인정보변경</li>
                    <li>회원탈퇴</li>
                </ul>
           	</nav>
			<div class="user_content_form_wrap">
				<div class="title">
					<h1>회원 정보 수정</h1>
				</div>
				<div class="user_update_choice">
					<input type="button" value="기본 정보 변경" onclick="location.replace('<%= request.getContextPath() %>/memberUpdatePwViewCheck')">
					<input type="button" value="배송지 관리">
				</div>
			</div>
		</section>
		
<%@ include file="/views/common/footer.jsp"%>