<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.eol.member.model.vo.Member" %>

<%
	Member m1 = new Member("asdf");//이거 확인용 로직
	//session1.setMaxInactiveInterval(2);
	request.getSession().setAttribute("loginMember", m1);//이거 확인용 로직
	Member m = (Member)request.getSession().getAttribute("loginMember");
%>

<%@ include file="/views/common/header.jsp"%>

<style>
.button{
	text-align: center;
	border-top: 1px solid grey;
    padding-top: 20px;
    margin-top: 50px;
    text-align: center;
}
.button input{
	width: 20%;
 	height: 50px;
}
</style>

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
					<p>비밀번호 재확인</p>
					<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
				</div>
				<form action="<%= request.getContextPath() %>/memberUpdatePwCk"	method="post">
					<div class="user_update_form">
						<div class="form_box">
							<p>아이디</p>
							<input type="text" value="<%= m.getmId() %>">
						</div>
						<div class="form_box">
							<p>비밀번호<span class="filsu">*</span></p>
							<input type="password" id="pwck" name="pwck">
						</div>
					</div>
					<div class="button">
						<input type="submit" value="확인" onclick="return fn_pwck();">
					</div>
				</form>
			</div>
		</section>
		
		<script>
			function fn_pwck(){
				if($("#pwck").val().trim() == "") {
					alert('비밀번호를 입력해 주세요.');	
					return false;
				}
			}
		</script>
		
<%@ include file="/views/common/footer.jsp"%>