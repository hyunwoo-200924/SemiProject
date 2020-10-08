<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/review.css">
<form id="reviews-container" method="post" action="<%=request.getContextPath()%>" enctype="multipart/form-data">
	<div id="reviews-section-group">
		<div class="reviews-content-group">
			<h2 class="reviews-h1">마이페이지</h2>
			<div class="order">
				<h3 class="reviews-h3">주문 정보</h3>
				<ul>
					<li><a href="">주문/배송 조회</a></li>
					<li><a href="">취소/반품 조회</a></li>
					<li><a href="">선물내역</a></li>
				</ul>
			</div>
			<div class="benefit">
				<h3 class="reviews-h3">혜택</h3>
				<ul>
					<li><a href="">쿠폰</a></li>
					<li><a href="">포인트</a></li>
				</ul>
			</div>
			<div class="acti">
				<h3 class="reviews-h3">나의 활동</h3>
				<ul>
					<li><a href="">리뷰</a></li>
					<li><a href="">맛취향</a></li>
					<li><a href="">쇼핑찜</a></li>
					<li><a href="">1:1 문의</a></li>
				</ul>
			</div>
			<div class="info">
				<h3 class="reviews-h3">나의 정보</h3>
				<ul>
					<li><a href="">개인정보변경</a></li>
					<li><a href="">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		<div class="reviews-right">
			<div class="reviews-container-group">

				<div id="reviewtitle">
					<h1 class="reviews-h1">리뷰</h1>

					<button class="written-reviews-button">작성 가능한 리뷰</button>
					&nbsp;
					<button class="written-reviews-button">작성한 리뷰</button>
				</div>
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
							<label class="search-year"> <input type="date"
								name="date" value="2020~" class="search-date"
								placeholder="choice" style="width: 200px; height: 30px;">

							</label>
							<div class="search-year">

								<input type="date" name="date" value="2020~" class="search-date"
									placeholder="choice" style="width: 200px; height: 30px;">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="reviews-container">
				<form class="reviews-container-group1" href="" method="post">
					<table class="reviews-table">
						<tbody class="reviews-table-items">
							<tr class="reviews-table-group">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성날짜</th>
							</tr>
							<tr class="reviews-table-group" style="display: none;">
								<td class="" name="">1</td>
								<td class="" name="">명절이다</td>
								<td class="" name="">홍길동</td>
								<td class="" name="">2020.9.10</td>
							</tr>
						</tbody>
					</table>
					<div class="reviews-button-group">
						<input type="button" value="검색"> <input type="button"
							value="작성"> <input type="button" value="수정">
					</div>
				</form>
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
						<li class="bul_dot"><i class="bullet"></i> 포토 리뷰는 300P, 텍스트
							리뷰는 200P가 지급되며 꿀팁 작성 시 100P가 추가 지급됩니다. (최대 400P 지급)</li>
						<li class="bul_dot"><i class="bullet"></i> 베스트 리뷰는 선정된 당일 별도로
							1,000P가 지급되며 [MY쿡킷&gt;포인트]에서 확인할 수 있습니다.</li>
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
</form>
<%@ include file="/views/common/footer.jsp"%>