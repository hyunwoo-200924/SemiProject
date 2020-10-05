<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.eol.member.model.vo.Member" %>

<%
	Member m = (Member)request.getSession().getAttribute("loginMember");
	String genderCk = (String)m.getmGender();
	String[] gender = new String[3];
	if(genderCk != null){
		switch(genderCk){
			case "M": gender[0] = "checked"; break;
			case "F": gender[1] = "checked"; break;
			case "N": gender[2] = "checked"; break;
		}
	}
%>

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
				<form id="memberFrm" action="<%= request.getContextPath() %>/MemberUpdate" method="post">
					<div class="user_update_form">
						<div class="form_box">
							<p>아이디</p>
							<input type="text" name="id" value=<%= m.getmId() %> disabled>
						</div>
						<!-- <div class="form_box">
							<p>현재 비밀번호</p>
							<input type="password" name="pw" id="pw">
						</div> -->
						<div class="form_box">
							<p>새 비밀번호</p>
							<input type="password" id="new_pw" name="new_pw">
							<div id="pwMsg" style="display:none;  grid-column-start: 2;">
								<span id="pw0" style="display: block;color:red;">현재 비밀번호와 다르게 입력</span>
								<span id="pw1" style="display: block;color:red;">최소 10자 이상 입력</span>
								<span id="pw2" style="display: block;color:red;">영문/숫자/특수문자(공백제외)만 허용하며, 2개 이상 조합</span>
							</div>
						</div>
						<div class="form_box">
							<p>새 비밀번호 확인</p>
							<input type="password" id="pwck">
							<div id="pwCkMsg" style="display:none;  grid-column-start: 2;">
								<span id="pw3" style="display: block;color:red;">동일한 비밀번호를 입력해주세요.</span>
							</div>
						</div>
						<div class="form_box">
							<p>이름</p>
							<input type="text" value="<%= m.getmName() %>">
						</div>
						<div class="form_box col3">
							<p>이메일</p>
							<input type="text" value="<%= m.getmEmail() %>">
							<input type="button" value="중복확인">
						</div>
						<div class="form_box">
							<p>휴대폰</p>
							<input type="text" value="<%= m.getmPhone() %>">
						</div>
						<div class="form_box">
							<p>성별</p>
							<div class="form_radio">
								<label>
									<input type="radio" name="gender" value="M" <%= gender[0] %>>남자
								</label>
								<label>
									<input type="radio" name="gender" value="F" <%= gender[1] %>>여자
								</label>
								<label>
									<input type="radio" name="gender" value="N" <%= gender[2] %>>선택안함
								</label>
							</div>
						</div>
						<div class="form_box">
							<p>생년월일</p>
							<input type="date" id="birth" name="birth" value="<%= m.getmBirth() %>">
						</div>
						<div class="form_box">
							<p>선택약관동의</p>
							<label>
							<input type="checkbox" value="Y">개인정보방침 동의<span class="choice">(선택)</span>
							</label>
						</div>
						<div class="form_box">
							<p>이용약관동의</p>
							<label>
							<input type="checkbox" value="Y">개인정보방침 동의<span class="choice">(선택)</span>
							</label>
						</div>
						
						<div class="button col2">
							<input type="button" value="탈퇴하기">
							<input type="button" onclick="fn_updateMember();" value="회원정보 수정">
						</div>
					</div>
				</form>
			</div>
		</section>
		
		<script>
		let pwMsg = false;
		let pwMsg2 = false;
		let pwCkMsg = false;
		$(function(){
			//새비밀번호 조건 체크
			$("#new_pw").click(function(){
				$("#pwMsg").css('display', 'block');
			})
			$("#new_pw").focus(function(){
				$("#pwMsg").css('display', 'block');
			})
			$("#new_pw").keyup(function(){
				var pw = $('#new_pw').val().trim();
				var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(pw);//영문,숫자 조합(10~20)
				var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(pw);//영문,특수문자 조합(10~20)
				var check3 = /^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(pw);//숫자,특수문자 조합(10~20)
				if(pw.length > 9){
					$('#pw1').css("color", "green");
					pwMsg1 = true;
				} else {
					$('#pw1').css("color", "red");
					pwMsg1 = false;
				}
				if(check1 || check2 || check3) {
					$('#pw2').css("color", "green");
					pwMsg1 = true;
				} else {
					$('#pw2').css("color", "red");
					pwMsg1 = false;
				}
				$.ajax({
					url: "<%= request.getContextPath() %>/MemberUpdatePwCkAjax",
					type: "post",
					success: function(data){
						if($("#new_pw").val().trim() != data && $("#new_pw").val().trim() != ""){
							$('#pw0').css("color", "green");
							pwMsg2 = true;
						} else {
							$('#pw0').css("color", "red");
							pwMsg2 = false;
						}
					}
				})
			})
			
			//새비밀번호 확인 조건체크
			$(function(){
				$("#pwck").click(function(){
					$("#pwCkMsg").css('display', 'block');
				})
				$("#pwck").focus(function(){
					$("#pwCkMsg").css('display', 'block');
				})
				$("#pwck").keyup(function(){
					if($("#pwck").val().trim() == $('#new_pw').val().trim()){
						$('#pw3').css("color", "green");
						pwCkMsg = true;
					}else{
						$('#pw3').css("color", "red");
						pwCkMsg = false;
					}
				})
			})
		})
		
		
			function fn_updateMember(){
				if()
				if(!pwMsg1 || !pwMsg2){
					alert('비밀번호를 조건에 맞게 입력해 주세요.')
					return;
				}
				if(!pwCkMsg){
					alert('동일한 비밀번호를 입력해 주세요.')
					return;
				}
				<%-- $("memberFrm").attr("action","<%=request.getContextPath()%>/updateMember").submit(); --%>
			}
			
			
		</script>
		
<%@ include file="/views/common/footer.jsp"%>