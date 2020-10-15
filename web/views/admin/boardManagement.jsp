<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, com.eol.qna.model.vo.Qna,  com.eol.qna.model.vo.Paging"%>

<%
	List<Qna> list = (List)request.getAttribute("list");
	Paging pg = (Paging)request.getAttribute("pg");
	
	int listCount = pg.getListCount();
	int currentPage = pg.getCurrentPage();
	int maxPage = pg.getMaxPage();
	int startPage = pg.getStartPage();
	int endPage = pg.getEndPage();
%> 

<style>
	.admin_request_list .paging{
		margin: 64px 0 0 0;
	}
	.paging span{
		display: inline-block;
		width: 40px;
		height: 40px;
		line-height: 40px;
	    margin: 0 -3px;
}
	}
	.paging span:hover{
		background: black;
		color: white;
		cursor: pointer;
	}
	#choosen{
		background: black;
		color: white;
		cursor: none;
	}
	.mypage_left h2:hover{
				background: black;
		color: white;
		cursor: pointer;
	}
	.admin_request {
    	margin-top: -40px;
   	    height: 400px;
}
	}
	.admin_request_list {
	    margin: 35px 0 30px 0;
	    border-top: 2px solid #202020;
	}
	.admin_request_list > .admin_list_form .head {
		    height: 30px;
    line-height: 30px;
    border-top: 1px solid;
    border-bottom: 1px solid;
    display: grid;
   	 	grid-template-columns: 49px 126px 285px 131px 99px;
    	text-align: center;
    	margin: 21px 0;
	
	}
	.answerContentBox{
	    display: grid;
   	 	grid-template-columns: 49px 126px 285px 131px 99px;
    	text-align: center;
    	margin: 21px 0;
	}
	.admin_request_list > .admin_list_form .answerBox{
	        display: grid;
    grid-template-columns: auto auto auto;
    text-align: center;
	}
	.answerBox .qna{
		background: beige;
	    height: 100px;
	    padding: 10px;
	    margin: 10px;
    grid-column: 1/4;
	}
	.answeranswer{
	   display: grid;
	    grid-template-columns: auto auto;
	    padding: 10px;
	
	}
	.title_nobottom{
	    margin-bottom: 50px;
    	padding-bottom: 5px;
	}
	#no{
	font-size: 12px;
       height: 22px;
       line-height: 22px;
       background: #f2f2f2;
       display: inline-block; /* height값 주려고 함 */
       margin-right: 15px;
       padding: 0 6px;
	}
	#yes{
	font-size: 12px;
       height: 22px;
       line-height: 22px;
       background: #000000;
       color: white;
       display: inline-block; /* height값 주려고 함 */
       margin-right: 15px;
       padding: 0 6px;
	}
</style>
   
    
    
