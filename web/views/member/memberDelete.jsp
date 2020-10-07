<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<%@ include file="/views/common/header.jsp"%>

		<section class="container2">
			<div class="user_content_form_wrap">
				<div class="title">
					<h1 style="text-align:center">회원 탈퇴</h1>
				</div>
				<div class="user_delete_form">
					<div class="form_box_delete" style="line-height: 30px;">
						<p>회원탈퇴안내</p>
						<div>
							<P>
								고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나봅니다. 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다. 
							</P>
							<p style="color: #770577; padding: 20px 0; font-weight: bold;">
								아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.
							</p>
							<div>
								<p>1. 회원탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에 따라 관리 됩니다.</p>
								<p>2. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제 됩니다.</p>
								<p>3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.</p>
								<p>4. 회원 탈퇴 시 컬리패스 해지는 별도로 고객행복센터(0000-0000)를 통해서 가능합니다. 직접 해지를 요청하지 않으면 해지 처리가 되지 않습니다.</p>
							</div>
							
						</div>
					</div>
					<div class="form_box_delete">
						<p>비밀번호 확인</p>
						<input type="password" id="pw" style="width: 350px; height: 40px;">
					</div>
					<div class="form_box_delete">
						<p>무엇이 불편하셨나요?</p>
						<div class="checkbox_container">
							<div class="checkbox">
								<label for="d_reson0"><input type="checkbox" name="d_reason" id="d_reson0" value="comple_service">고객서비스(상담,포장 등)불만</label>
								<label for="d_reson2"><input type="checkbox" name="d_reason" id="d_reson2" value="comple_change">교환/환불/반품 불만</label>
								<label for="d_reson4"><input type="checkbox" name="d_reason" id="d_reson4" value="comple_change">상품가격 불만</label>
							</div>
							<div class="checkbox">
								<label for="d_reson1"><input type="checkbox" name="d_reason" id="d_reson1" value="comple_delivery">배송불만</label>
								<label for="d_reson3"><input type="checkbox" name="d_reason" id="d_reson3" value="comple_visit">방문 빈도가 낮음</label>
								<label for="d_reson5"><input type="checkbox" name="d_reason" id="d_reson5" value="comple_security">개인 정보유출 우려</label>
							</div>
						</div>
					</div>
					<div class="form_box_delete">
						<textarea cols="30" rows="10"></textarea>
					</div>
					<div class="button col2">
							<input type="button" value="취소" onclick="history.go(-1);">
							<input type="button" value="탈퇴" onclick="memberDelete()">
					</div>
				</div>
			</div>
		</section>
		
		<script>
			function memberDelete() {
				//비밀번호 빈칸일 때
				if($("#pw").val().trim() == "") {
					alert("비밀번호를 입력해주세요.");
					return;
				}
 				$.ajax({
					url: "<%= request.getContextPath() %>/MemberDeletePwCk",
					type: "post",
					data: {pw:$("#pw").val().trim()},
					success: function(data){
						console.log(data);
						if(data == "true"){
							let msg = confirm('정말로 탈퇴하시겠습니까');
							if(msg){
								location.href = "<%= request.getContextPath() %>/MemberDelete"
							}
						}else{
							alert('비밀번호가 틀렸습니다.');
							return;
						}
					}
				})
<%--  				$.ajax({
					url: "<%= request.getContextPath() %>/MemberDeletePwCk",
					type: "post",
					data: {pw:$("#pw").val().trim()},
					success: function(data){
						console.log(data);
						if(data == "true"){
							let msg = confirm('정말로 탈퇴하시겠습니까');
							if(msg){
								$.ajax({
									url: "<%= request.getContextPath() %>/MemberDelete",
									type: "post",
									success: function(data){
										if(data > 0){
											console.log(data);
											alert('탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.');
											location.href = "<%= request.getContextPath() %>/index.jsp"
										}else{
											console.log(data);
											alert('탈퇴에 실패하였습니다. 서비스센터로 문의바랍니다.');
										}
									}
								})
							}
						}else{
							alert('비밀번호가 틀렸습니다.');
							return;
						}
					}
				}) --%>
			}
		</script>
		
<%@ include file="/views/common/footer.jsp"%>