<%@page import="oracle.net.aso.r"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page
	import="java.util.List,com.eol.review.model.vo.Review,com.eol.member.model.vo.Member"%>
	
<%@ include file="/views/mypage/common/mypagenav.jsp" %>
<%
	int rNo = (int)request.getAttribute("rNo");
	int odoNo = (int)request.getAttribute("odoNo");
	int odpNo = (int)request.getAttribute("odpNo");
	String pName = (String)request.getAttribute("pName");
	Member m= (Member)session.getAttribute("loginMember");
	List<Review> list2 = (List) request.getAttribute("list2");
	
	String rTitle="";
	String mImage="";
	String rContent="";
	
	for (int i = 0; i < list2.size(); i++) {
		if (rNo == list2.get(i).getrNo()) {
			rTitle = list2.get(i).getrTitle();
			mImage = list2.get(i).getmImage();
			rContent = list2.get(i).getrContent();
		}
	}
%>

<script>

$(".uploadImg").change(function(){
    if(this.files && this.files[0]){
        const reader =new FileReader;
        reader.onload = function(data){
            $(".select_img img").attr("src",data.target.result).width(200);
        }
        reader.readAsDataURL(this.files[0]);
    }
});
</script>

<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/review.css">
    <section id="reviewSection">
<%@ include file="/views/mypage/common/mypagenav.jsp" %>
	<div>
    <div id="reviewtitle">
    <h1 class="write-title">리뷰 수정하기</h1>
    </div>
    	
    
        <form class="writer--container" action="<%=request.getContextPath()%>/review/reviewUpdateEnd" method="post" enctype="multipart/form-data">
            <div class="writer-container-items">
                <dl>
                	<dd>
                		<input type="hidden" name="rNo" value="<%=rNo%>">
                	</dd>
                    <dd>
                        <input type="text" id="reviewTitle" style="height:30px;width:600px;" name="title" value="<%=rTitle%>" placeholder="<%=rTitle%>" required>
                    </dd>
                    <dd>
                        <input type="text" id="reviewPName" style="height:30px;width:600px;" name="pname" value=<%=pName%> required>
                    </dd>
                    <dd>
                        <label for="uploadImg">
                    </label>
                    <input type="file" name="upload" id="upload" value="<%=mImage%>">
                    <div class="select_img"><img src="" frameborder="0"></img></div>
                    </dd>
                    <dd>
                        <textarea resize="none" name="content" id="reviewContent" cols="90" rows="6" placeholder="<%=rContent%>" required></textarea>
                    </dd>
	            	<input type="submit" value="등록하기" style="border : none">  
                </dl>
            </div>
        </form>
	            <button  style="border : none; height:30px"  onclick="location.assign('<%=request.getContextPath()%>/review/reviewCanList')">뒤로가기</button>  
	</div>
    </section>
<%@ include file="/views/common/footer.jsp"%>