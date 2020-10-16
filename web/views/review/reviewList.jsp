<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,java.util.ArrayList,com.eol.review.model.vo.Review,com.eol.member.model.vo.Member"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<%
	List<Review> list = (List) request.getAttribute("list");
	List<Review> list2 = (List) request.getAttribute("list2");
	String pageBar2 = (String) request.getAttribute("pageBar2");
	Member m= (Member)session.getAttribute("loginMember");
	String ndate = "";
	String ydate = "";
%>

<script>
	$(function(){
		$('#one').click(function(){
			<%ydate = "1";%>
			location.replace('<%=request.getContextPath()%>/review/reviewSelectDate?ydate=<%=ydate%>');
		});
		$('#three').click(function(){
			<%ydate = "3";%>
			location.replace('<%=request.getContextPath()%>/review/reviewSelectDate?ydate=<%=ydate%>');
		});
		$('#six').click(function(){
			<%ydate = "6";%>
			location.replace('<%=request.getContextPath()%>/review/reviewSelectDate?ydate=<%=ydate%>');
		});
		$('#year').click(function(){
			<%ydate = "10";%>
			location.replace('<%=request.getContextPath()%>/review/reviewSelectDate?ydate=<%=ydate%>');
		});
	});
</script>

<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/review.css">

<section id="reviewSection">
<%@ include file="/views/mypage/common/mypagenav.jsp" %>
	<div>
	<div id="reviewtitle">
		<h1 class="reviews-h1">리뷰</h1>
		<button id="test" class="written-reviews-button" onclick="location.assign('<%=request.getContextPath()%>/review/reviewCanList')">작성
			가능한 리뷰</button>
		&nbsp;
		<button id="test2" class="written-reviews-button" onclick="location.assign('<%=request.getContextPath()%>/review/reviewList')">작성한
			리뷰</button>
	</div>

	<div class="reviews-container-group">
		<div id="reviewlist" class="reviews-container-group">
			<label class="box-radio-input"><input id="one" type="radio" name="cp_item" value="1개월" onlick="select();"><span>1개월</span></label>
			<label class="box-radio-input"><input id="three" type="radio" name="cp_item" value="3개월" onlick="select();"><span>3개월</span></label>
			<label class="box-radio-input"><input id="six" type="radio" name="cp_item" value="6개월" onlick="select();"><span>6개월</span></label>
			<label class="box-radio-input"><input id="year" type="radio" name="cp_item" value="1년" onlick="select();"><span>1년</span></label>
			<!-- <input type="date" name="date" value="2020~" class="search-date" placeholder="choice" style="width: 130px; height: 38px; font-size: 14px;" >
			<input type="date" name="date" value="2020~" class="search-date" placeholder="choice" style="width: 130px; height: 38px; font-size: 14px;"> -->
		</div>
		<script>
			
		</script>
		
		
	</div>
		<div class="reviews-container">
			<form class="reviews-container-group1" href="" method="post">
			</form>
				<table id="reviewTable">
					<tr>
						<th></th>
						<th>상품</th>
						<th>작성자</th>
						<th>작성날짜</th>
					</tr>
					<%if (list2.isEmpty()) {%>
						<tr>
							<td colspan="5"><p style="text-align: center">조회된 게시글이
									없습니다.</p></td>
						</tr>
					<%} else { %>
							<%for (Review r : list2) {%>
								<tr>
									<%if(r.getmImage() == null){ %>
										<td>업로드된 이미지가 없습니다.</td>
									<%} else{%>
									<td><img src="<%=request.getContextPath()%>/upload/review/<%=r.getmImage()%>" style="width: 130px; height: 100px;"></td>
									<%} %>
									<td><%=r.getpName() %></td>
									<td><%=m.getmName()%></td>
									<td><%=r.getrRdate()%></td>
									<td><button class="writereview" onclick="location.assign('<%=request.getContextPath()%>/review/reviewUpdate?pName=<%=r.getpName()%>&rNo=<%=r.getrNo()%>&rTitle=<%=r.getrTitle() %>&rContent=<%=r.getrContent() %>&mImage=<%=r.getmImage() %>&odoNo=<%=r.getodoNo()%>&odpNo=<%=r.getodpNo() %>&rNo=<%=r.getrNo()%>&mNo=<%=m.getmNo()%>')">수정하기</button></td>
									<td><button class="deletereview" onclick="removeCheck()">삭제하기</button></td>
									
									<script>
										function removeCheck() {
											 if (confirm("리뷰를 삭제하시면 리뷰 작성 시 지급되었던 포인트가 소멸됩니다. 정말 삭제하시겠습니까?") == true){    //확인
												 location.replace('<%=request.getContextPath()%>/review/reviewDelete?oNo=<%=r.getoNo()%>&pNo=<%=r.getpNo()%>')
												 alert('삭제가 완료되었습니다.');
											 }else{   //취소
											     return false;
											 }
										}
									</script>
									
								</tr>
							<%} %>
					<%} %>
				
			</table>
				<div id="pageBar">
							<%=pageBar2%>
						</div>

		<div class="reviews-guide">
		<div>
			<div>
				<dl>
					<dt style="font-size:18px; color : #606060;">리뷰 작성 시 총 포인트 500P 적립</dt><dt style="color : #606060;">( 포토 리뷰 300P + 텍스트 리뷰 200P  )</dt>
				</dl>
				<dl>
					<dt>
						
					</dt>
				</dl>
			</div>
			</div>
			<ul id="gray">
				<li>- 리뷰는 배송 완료 후 30일 이내 작성 가능합니다.</li>
				<li>- 포인트는 리뷰 작성 10일 이내 정상적으로 게시된 리뷰에 한해 지급됩니다.</li>
				<li>- 리뷰를 삭제하는 경우 지급된 포인트가 회수됩니다.</li>
				<li>- 리뷰에 적합하지 않은 내용이나 사진을 기제한 경우, 동일한 내용을 반복적으로 입력한 경우 통보없이 비공개 처리될 수 있습니다.</li>
				<li>- 비공개 처리 시 포인트가 미지급되며, 이미 지급된 포인트는 회수됩니다.</li>
				<li>- 리뷰의 저작권은 당사에 귀속되며, 광고 등의 목적으로 사용될 수 있습니다.</li>
			</ul>
		</div>
		</div>
		</div>
</section>
<%@ include file="/views/common/footer.jsp"%>