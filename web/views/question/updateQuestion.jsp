<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Member m = (Member)request.getSession().getAttribute("loginMember");
%>
    

<%@ include file="/views/common/header.jsp"%>

		<style>
			#inquiry{
				display: none;
				grid-column: 2/4;
	   			border: 1px solid black;
	    		height: 300px;
			}
			#inquiry .inquiry_form{
				display: grid;
    			grid-template-columns: 70px 120px 156px 50px 122px auto;
    			align-items: center;
			}
			#inquiry .inquiry_form input{
				margin: auto;
			}
			#inquiry .none{
			    text-align: center;
    			padding-top: 50px;
			}
			#inquiry .inquiry_form span{
   				text-align: center;
			}
			
		</style>
	
		<section class="container">
			<%@ include file="/views/mypage/common/mypagenav.jsp" %>
			<!-- <nav class="mypage_left">
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
           	</nav> -->
			<div class="user_content_form_wrap">
				<div class="title">
					<h1>1:1 문의</h1>
				</div>
				<div class="user_request">
					<div class="inline">
						<p class="active">1:1 문의 작성</p>
						<p style="padding-left:20px;" onclick="fu_questionList();">1:1 문의 내역</p>
					</div>
					<div class="qeustion_context" style="margin-top: 50px;">
						<form method="post" action="<%= request.getContextPath() %>/questionWrite.do" enctype="multipart/form-data" onsubmit="return fn_submit();">
							<div class="question_context_form">
								<div class="question_box col3" style="grid-template-columns: 140px 120px auto;">
									<p>제목</p>
									<select name="category">
										<option value="">선택해주세요.</option>
										<option value="배송">배송</option>
										<option value="주문/결제">주문/결제</option>
										<option value="취소/반품">취소/반품</option>
										<option value="상품">상품</option>
										<option value="회원/포인트">회원/포인트</option>
										<option value="이벤트">이벤트</option>
										<option value="기타">기타</option>
									</select>
									<input style="margin-left:20px;" type="text" name="title">
								</div>
								<div class="question_box col3">
									<p>주문/상품 선택</p>
									<input type="text" id="o_no" name="o_no" readonly >
									<input type="button" value="조회" onclick="fn_inquiry();">
									<div id="inquiry">
										<div class="inquiry_form">
											<span>주문번호</span>
											<span>주문일자</span>
											<span>상품명</span>
											<span>수량</span>
											<span>주문금액</span>
											<span>선택</span>
										</div>
									</div>
								</div>
								<div class="question_box">
									<p>문의내용</p>
									<textarea name="content" cols="30" rows="10" style="resize: none;" placeholder="문의 내용을 입력해주세요."></textarea>
									<div class="note">
										<ul>
											<li>고객님의 개인정보(이름,핸드폰 번호, 계좌번호 등) 입력 시 관리자에 의해 임의 삭제될 수 있습니다.</li>
											<li> 개인정보 및 환불계좌번호 변경 등 개인정보 관련 문의는 행복고객센터로 연락 부탁 드립니다.</li>
										</ul>
									</div>
								</div>
								<div class="question_box">
									<p>첨부파일</p>
								<!--<p class="file">+</p> -->
									<input type="file" name="file" multiple>
									<p class="file-note">*최대 5장 등록 (PNG, JPEG, JPG, GIF 포맷)</p>
								</div>
								<div class="question_box">
									<p>답변알림</p>
									<div style="display: grid;grid-template-columns: 283px auto;">
										<input type="text" name="answer" <%-- value="<%= m.getmEmail() %>" --%>>
										<p class="check" style="margin-left:10px">
											<label>
												<input type="checkbox" name="emailAnswer">답변수신을 이메일로 받겠습니다.
											</label>
										</p>
									</div>
									<%-- <div style="display: grid;grid-template-columns: 283px auto;grid-column-start: 2;    margin-top: 10px;">
										<input type="text" name="phoneSend" value="<%= m.getmPhone() %>">
										<p class="check" style="margin-left:10px"><label><input type="checkbox">답변수신을 문자메세지로 받겠습니다.</label></p>
									</div> --%>
									<div class="note">
										<ul>
											<li>알림수신을 위한 일회성 변경으로 회원 기본정보가 변경되지 않습니다.</li>
										</ul>
									</div>
								</div>
							</div>
							<input type="submit" value="저장">
						</form>
					</div>
				</div>
			</div>
		</section>
		
		<script>
			$(function(){
				$.ajax({
					url: "<%= request.getContextPath() %>/OrderList",
					type: "post",
					dataType:"json",
					success: function(data){
						console.log(data);
						if(data.length == 0) {
							$(".inquiry_form").after($("<div>").addClass('none').append($('<span>없음</span>')));
							
						} else {
								//let div = $(".inquiry_form").after($("<div>").addClass('inquiry_form')
							let div =$(".inquiry_form");
							for(let i = 0; i < data.length; i++){
								
								let o_no = $('<span></span>').text(data[i]["oNo"]);
								let or_date = $('<span></span>').text(data[i]["oRDate"]);
								let or_content = $('<span></span>').text(data[i]["orderContent"]);
								let o_amount = $('<span></span>').text(data[i]["oAmount"]);
								let o_payment = $('<span></span>').text(data[i]["oPayment"]);
								let choice = $("<input type='radio' ></input>").addClass('choice').attr('name','category');
								
								let result = div.after($("<div>").addClass('inquiry_form').append(o_no, or_date, or_content, o_amount, o_payment, choice));
							}
						}
					}
				})
				
			})
		
			
		 	function fn_inquiry(){
				$("#inquiry").slideToggle("slow");
				$('.choice').click(function(){
					let c = $(this).parent().children().eq(0).text();
					$("#o_no").val(c);
					$("#inquiry").css('display','none');
				})
			}
			
		 	function fn_submit(){
		 		if($('input:checkbox[name="emailAnswer"]').is(':checked') == false) {
		 			$('input[name="answer"]').val("");
		 		}
		 	}
		 	
			function fu_questionList(){
				location.href="<%= request.getContextPath()%>/questionList"
			}
			
		</script>
		
		
<%@ include file="/views/common/footer.jsp"%>