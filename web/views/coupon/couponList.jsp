<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, com.eol.member.model.vo.Coupon"%>

<%
	List<Coupon> list = (List)request.getAttribute("list");
%>    
<style>
	.user_coupon_enroll{
		border: 1px solid black;
	    display: grid;
	    grid-template-columns: 270px 125px auto auto;
	    grid-gap: 30px;
	    height: 100px;
	    align-items: center;
	    padding: 29px;
	    margin-bottom: 30px;
	}
	.user_coupon_list{
		border-bottom: 1px solid black;
    	border-top: 1px solid black;
    	height: 400px;
    	padding: 20px 5px;
	}
	.coupon_form{
		display: grid;
    	grid-template-columns: 235px 65px 150px auto auto;
    	text-align: center;
	}
</style>   
    
<%@ include file="/views/common/header.jsp"%>
	
		<section class="container">
			<%@ include file="/views/mypage/common/mypagenav.jsp" %>
			
			<div class="user_content_form_wrap">
				<div class="title">
					<h1>쿠폰</h1>
				</div>
				<div class="user_coupon">
					<div class="user_coupon_enroll">
						<input type="text">
						<input type="button" value="쿠폰등록">
					</div>
					<div class="user_coupon_list">
						<div class="coupon_form">
							<span>쿠폰명</span>
							<span>기능</span>
							<span>할인/적립</span>
							<span>사용가능기간</span>
							<span>사용여부</span>
						</div>
						 <%if(list.isEmpty()) {%>
							<div>쿠폰내역이 없습니다.</div>
						<%} else {
							for(Coupon c : list) {
						%>
							<div class="coupon_form">
								<span><%=c.getCoName() %></span>
								<span>할인</span>
								<span>-<%=c.getCoContent() %>원</span>
								<span><%=c.getCoContent() %></span>
								<span><%=c.getCoStatus() %></span>
							</div>
							<%} %>
						<%} %>
					</div>
				</div>
			</div>
		</section>
		
<%@ include file="/views/common/footer.jsp"%>