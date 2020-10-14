<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/member/memberEnrollCheckedView.css">
<section>
	<form class="enroll-container" action="<%=request.getContextPath() %>/memberEnrollCheck.do" method="post" >
	<!--memberEnrollCheckedEndServlet으로 넘어감  -->
        <div class="joinText"> 
            <h1>회원관리 여부 확인</h1>
        </div>
        <div class="join1">
        		<div class="NameCheckForm">
            		<input type="text" name="joinName" id="joinName" placeholder="이름을 입력해 주세요."><br><br>
            		<div id="nameMsg" style="display:none;  grid-column-start: 2;">
            			<span id="name1" style="display:block; color:red;">이름을 입력해 주세요</span>
					</div>            	
            	</div>
            	<div class="MailCheckForm">
            		<input type="text" name="joinEmail" id="joinEmail" placeholder="이메일을 입력해 주세요"><br><br>
            		<div id="mailMsg" style="display:none;  grid-column-start: 2;">
            			<span id="email1" style="display:block; color:red;">이메일을 입력해 주세요</span>
					</div>            	
        		</div>
            		<input class="ckJoin" type="submit" name="ckJoin" id="ckJoin" value="가입여부 확인" onclick="return ck();">
        </div>
     </form>
</section>

<!--스크립트 시작-->
<script>
	function ck() {
		let joinName1 = $('#joinName').val();
		let joinEmail1 = $('#joinEmail').val();
		console.log(joinName1);
		if(joinName1 == ""){
			$('#nameMsg').css('display','block');
			return false
		}
		if(joinName1 != ""){
			$('#nameMsg').css('display','none');
		}
		if(joinEmail1 == ""){
			$('#mailMsg').css('display','block');
			return false
		}
		if(joinEmail1 != ""){
			$('#mailMsg').css('display','none');
		}
	}

 
</script>
<%@ include file="/views/common/footer.jsp"%>