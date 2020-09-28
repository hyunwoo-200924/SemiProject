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
				<form id="memberFrm" method="post" action="<%=request.getContextPath()%>/memberEnllor.do">
					<div class="user_update_form">
						<div class="form_box col3">
							<p>아이디</p>
							<input type="text" name="id" id="id" required>
							<input type="button" value="중복확인" onclick="idCk();">
							<div id="idCkMSg" style="display:none;  grid-column-start: 2;">
								<span id="1" style="display: block;color:red;">6자이상</span>
								<span id="2" style="display: block;color:red;">대문자</span>
								<span id="3" style="display: block;color:red;">111</span>
							</div>
						</div>
						<div class="form_box">
							<p>비밀번호</p>
							<input type="password" name="pw" id="pw" required>
						</div>
						<div class="form_box">
							<p>비밀번호 확인</p>
							<input type="password" id="pwck" required>
							<div id="k" style="display:none;  grid-column-start: 2;">
								<span id="1" style="display: block;color:red;">6자이상</span>
								<span id="2" style="display: block;color:red;">대문자</span>
								<span id="3" style="display: block;color:red;">111</span>
							</div>
						</div>
						<div class="form_box">
							<p>이름</p>
							<input type="text" name="name" required>
						</div>
						<div class="form_box col3">
							<p>이메일</p>
							<input type="email"  name="email" required>
							<input type="button" value="중복확인" onclick="emailCk();" >
						</div>
						<div class="form_box">
							<p>휴대폰</p>
							<input type="text" name="phone" required>
						</div>
						<div class="form_box">
							<p>주소</p>
							<input type="button" id="addressButton" onclick="fn_address();" value="주소검색">
							<input type="text" id="address" name="address1" style="display: none; grid-column-start: 2;" readonly  >
							<input type="button" id="addressAgain" style="display:none;" onclick="fn_address();" value="주소재검색">
							<input type="text" id="addressDetail" name="address2" style="display: none; grid-column-start: 2;" placeholder="상세주소를 입력해주세요." >
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
							<input type="date" name="birth">
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
		
		
		//중복확인 버튼 유효성
		var idFlag = false;
		var emailFlag = false;
		function idCk(){
			idFlag = true;
		}
		function emailCk(){
			emailFlag = true;
		}
		//아이디 비밀번호 조건 체크
		$(function(){
			$("#id").click(function(){
				$("#idCkMSg").css('display', 'block');
				
				/* $("#k").show(); */
				
			})
			$("#id").keyup(function(){
				var id = $('#id').val().trim();
				var reg = /(?=.*[A-Z])/
				if(id.length > 5){
					$('#1').css("color", "green");
				} else {
					$('#1').css("color", "red");
				}
				if(!reg.test(id)) {
					$('#2').css("color", "red");
				} else {
					$('#2').css("color", "green");
				}
			})
			
			$("#pw").click(function(){
				$("#k").css('display', 'block');
				
				/* $("#k").show(); */
				
			})
			$("#pw").keyup(function(){
				var pw = $('#pw').val().trim();
				var reg = /(?=.*[A-Z])/
				if(pw.length > 5){
					$('#1').css("color", "green");
				} else {
					$('#1').css("color", "red");
				}
				if(!reg.test(pw)) {
					$('#2').css("color", "red");
				} else {
					$('#2').css("color", "green");
				}
			})
		})
			function fn_updateMember(){
				
				let pw = $("#pw").val();
				let pwck = $("#pwck").val();
				console.log(pw);
				if(pw != pwck){
					alert("비밀번호다름");
				} 
				<%-- $("memberFrm").attr("action","<%=request.getContextPath()%>/updateMember").submit(); --%>
			}
		
		//가입확인 버튼 클릭 시 이벤트
		function check(){
			if(!idFlag){
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			if(!emailFlag){
				alert("이메일 중복확인을 해주세요.");
				return false;
			}
		}
		</script>
		
<%@ include file="/views/common/footer.jsp"%>