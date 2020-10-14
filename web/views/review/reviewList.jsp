<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,java.util.ArrayList,com.eol.review.model.vo.Review,com.eol.member.model.vo.Member"%>
<%
	List<Review> list = (List) request.getAttribute("list");
	List<Review> list2 = (List) request.getAttribute("list2");
	String pageBar = (String) request.getAttribute("pageBar");
	Member m= (Member)session.getAttribute("loginMember");
%>

<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/review.css">

<script>
	$(function(){
		$("#reviewlist").hide();
			$("#test").click(function(){
				$("#reviewcanlist").show();
				$("#reviewlist").hide();
			});
			$("#test2").click(function(){
				$("#reviewcanlist").hide();
				$("#reviewlist").show();
			});
	});
</script>

<section id="reviews-container">
	<div id="reviewtitle">
		<h1 class="reviews-h1">리뷰</h1>
		<button id="test" class="written-reviews-button"<%-- onclick="location.assign('<%=request.getContextPath()%>/review/reviewList')" --%>>작성
			가능한 리뷰</button>
		&nbsp;
		<button id="test2" class="written-reviews-button"<%-- onclick="location.assign('<%=request.getContextPath()%>/review/reviewList')" --%>>작성한
			리뷰</button>
	</div>

	<div id="reviewcanlist">
		<table>
			<%if (list.isEmpty()) {%>
				<tr>
					<td colspan="3"><p style="text-align: center">작성 가능한 게시글이
							없습니다.</p></td>
				</tr>
			<%} else { %>
					<%int[] arr = new int[list.size()]; %>
					<%-- <%
					System.out.println(list.get(0).getodoNo()); System.out.println(list2.get(0).getoNo());
					System.out.println(list.get(0).getodpNo()); System.out.println(list2.get(0).getpNo());
					%> --%>
					<%for(int i=0; i<list.size(); i++){ %>
						<%for(int j=0; j<list2.size(); j++){ %>
							<%if(list.get(i).getodoNo() == list2.get(j).getoNo() && list.get(i).getodpNo() == list2.get(j).getpNo()) {%>
								<%arr[i] = 1; %>
							<%}else{ %>
								<%if(arr[i] != 1) arr[i] = 0; %>
							<%}%>
						<%} %>
					<%} %>
					<%int i=0; %>
					<%for (Review r : list) {%>
						<%if(arr[i] == 0){ %>
						<tr>
							<td><%=r.getodoNo()%></td>
							<td><%=r.getpName()%></td>
							<td><%=r.getpNo()%></td>
							<td><button onclick="location.assign('<%=request.getContextPath()%>/review/reviewWrite?odoNo=<%=r.getodoNo()%>&odpNo=<%=r.getodpNo()%>&pName=<%=r.getpName()%>&mName=<%=m.getmName()%>')">작성하기</button></td>
						</tr>
						
						<%} %>
						<%i++; %>
					<%} %>
					
					<%-- <%for(int i=0; i< list.size(); i++){ %>
								<%if (arr.indexOf(0)==-1) {%>
									<tr>
										<td colspan="3"><p style="text-align: center">조회된 게시글이
												없습니다.</p></td>
									</tr>
								<%} %>
							<%} %> --%>
			<%} %>
		</table>
	</div>

	<div id="reviewlist" class="reviews-container-group">
		<div id="reviews-content">
			<div class="reviews-sort">
				<div class="search-month">
					<div class="search-radio">
						<input type="radio" name="month" id="01" style="opacity: 0;">
						<label for="01">1개월</label>
					</div>
					<div class="search-radio">
						<input type="radio" name="month" id="03" style="opacity: 0;">
						<label for="03">3개월</label>
					</div>
					<div class="search-radio">
						<input type="radio" name="month" id="06" style="opacity: 0;">
						<label for="06">6개월</label>
					</div>
					<div class="search-radio">
						<input type="radio" name="month" id="1" style="opacity: 0;">
						<label for="1">1년</label>
					</div>
					<label class="search-year"> <input type="date" name="date"
						value="2020~" class="search-date" placeholder="choice"
						style="width: 200px; height: 30px;">
					</label>
					<div class="search-year">
						<input type="date" name="date" value="2020~" class="search-date"
							placeholder="choice" style="width: 200px; height: 30px;">
					</div>
				</div>
			</div>
		</div>
		<div class="reviews-container">
			<form class="reviews-container-group1" href="" method="post">
			</form>
				<table class="reviews-table">
					<tr class="reviews-table-group">
						<th>제목</th>
						<th>상품</th>
						<th>작성자</th>
						<th>작성날짜</th>
					</tr>
					<%if (list2.isEmpty()) {%>
						<tr>
							<td colspan="4"><p style="text-align: center">조회된 게시글이
									없습니다.</p></td>
						</tr>
					<%} else { %>
							<%for (Review r : list2) {%>
								<tr>
									<td><%=r.getrTitle()%></td>
									<td><%=r.getpName() %></td>
									<td><%=m.getmName()%></td>
									<td><%=r.getrRdate()%></td>
									<%-- <td><button onclick="location.replace('<%=request.getContextPath()%>/review/reviewDelete?oNo=<%=r.getoNo()%>&pNo=<%=r.getpNo()%>')">삭제하기</button></td> --%>
								</tr>
							<%} %>
					<%} %>
				</table>
		</div>
	</div>

	<div class="reviews-guide">
		<div class="guidecontent">
			<div class="guide-content-items">
				<p>
					리뷰 작성 시 포인트 최대 <span>1,400P</span> 적립
				</p>
				<dl class="-reiviews-photo">
					<dt>
						포토 리뷰 <span class="fc_dgreen">300P</span>
					</dt>
					<dd>포토 + 텍스트(50자)</dd>
				</dl>
			</div>
			<div class="guide-content-items">

				<dl class="reviews-text">
					<dt>
						텍스트 리뷰 <span class="fc_dgreen">200P</span>
					</dt>
					<dd>텍스트(50자)</dd>
				</dl>
			</div>
			<ul class="bul_list">
				<li class="bul_dot"><i class="bullet"></i> 리뷰는 배송 완료 후 30일 이내
					작성 가능합니다.</li>
				<li class="bul_dot"><i class="bullet"></i> 포인트는 리뷰 작성
					10일 이내 정상적으로 게시된 리뷰에 한해 지급됩니다.</li>
				<li class="bul_dot"><i class="bullet"></i> 포토 리뷰는 300P, 텍스트 리뷰는
					200P가 지급되며 꿀팁 작성 시 100P가 추가 지급됩니다. (최대 400P 지급)</li>
				<li class="bul_dot"><i class="bullet"></i> 베스트 리뷰는 선정된 당일 별도로
					1,000P가 지급되며 [ 마이페이지 &gt; 포인트 ]에서 확인할 수 있습니다.</li>
				<li class="bul_dot"><i class="bullet"></i> 리뷰 수정은 포인트 지급전까지만
					가능하며, 리뷰를 삭제하는 경우 지급된 포인트가 회수됩니다.</li>
				<li class="bul_dot"><i class="bullet"></i> 리뷰에 적합하지 않은 내용이나 사진을
					기제한 경우, 동일한 내용을 반복적으로 입력한 경우 통보없이 비공개 처리될 수 있습니다.</li>
				<li class="bul_dot"><i class="bullet"></i> 비공개 처리 시 포인트가 미지급되며,
					이미 지급된 포인트는 회수됩니다.</li>
				<li class="bul_dot"><i class="bullet"></i> 리뷰의 저작권은 당사에 귀속되며,
					광고 등의 목적으로 사용될 수 있습니다.</li>
			</ul>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>