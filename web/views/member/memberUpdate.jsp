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

<style>
.filsu2 p:after{
	content:'*';
	color: #ee6a7b;	
}
</style>

<%@ include file="/views/common/header.jsp"%>

		<section class="container">
			<%@ include file="/views/mypage/common/mypagenav.jsp" %>
			<div class="user_content_form_wrap">
				<div class="title">
					<h1>회원 정보 수정</h1>
				</div>
				<form id="memberFrm" action="<%= request.getContextPath() %>/MemberUpdate" method="post">
					<div class="user_update_form">
						<div class="form_box">
							<p>아이디</p>
							<input type="text" name="id" value=<%= m.getmId() %> readonly>
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
							<input type="text" name="name" value="<%= m.getmName() %>">
						</div>
						<div class="form_box">
							<p>이메일</p>
							<input type="text" name="email" value="<%= m.getmEmail() %>" readonly>
						</div>
						<div class="form_box">
							<p>휴대폰</p>
							<input type="text" name="phone" value="<%= m.getmPhone() %>">
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
						<div class="form_box filsu2">
							<p>이용약관동의</p>
							<label>
							<input type="checkbox" id="useAgree" value="Y">이용약관 동의<span class="choice">(필수)</span>
							</label>
						</div>
						<div class="form_box" style="padding-bottom: 20px;">
							<p>선택약관동의</p>
							<label>
							<input type="checkbox" id="choiceAgree" value="Y">선택약관 동의<span class="choice">(선택)</span>
							</label>
						</div>
						
						<div class="button col2">
							<input type="button" value="탈퇴하기" onclick="fn_delete();">
							<input type="submit" onclick="return fn_updateMember();" value="회원정보 수정">
						</div>
					</div>
				</form>
			</div>
		</section>
		
		<script>
		function fn_delete(){
			location.href = '<%= request.getContextPath()%>/MemberDeleteView';
		}
		
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
					if($("#pwck").val().trim() != "" && $("#pwck").val().trim() == $('#new_pw').val().trim()){
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
			let new_pw = $("#new_pw").val().trim();
			if(new_pw != ""){
				if(!pwMsg1 || !pwMsg2){
					alert('비밀번호를 조건에 맞게 입력해 주세요.')
					$("#new_pw").focus();
					return false;
				}
				if(!pwCkMsg){
					alert('동일한 비밀번호를 입력해 주세요.')
					return false;
				}
				if($("#useAgree").is(':checked') == false){
					alert('이용약관 동의 체크를 해주세요.');
					return false;
				}
				
			}
			$("memberFrm").attr("action","<%=request.getContextPath()%>/updateMember").submit();
		} 
			
		</script>
		
<%@ include file="/views/common/footer.jsp"%>