<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page
	import="java.util.List,com.eol.review.model.vo.Review,com.eol.member.model.vo.Member"%>
<%
	int odoNo = (int)request.getAttribute("odoNo");
	int odpNo = (int)request.getAttribute("odpNo");
	String pName = (String)request.getAttribute("pName");
	Member m= (Member)session.getAttribute("loginMember");
%>
<script>
$('#star_grade a').click(function(){
    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
    return false;
});
</script>

<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>

<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/review.css">
    <section class="section-writer-container">
    <h1 class="write-title">리뷰 작성하기</h1>
        <form class="writer--container" action="<%=request.getContextPath()%>/review/reviewWriteEnd?odoNo=<%=odoNo%>&odpNo=<%=odpNo%>&pName=<%=pName%>" method="post" enctype="multipart/form-data">
            <div class="writer-container-items">
                <dl>
                    <dd>
                        제목:<input type="text" id="reviewTitle" style="height:30px;width:400px;" name="title" required>
                    </dd>
                    <dd>
                        상품명:<input type="text" id="reviewPName" style="height:30px;width:400px;" name="pname" value=<%=pName%> required>
                    </dd>
                    <%-- <dd>
                        작성자:<input type="text" id="reviewWriter"style="height:30px;width:400px;" name="reviewWriter" value=<%=m.getmName()%>>
                    </dd> --%>
                    <dd>
                        파일명:<input type="file" id="file" style="height:30px;width:400px;" name="upload" >
               자바 별점         <button type="submit" style="height:40px;width:100px;">파일등록하기</button>
                    </dd>
                    <dd>
                        내용:<textarea name="content" id="reviewContent" cols="30" rows="6" placeholder="내용을 작성하세요."></textarea>
                    </dd>
                </dl>
            </div>
	            
			<p id="star_grade">
        <a href="#">★</a>
        <a href="#">★</a>
        <a href="#">★</a>
        <a href="#">★</a>
        <a href="#">★</a>
</p>


         	<div class="btn-group">
            <input type="submit" value="등록하기" id="updateBtn-write" class="btn">  
            </div>
        </form>

    </section>
<%@ include file="/views/common/footer.jsp"%>