<%@ include file="/views/common/header.jsp"%>
	
		<section class="container" style="height: 1000px;">
			<nav class="mypage_left">
				<h2>게시판관리</h2>
				<ul>
					<li class="">1:1문의</li>
					<li>상품문의</li>
					<li>공지사항</li>
				</ul>
			
			</nav>
			
			<div class="user_content_form_wrap">
				
				<div class="title_nobottom">
					<h1>1:1 문의</h1>
				</div>
				<div class="admin_request">
					<%if(list.isEmpty()) {%>
					<div class="_no">
						<figure>!</figure>
						<p>등록된 내역이 없습니다.</p>
					</div>
					<%} else {%>
					<div class="admin_request_list">
						<div class="admin_list_form">
							<div class="contentBox head">
								<span>상태</span>
								<span>카테고리</span>
								<span>제목</span>
								<span>작성자</span>
								<span>등록일</span>
							</div>
						</div>
                		<form id="target" action="<%=request.getContextPath()%>/answerEnroll">
						<%for(Qna q : list) {%>
						<div class="admin_list_form">
							<div class="answerContentBox">
								<input type="hidden" id="d" name="d" value="<%= q.getqNo()%>">
								<%if(q.getqStatus().equals("N")){ %>
									<span id="no">답변대기</span>
								<%} else { %>
									<span id="yes">답변완료</span>
								<%} %>
								<span><%=q.getqCategory() %></span>
								<span><%=q.getqTitle() %></span>
								<span><%=q.getmId() %></span>
								<span class="list"><%=q.getqRdate() %></span>
							</div>
							<div class="answerBox" style="display:none">
	                   			<div class="qna"><%=q.getqContent() %></div>
	                   			<div class="answeranswer">
		                   			<textarea style="width: 625px; height: 241px; word-break:break-all; resize:none; padding: 10px;" id="answer" name="answer"></textarea>
		                   			<input type="submit" class="activeBtn" style="padding: 0px; width: 47px;">
	                   			</div>
		                   	</div>
						<%} %>	
					<%} %>
							<div class="paging" align="center">
								<span onclick="location.href='<%= request.getContextPath()%>/adminQuestionList?currentPage=1'">&lt;&lt;</span>
								<span id="before" onclick="fn_before();">&lt;</span>
								<%for(int p = startPage; p <= endPage; p++) { %>
									<%if(p == currentPage) { %>
									<span id="choosen"><%= p %></span>
									<%} else { %>
										<span class="numBtn" onclick="location.href='<%= request.getContextPath()%>/adminQuestionList?currentPage=<%= p %>'"><%= p %></span>
									<%} %>
								<%} %>
								<span id="after" onclick="fn_after();">&gt;</span>
								<span onclick="location.href='<%= request.getContextPath()%>/adminQuestionList?currentPage=<%= endPage %>'">&gt;&gt;</span>
							</div>
						</div>
						</form>
					</div>
					
				</div>
			
			
			</div>
		</section>
		<script>
		
	$(function(){
		$(".activeBtn").click(function(){
			let d = $(this).parent().parent().prev().children().eq(0).val();
			let answer = $(this).prev().val();
			alert(d);
			alert(answer);
			$("#d").val(d);
			$("#answer").val(answer);
		})
	})
		
		
		function fn_before(){
			if(<%= currentPage %> <= 1) {
				return false;
			}
			location.href='<%= request.getContextPath()%>/adminQuestionList?currentPage=<%= currentPage - 1 %>';
		}
		function fn_after(){
			if(<%= currentPage == endPage %>){
				return false;
			}
			location.href='<%= request.getContextPath()%>/adminQuestionList?currentPage=<%= currentPage + 1 %>';
		}
		
<%-- 		function fn_answerEnroll(){
			location.href = "<%= request.getContextPath() %>/answerEnroll";
			
		}
 --%>		
		$(function(){
			   /* $('.list').click(function() {
			      $('.list').not($(this)).parents('.list_form').find('div:eq(1)').slideUp('fast');
			      $(this).parents('.list_form').find('div:eq(1)').slideToggle('fast');
			   }) */
		   $('.list').click(function() {
			   $(".list").not($(this)).parent().next().slideUp('fast');
		      $(this).parent().next().slideToggle('fast');
		   })
		   $('.delete').click(function(){
			   	let qNo = $(this).parent().prev().children().eq(0).text();
			   	console.log(qNo);
				let result = confirm("1:1 문의내역을 삭제하시겠습니까?");
				if(result == true) {
					$.ajax({
						url: "<%= request.getContextPath() %>/questionDelete",
						data: {"qNo":qNo},
						success: data => {
							if(data > 0) {
								alert('정상적으로 삭제되었습니다.');
								location.href="<%= request.getContextPath()%>/questionList"
							} else {
								alert('삭제에 실패하였습니다. 고객센터로 문의 바랍니다.');
							}
						}
					})
				}
		   })
		})
		</script>
		
		
<%@ include file="/views/common/footer.jsp"%>