<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.searchImg {
    display: block;
    overflow: hidden;
    width: 340px;
    height: 30px;
    border: 1px solid #5f0080;
    border-radius: 3px;
    text-align: center;
    line-height: 30px;
}
</style>

		<section class="container2">
			<div class="user_content_form_wrap">
				<div class="title">
					<h1 style="text-align:center">회원가입</h1>
				</div>
				<form id="memberFrm" method="post" action="<%=request.getContextPath()%>/memberEnroll.do">
					<div class="user_update_form">
						<div class="form_box col3">
							<p>아이디</p>
							<input type="text" name="id" id="id" maxlength="20" autocomplete="off" required>
							<input type="button" value="중복확인" onclick="idCk();">
							<div id="idCkMSg" style="display:none;  grid-column-start: 2;">
								<span id="id1" style="display: block;color:black;">6자 이상의 영문과 숫자를 조합</span>
								<span id="id2" style="display: block;color:black;">아이디 중복확인</span>
							</div>
						</div>
						<div class="form_box">
							<p>비밀번호</p>
							<input type="password" name="pw" id="pw" maxlength="20" required>
							<div id="pwMsg" style="display:none;  grid-column-start: 2;">
								<span id="pw1" style="display: block;color:red;">최소 10자 이상 입력</span>
								<span id="pw2" style="display: block;color:red;">영문/숫자/특수문자(공백제외)만 허용하며, 2개 이상 조합</span>
							</div>
						</div>
						<div class="form_box">
							<p>비밀번호 확인</p>
							<input type="password" id="pwck" maxlength="20" required>
							<div id="pwCkMsg" style="display:none;  grid-column-start: 2;">
								<span id="pw3" style="display: block;color:red;">동일한 비밀번호를 입력해주세요.</span>
							</div>
						</div>
						<div class="form_box">
							<p>이름</p>
							<input type="text" id="name" name="name" autocomplete="off" required>
						</div>
						<div class="form_box col3">
							<p>이메일</p>
							<input type="email"  id="email" name="email" autocomplete="off" required>
							<input type="button" value="중복확인" onclick="emailCk();" >
							<div id="emailCkMsg" style="display:none;  grid-column-start: 2;">
								<span id="email1" style="display: block;color:red;">이메일 중복확인</span>
							</div>
						</div>
						<div class="form_box">
							<p>휴대폰</p>
							<input type="text" id="phone" name="phone" autocomplete="off" required>
						</div>
						<div class="form_box">
							<p>주소</p>
							<input type="button" id="addressButton" onclick="fn_address();" value="주소검색">
							<input type="text" id="address" name="address1" style="display: none; grid-column-start: 2;" readonly  >
							<input type="button" id="addressAgain" style="display:none;" onclick="fn_address();" value="주소재검색">
							<input type="text" id="addressDetail" name="address2" style="display: none; grid-column-start: 2; margin-top: 5px;" placeholder="상세주소를 입력해주세요." >
							<!-- <span class="searchImg">주소검색</span> -->
						</div>
						<div class="form_box">
							<p>성별</p>
							<div class="form_radio">
								<label>
									<input type="radio" name="gender" value="M">남자
								</label>
								<label>
									<input type="radio" name="gender" value="F">여자
								</label>
								<label>
									<input type="radio" name="gender" value="N">선택안함
								</label>
							</div>
						</div>
						<div class="form_box">
							<p>생년월일</p>
							<input type="date" id="birth" name="birth">
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
						
						<div class="button">
							<input type="submit" value="가입하기" onclick=" return check();">
						</div>
					</div>
				</form>
			</div>
		</section>
		
		<script>
		//주소 api창 띄우기
		function fn_address(){
			new daum.Postcode({
				oncomplete: function(data) {
					let address = data.address;
					$("#addressButton").css("display","none");
					$("#address").css("display","block").val(address);
					$(".form_box").addClass("col3");
					$("#addressAgain").css("display","block")
					$("#addressDetail").css("display","block");
	                /* alert(data.userSelectedType) // (J : 지번 , R : 도로명)
	                alert(data.jibunAddress)     // (지번 풀주소 반환)
	                alert(data.sido);            // 시반환(서울특별시)
	                alert(data.sigungu);         // 구반환(은평구) 
	                alert(data.bname);           // 동반환(갈현동)
	                alert(data.postcode);        // 우편번호 반환(6자리)
	                alert(data.zonecode);        // 우편번호 반환(5자리) */
	            }
	
			}).open();
		}
		
		//아이디 비밀번호 유효성체크 확인 변수
		let idFlag = false;
		let pwFlag = false;
		let pwCkFlag = false;
		//중복확인 버튼 유효성 확인변수
		let idDuplicateFlag = false;
		let emailDuplicateFlag = false;
		
		$(function(){
			//아이디 조건 체크
			$("#id").click(function(){
				$("#idCkMSg").css('display', 'block');
				/* $("#k").show(); */
			})
			$("#id").focus(function(){
				$("#idCkMSg").css('display', 'block');
				/* $("#k").show(); */
			})
			$("#id").keyup(function(){
				var id = $('#id').val().trim();
				var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,}$/;
				if(reg.test(id)){ 
					//6자 이상이면서 영문과 숫자를 조합 ok(reg.test(id))
					$('#id1').css("color", "green");
					idFlag = true;
				} else {
					$('#id1').css("color", "red");
					idFlag = false;
				}
				$('#id2').css("color", "red");
				idDuplicateFlag = false;
				
			})
			
			//pw 조건 체크
			$("#pw").click(function(){
				$("#pwMsg").css('display', 'block');
				/* $("#k").show(); */
			})
			$("#pw").focus(function(){
				$("#pwMsg").css('display', 'block');
				/* $("#k").show(); */
			})
			$("#pw").keyup(function(){
				var pw = $('#pw').val().trim();
				var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,20}$/.test(pw);//영문,숫자 조합(10~20)
				var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(pw);//영문,특수문자 조합(10~20)
				var check3 = /^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{10,20}$/.test(pw);//숫자,특수문자 조합(10~20)
				if(pw.length > 9){
					$('#pw1').css("color", "green");
					pwFlag = true;
				} else {
					$('#pw1').css("color", "red");
					pwFlag = false;
				}
				if(check1 || check2 || check3) {
					$('#pw2').css("color", "green");
					pwFlag = true;
				} else {
					$('#pw2').css("color", "red");
					pwFlag = false;
				}
			})
			
			//비밀번호확인 체크
			$("#pwck").click(function(){
				$("#pwCkMsg").css("display","block");
			})
			$("#pwck").focus(function(){
				$("#pwCkMsg").css("display","block");
			})
			$("#pwck").keyup(function(){
				if($("#pwck").val().trim() != "" && $("#pwck").val().trim() == $('#pw').val().trim()){
					$('#pw3').css("color", "green");
					pwCkFlag = true;
				}else{
					$('#pw3').css("color", "red");
					pwCkFlag = false;
				} 
			})
			
			//이메일 조건 체크
			$('#email').focus(function(){
				$("#emailCkMsg").css('display', 'block');
			})
			$('#email').keyup(function(){
				$("#email1").css('color', 'red');
			})
		})
		
		//아이디 중복체크
		function idCk(){
			//아이디 빈칸일 때
			if($("#id").val().trim() == "") {
				alert("아이디를 입력해주세요.");
				return;
			}
			//아이디 조건확인
			if(!idFlag) {
				alert('6자 이상의 영문과 숫자를 조합해주세요.');
				return;
			}
			//
			$.ajax({
				url: "<%= request.getContextPath() %>/MemberIdDuplicate",
				type: "post",
				data: {id:$("#id").val().trim()},
				success: function(data){
					if(data == 0) {
						alert('사용가능한 아이디입니다.');
						$('#id2').css("color", "green");
						idDuplicateFlag = true;
					} else {
						alert('이미 등록된 아이디입니다.');	
						$('#id2').css("color", "red");
						idDuplicateFlag = false;
						$("#id").focus();
					}
				}
			})
		}
		
		//이메일 중복체크
		function emailCk(){
			//이메일 빈칸일 때
			if($("#email").val().trim() == "") {
				alert("이메일을 입력해주세요.");
				return;
			}
			$.ajax({
				url: "<%= request.getContextPath() %>/MemberEmailDuplicate",
				type: "post",
				data: {email: $('#email').val().trim()},
				success: function(data){
					if(data == 0){
						alert('사용이 가능합니다.');
						$('#email1').css("color", "green");
						emailDuplicateFlag = true;
					} else {
						alert('이미 등록된 이메일입니다. 다시 작성해 주십시요!');
						$('#email1').css("color", "red");
						emailDuplicateFlag = false;
					}
				}
			})
		}
		
		//가입확인 버튼 클릭 시 이벤트
		function check(){
			if($('#id').val()==='') {
				alert('아이디를 입력해주세요.')
				return false;
			}
			if(!idDuplicateFlag){
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			if($('#pw').val()==='') {
				alert('비밀번호를 입력해주세요.')
				return false;
			}
			if(!pwFlag){
				alert('비밀번호를 조건에 맞게 입력해 주세요.')
				return false;
			}
			if($('#pwck').val()==='') {
				alert('비밀번호 확인을 입력해주세요.')
				return false;
			}
			if(!pwCkFlag){
				alert('동일한 비밀번호를 입력해 주세요.')
				return false;
			}
			if($('#name').val()==='') {
				alert('이름을 입력해주세요.')
				return false;
			}
			if($('#email').val()==='') {
				alert('이메일을 입력해주세요.')
				return false;
			}
			if(!emailDuplicateFlag){
				alert("이메일 중복확인을 해주세요.");
				return false;
			}
			if($('#phone').val()==='') {
				alert('휴대폰번호를 입력해주세요.')
				return false;
			}
			if($('#address').val()==='') {
				alert('주소를 입력해주세요.')
				return false;
			}
			/* if($('input[name="gender"]').is(':checked')==false) {
				alert('성별을 체크해주세요.')
				return false;
			} */
			if($('#birth').val()==='') {
				alert('생년월일을 입력해주세요.')
				return false;
			}
		}
		</script>
		
<%@ include file="/views/common/footer.jsp"%>