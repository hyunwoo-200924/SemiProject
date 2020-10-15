<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,java.util.ArrayList,com.eol.review.model.vo.Review,com.eol.member.model.vo.Member"%>
<%
	List<Review> list = (List) request.getAttribute("list");
	List<Review> list2 = (List) request.getAttribute("list2");
	String pageBar2 = (String) request.getAttribute("pageBar2");
	Member m= (Member)session.getAttribute("loginMember");
%>

<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/review.css">
	
<%@ include file="/views/mypage/common/mypagenav.jsp" %>

<section id="reviews-container">
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
			<label class="box-radio-input"><input type="radio" name="cp_item" value="1개월"><span>1개월</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="3개월"><span>3개월</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="6개월"><span>6개월</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="1년"><span>1년</span></label>
			<input type="date" name="date" value="2020~" class="search-date" placeholder="choice" style="width: 300px; height: 40px; font-size: 17px; text-align: center">
			<input type="date" name="date" value="2020~" class="search-date" placeholder="choice" style="width: 300px; height: 40px; font-size: 17px; text-align: center">
		</div>
	</div>
		<div class="reviews-container">
			<form class="reviews-container-group1" href="" method="post">
			</form>
				<table id="reviewTable">
					<tr>
						<th>제목</th>
						<th>상품</th>
						<th>작성자</th>
						<th>사진</th>
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
									<td><%=r.getrTitle()%></td>
									<td><%=r.getpName() %></td>
									<td><%=m.getmName()%></td>
									<%if(r.getmImage() == null){ %>
										<td>업로드된 이미지가 없습니다.</td>
									<%} else{%>
									<td><img src="<%=request.getContextPath()%>/upload/review/<%=r.getmImage()%>" style="width: 130px; height: 100px;"></td>
									<%} %>
									<td><%=r.getrRdate()%></td>
									<td><button onclick="location.assign('<%=request.getContextPath()%>/review/reviewUpdate?pName=<%=r.getpName()%>&rNo=<%=r.getrNo()%>&rTitle=<%=r.getrTitle() %>&rContent=<%=r.getrContent() %>&mImage=<%=r.getmImage() %>&odoNo=<%=r.getodoNo()%>&odpNo=<%=r.getodpNo() %>&rNo=<%=r.getrNo()%>&mNo=<%=m.getmNo()%>')">수정하기</button></td>
									<td><button onclick="removeCheck()">삭제하기</button></td>
									
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
		</div>
	<div class="reviews-guide">
		<div>
			<div>
				<p>
					리뷰 작성 시 포인트 <span>500P</span> 적립
				</p>
				<dl>
					<dt>
						포토 리뷰 <span>300P</span>
					</dt>
					<dd>포토 + 텍스트(50자)</dd>
				</dl>
			</div>
				<dl>
					<dt>
						텍스트 리뷰 <span>200P</span>
					</dt>
					<dd>텍스트(50자)</dd>
				</dl>
			</div>
			<ul>
				<li> 리뷰는 배송 완료 후 30일 이내
					작성 가능합니다.</li>
				<li> 포인트는 리뷰 작성
					10일 이내 정상적으로 게시된 리뷰에 한해 지급됩니다.</li>
				<li> 포토 리뷰는 300P, 텍스트 리뷰는
					200P가 지급되며 꿀팁 작성 시 100P가 추가 지급됩니다. (최대 400P 지급)</li>
				<li> 베스트 리뷰는 선정된 당일 별도로
					1,000P가 지급되며 [ 마이페이지 &gt; 포인트 ]에서 확인할 수 있습니다.</li>
				<li> 리뷰 수정은 포인트 지급전까지만
					가능하며, 리뷰를 삭제하는 경우 지급된 포인트가 회수됩니다.</li>
				<li> 리뷰에 적합하지 않은 내용이나 사진을
					기제한 경우, 동일한 내용을 반복적으로 입력한 경우 통보없이 비공개 처리될 수 있습니다.</li>
				<li> 비공개 처리 시 포인트가 미지급되며,
					이미 지급된 포인트는 회수됩니다.</li>
				<li> 리뷰의 저작권은 당사에 귀속되며,
					광고 등의 목적으로 사용될 수 있습니다.</li>
			</ul>
		</div>
</section>
<%@ include file="/views/common/footer.jsp"%>