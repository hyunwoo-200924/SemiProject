<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li class="active">1:1문의</li>
                    <li class="mypage_left_title1">나의 정보</li>
                    <li>개인정보변경</li>
                    <li>회원탈퇴</li>
                </ul>
           	</nav>
			<div class="user_content_form_wrap">
				<div class="title">
					<h1>1:1 문의</h1>
				</div>
				<div class="user_request">
					<div class="inline">
						<p class="active">1:1 문의 작성</p>
						<p style="padding-left:20px">1:1 문의 내역</p>
					</div>
					<!-- <div class="question_type">
							
							
						<div class="question_type_box">
							<span class="active">배송</span>
							<span>주문/결제</span>
							<span>취소/반품</span>
							<span>쿡킷메뉴/상품</span>
							<span>회원/포인트</span>
							<span>이벤트</span>
							<span>영수증/증빙</span>
							<span>사이트이용</span>
							<span>기타</span>
						</div>
						<div class="note">
							<ul>
								<li style="font-weight:600;">문의 전 확인해주세요.</li>
								<li>배송 진행 상태는 마이페이지에서 확인하실 수 있습니다. <a style="text-decoration:underline;">주문/배송조회 바로가기</a></li>
							</ul>
						</div>
					</div> -->
					<div class="qeustion_context" style="margin-top: 50px;">
						<div class="question_context_form">
							<div class="question_box col3" style="grid-template-columns: 140px 120px auto;">
								<p>제목</p>
								<select>
									<option value="">문의유형</option>
									<option>12121212</option>
									<option>12121212</option>
									<option>12121212</option>
									<option>12121212</option>
									<option>12121212</option>
									<option>12121212</option>
									<option>12121212</option>
								</select>
								<input  style="margin-left:20px;" type="text">
							</div>
							<div class="question_box col3">
								<p>주문/상품 선택</p>
								<input type="text" placeholder="문의할 주문번호 또는 상품을 선택해주세요.">
								<input type="button" value="조회">
							</div>
							<div class="question_box">
								<p>문의내용</p>
								<textarea name="" id="" cols="30" rows="10" placeholder="문의 내용을 입력해주세요."></textarea>
								<div class="note">
									<ul>
										<li>고객님의 개인정보(이름,핸드폰 번호, 계좌번호 등) 입력 시 관리자에 의해 임의 삭제될 수 있습니다.</li>
										<li> 개인정보 및 환불계좌번호 변경 등 개인정보 관련 문의는 행복고객센터로 연락 부탁 드립니다.</li>
									</ul>
								</div>
							</div>
							<div class="question_box">
								<p>첨부파일</p>
<!-- 								<p class="file">+</p> -->
								<input type="file">
								<p class="file-note">*최대 5장 등록 (PNG, JPEG, JPG, GIF 포맷)</p>
							</div>
							<div class="question_box">
								<p>답변알림</p>
								<div style="display: grid;grid-template-columns: 283px auto;">
									<input type="text" placeholder="문의할 주문번호 또는 상품을 선택해주세요.">
									<p class="check" style="margin-left:10px"><label><input type="checkbox">E-mail 수신</label></p>
								</div>
								<div style="display: grid;grid-template-columns: 283px auto;grid-column-start: 2;    margin-top: 10px;">
									<input type="text" placeholder="문의할 주문번호 또는 상품을 선택해주세요.">
									<p class="check" style="margin-left:10px"><label><input type="checkbox">SMS</label></p>
								</div>
								<div class="note">
									<ul>
										<li>알림수신을 위한 일회성 변경으로 회원 기본정보가 변경되지 않습니다.</li>
									</ul>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		
		
<%@ include file="/views/common/footer.jsp"%>