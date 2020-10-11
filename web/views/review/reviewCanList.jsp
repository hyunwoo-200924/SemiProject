<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.eol.review.model.vo.Review"%>
<%
	List<Review> list = (List) request.getAttribute("list");
String pageBar = (String) request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/review.css">

<section id="reviews-container">
	<div id="reviews-section-group">
		<div class="reviews-right">
			<div class="reviews-container-group">
				<div id="reviewtitle">
					<h1 class="reviews-h1">리뷰</h1>
					<button class="written-reviews-button"
						onclick="location.assign('<%=request.getContextPath()%>/review/reviewCanList')">작성
						가능한 리뷰</button>
					&nbsp;
					<button class="written-reviews-button"
						onclick="location.assign('<%=request.getContextPath()%>/review/reviewList')">작성한
						리뷰</button>
				</div>
				<div class="reviews-container">
					<form class="reviews-container-group1" href="" method="post">
						<table class="reviews-table">

						</table>
						<div class="reviews-container">
							<form class="reviews-container-group1" href="" method="post">
								<div class="reviews-button-group">
									<input type="button" value="작성하기"
										onclick="location.assign('<%=request.getContextPath()%>/review/reviewWrite')">
								</div>
							</form>
						</div>
					</form>
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
						<li class="bul_dot"><i class="bullet"></i> CJ ONE 포인트는 리뷰 작성
							10일 이내 정상적으로 게시된 리뷰에 한해 지급됩니다.</li>
						<li class="bul_dot"><i class="bullet"></i> 포토 리뷰는 300P, 텍스트
							리뷰는 200P가 지급되며 꿀팁 작성 시 100P가 추가 지급됩니다. (최대 400P 지급)</li>
						<li class="bul_dot"><i class="bullet"></i> 베스트 리뷰는 선정된 당일 별도로
							1,000P가 지급되며 [MY쿡킷&gt;CJ ONE 포인트]에서 확인할 수 있습니다.</li>
						<li class="bul_dot"><i class="bullet"></i> 리뷰 수정은 포인트 지급전까지만
							가능하며, 리뷰를 삭제하는 경우 지급된 포인트가 회수됩니다.</li>
						<li class="bul_dot"><i class="bullet"></i> 리뷰에 적합하지 않은 내용이나
							사진을 기제한 경우, 동일한 내용을 반복적으로 입력한 경우 통보없이 비공개 처리될 수 있습니다.</li>
						<li class="bul_dot"><i class="bullet"></i> 비공개 처리 시 포인트가
							미지급되며, 이미 지급된 포인트는 회수됩니다.</li>
						<li class="bul_dot"><i class="bullet"></i> 리뷰의 저작권은 당사에 귀속되며,
							광고 등의 목적으로 사용될 수 있습니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>