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
						<p style="padding-right:20px">1:1 문의 작성</p>
						<p class="active">1:1 문의 내역</p>
					</div>
					<div class="`_no" style="display:none">
						<figure>!</figure>
						<p>등록된 내역이 없습니다.</p>
					</div>
					<div class="user_request_list">
						<div class="list_form">
							<div><span>답변대기</span><span>asdsadasdsadas</span><span class="list">2020-09-20</span></div>
                     		<div style="display:none"><button>삭제</button></div>
						</div>
						<div class="list_form">
							<div><span>답변대기</span><span>asdsadasdsadas</span><span class="list">2020-09-20</span></div>
                     		<div style="display:none"><button>삭제</button></div>
						</div>
						<div class="list_form">
							<div><span>답변대기</span><span>asdsadasdsadas</span><span class="list">2020-09-20</span></div>
                     		<div style="display:none"><button>삭제</button></div>
						</div>
					</div>
					<div class="inline bottom">
						<p>답변이 부족하거나 추가 문의사항이 있으시면 등록해주세요.</p>
						<a href=""><span class="linkArrow">추가 1:1 문의 작성</span></a>
					</div>
				</div>
			</div>
		</section>
		<script>
		$(function(){
			   /* $('.list').click(function() {
			      $('.list').not($(this)).parents('.list_form').find('div:eq(1)').slideUp('fast');
			      $(this).parents('.list_form').find('div:eq(1)').slideToggle('fast');
			   }) */
			   $('.list').click(function() {
				   $(".list").not($(this)).parent().next().slideUp('fast');
			      $(this).parent().next().slideToggle('fast');
			   })
			})
		</script>
		
		
<%@ include file="/views/common/footer.jsp"%>