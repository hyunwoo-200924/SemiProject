<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.*, com.eol.cart.model.vo.Cart, com.eol.product.model.vo.Product, com.eol.member.model.vo.*"%>

<%@ include file="/views/common/header.jsp"%>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp14973248'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
</script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/nonorderpay.css">

<%
	
	List<Product> list = (List)request.getSession().getAttribute("oneCartList");
%>

<div class="present-section-container-block">
	<h1>결제하기</h1>
	<!-- 그리드 2개 파트로 나눈섹션 -->
	<section class="present-section-container-block-wrap">
		<!-- 큰 그리드 1 -->
		
		
		<form id="order" action="<%=request.getContextPath() %>/orderpay.do" method="post" >
		<div class="present-section-container">
			<!-- 배송지블록 개인정보 -->
			<div class="ddivv">
			<div class="ddivv1">
			<div class="present-section-container-group1">
			<div class="present--group">
				<div class="present-section-group1">
					<div class="present-items-group1-1">
						<div class="present-order-person">
							<h3 class="info-title">주문자</h3>
							<div class="inputOrder">
							이름 <input class="order-person-group" id="oName" name="oName" type="text" value=""/>
							연락처 <input class="order-person-group" id="oPhone" name="oPhone" type="text" value=""/>
							</div>
							<div class="inputOrder">
							주문비밀번호 <input class="order-person-group" id="oPw" name="oPw" type="password" value=""/>
							비밀번호 확인<input class="order-person-group" id="oPwCheck" type="password" value=""/>
							</div>
						</div>
					</div>
				</div>
			</div>
				<!-- 배송지 주소 입력 블록 -->
				<div class="present-section-group2">
					<div class="present-items-group2-2">
						<h3 class="info-title">배송 정보</h3>
						<!-- <button class="btn-small">기존주소선택</button>
						<button class="btn-small">배송지추가</button> -->
						<div class="present-items-img">
						<div class="inputOrder">
							<!-- 주소창에 입력후에 자동생성되게 자바스크립트 -->

							<div class="persnal-info">
								이름<input type="text" id="oToName" value="" placeholder="이름을 입력하세요" class="text-inputtag"/> 
								연락처<input type="text" id="oToPhone" placeholder="예)010-0000-0000" class="text-inputtag"/>
							</div>
							
							<div class="persnal-info">
								<!-- 주소입력 -->
							배송지 <input class="btn-small" type="button" id="addressButton" onclick="fn_address();" value="주소검색">
							<input type="text" class="address-text" id="address" name="address1" style="display: none; width: 300px; height: 25px; margin: 5px 0;" readonly  >
							<input class="btn-small" type="button" id="addressAgain" style="display:none;" onclick="fn_address();" value="주소재검색">
							<input type="text" id="addressDetail" name="address2" style="display: none; width: 300px; height: 25px; margin: 5px 0;" placeholder="상세주소를 입력해주세요." >

							</div>
							</div>
						</div>

					</div>
				</div>
		</div>
				<!-- 배송 도착날짜 확인및 상품 확인 블록 -->

				<div class="present-section-group4">
					<div class="present-items-group4-4">
					<%
						int oAmount = 0;
					Date oDeliveryEDate = null;
						
					%>
					
						<input class="info-title" id="oDeliveryEDate" name="oDeliveryEDate" value="" style="border:none" readonly>도착예정
						<%for(Product p : list) { %>
						<div class="odProduct">
						<div class="present-items-imggroup">
						<div class="odImage">
							<img
								src="<%=request.getContextPath() %>/upload/product/<%=p.getpImage1() %>"
								alt="상품이미지" class="items-img"
								style="width: 200px; height: 150px; margin:0px;">
								</div>
							<div class="present-items-img-text">
								<p class=preset-items-title>
									상품명:<span class="items-payitems"><%=p.getpName() %></span>
								</p>
								<p class="present-items-title">
									가격:<span class="items-payitems"><%=p.getpPrice() %><span>원</span>
								</p>
								<p class="present-items-title">
									수량:<input type="text" class="items-payitems" id="odQty" name="odQty" value="<%=p.getpCount() %>" style="border:none" readonly>개
								</p>
							</div>
						</div>

							<div class="totalPrice">
								<%int total = p.getpPrice()*p.getpCount();%>
								<p>
									총액 :<%=total %></p>
							</div>
						</div>
						
						<%
						oAmount++;
						} 
						
						/* String oAm = Integer.toString(oAmount); */
						%>
						<input type="hidden" name="oAmount" value="<%=oAmount %>" style="border:none" readonly>
					</div>
				</div>
			</div>  <!-- presentgroup그리드 나누는rj -->
				<!-- 할인및 포인트 적용 블록 -->
				<!-- <div class="present-section-group5">
					<div class="present-items-group5-5">
						<div class="present-items">
							할인 포인트및 할인 적용금액 자바스크립트
							<p>쿠폰 적용</p>

							<p class="right">
								<span>2000</span><span>원 할인쿠폰</span>
							</p>

						</div>
						<div class="present-items">
							<p>포인트적용</p>
							포인트적용후 차감되는 자바스크립트
							<p class="right">
								<span>0</span>point
							</p>
						</div>
					</div>
				</div> -->

				<div class="orderway">
					<!-- <p>결제수단 선택</p> -->
					<!-- 여기서 선택한 결제수단을 속성 pg의 값에 담기 -->
					<!-- <input type="text" name="oPayway" id="oPay" value=""> -->
					<input type="hidden" id="oPayway" name="oPayway" value="html5_inicis"> 
				</div>
			</div>








			<!-- 결제창 블록 && 큰 그리드 2 -->
			<div class="present-section-container-group2">
				<!-- 결제창 정보 block -->
				<div class="present-section-group3">
					<div class="present-items-group3-3">
						<div class="present-items-small-group"></div>
						<h3>결제 정보</h3>
						<div class="pay-items">
							<p class="pay-items-text-left middle">총상품금액</p>
							<%
                        	int alltotal =  0;
                        	for(Product p : list ){
                        		alltotal += (p.getpPrice()*p.getpCount());
                        	}
                        	
                        %>
							<p class="pay-items-text-right"><%=alltotal %><span>원</span>
							</p>

						</div>
						<div class="pay-items">
							<p class="pay-items-text-left middle">배송비</p>
							<p class="pay-items-text-right">
								3000<span>원</span>
							</p>

						</div>
						<!-- <div class="pay-items1">
							<h3>할인 금액</h3>
							<div class="pay-items-small">
								<div class="pay-items">
                                <p class="pay-items-text-left middle">상품할인</p>
                                <p class="pay-items-text-right">1000<span>원</span></p>

                            </div>
								<div class="pay-items">
									<p class="pay-items-text-left middle">쿠폰할인</p>
									<p class="pay-items-text-right">
										2000<span>원</span>
									</p>

								</div>

							</div>
						</div>
						<div class="pay-items">
							<p class="pay-items-text-left middle">포인트사용</p>
							<p class="pay-items-text-right">
								0<span class="middle">Point</span>
							</p>

						</div> -->


						<div class="pay-items">
							<p class="pay-items-text-left middle">결제 금액</p>
							<%int oPayment = alltotal+3000; %>
							<input class="pay-items-text-right" id="oPayment" name="oPayment" value="<%=oPayment %>" style="border:none" readonly/><span>원</span>
							

						</div>
						<div class="info-agreed">
							<label><input type="checkbox" class="info-agreed" id="agree" value="동의">이용약관에 동의합니다.</label>
							<textarea style="width: 500px; height: 250px; overflow: scroll">
							<p>개인정보및 배송지제출에 동의하시겠습니까?</p>
							개인정보의 보유 및 이용기간:
							 &nbsp;￭ 동의서 제출 후 5년까지 개인정보를 보유하고 이용합니다. 
							￭ 개인정보는 (재)강원랜드희망재단 폐광지역 사회적경제 지원사업에 한하여 사용됩니다.
							 &nbsp;개인정보 제공 동의 거부 및 제한사항
							  &nbsp;￭ 개인정보 제공 동의를 거부할 권리가 있습니다. 단, 개인정보 
									제공 동의 거부 시 사실확인 조회 어려움 발생 등으로 지원 
									대상자 선정 시 불이익을 받을 수 있습니다.
							 &nbsp;※ 제공된 개인정보의 이용을 거부하고자 할 경우에는 정정·삭제·
									파기를 요구할 수 있습니다.
							</textarea>
						</div>
						<div class="pay-button">
							<!-- 결제하기 버튼을 누르면, 1. 걸제 api실행
                    2. 카트에 담긴 데이터와 그와 연결된 product데이터와 위에 입력한 배송정보를 orders와 orderdetail에 insert -->
							<input type="button" id="pay" value="결제하기" class="pay-deside-button" style="width: 500px; height: 50px; justify-content: center; margin: 20px 0;background-color:#191970; color: #eee;">
							<input type="button" id="orderCheak" class="pay-deside-button" style="display:none; width: 500px; height: 50px; justify-content: center; margin: 20px 0;background-color:#191970; color: #eee;" onclick="fn_dd();" value="결제완료 확인">
						</div>
					</div>
				</div>
				<!-- 결제창block 끝 -->
			</div>
		</div>
		</form>
	</section>
</div>






<script>
//주소찾기 api
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
		};
		

	//주문완료!!!!!!!!!!!!!!!
	function fn_dd() {
		$("#order").submit();
	}

	$("#pay").click(function() {
		if ($('#oName').val() === '') {
			alert('주문자의 이름을 입력해주세요.')
			return false;
		}
		if ($("#oPhone").val() === '') {
			alert('주문자의 연락처를 입력해주세요.')
			return false;
		}
		if ($("#oPw").val() === '') {
			alert('주문비밀번호를 입력해주세요.')
			return false;
		}
		let pw = document.getElementById("oPw").value;
		let pwck = document.getElementById("oPwCheck").value;
		if (pw.trim() != pwck.trim()) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if ($('#oToName').val() === '') {
			alert('받는사람의 이름을 입력해주세요.')
			return false;
		}
		if ($('#oToPhone').val() === '') {
			alert('받는사람의 연락처를 입력해주세요.')
			return false;
		}
		if ($('#oAddress').val() === '') {
			alert('받는사람의 주소를 입력해주세요.')
			return false;
		}
		if ($('#oPay').val() === '') {
			alert('결제수단을 선택해주세요.')
			return false;
		}
		if($('#agree').is(":checked") == false){
			alert('이용약관에 동의해주세요.')
			return false;
		}
		IMP.request_pay({
			pg : 'html5_inicis', // 위에서 선택한 결제수단이 여기 값으로 들어와야함
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			/* name: $("#").val(), */
			amount : $("#oPayment").val(),
			/* buyer_email: 'iamport@siot.do', */
			buyer_name : $("#oName").val(),
			buyer_tel : $("#oPhone").val(),
		/* buyer_addr: $("#buyer_addr").val(),
		buyer_postcode: '123-456', */

		}, function(rsp) {
			if (rsp.success) {
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					url : "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
					type : 'POST',
					dataType : 'json',
					data : {
						imp_uid : rsp.imp_uid
					//기타 필요한 데이터가 있으면 추가 전달
					}
				}).done(function(data) {
					//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					if (everythings_fine) {
						var msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid;
						msg += '\결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;

						alert(msg);

						console.log();
					} else {
						var msg = '결제가 취소처리 되었습니다.';
						alert(msg);
						//[3] 아직 제대로 결제가 되지 않았습니다.
						//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					}
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;

				alert(msg);
				console.log(msg);
			}
		});
		$("#pay").css("display", "none");
		 $("#orderCheak").css("display","block")
	})
</script>

<%@ include file="/views/common/footer.jsp"%>