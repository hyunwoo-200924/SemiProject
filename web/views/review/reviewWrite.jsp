<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/review.css">
    <section class="section-writer-container">
    <h1 class="write-title">리뷰 작성하기</h1>
        <form class="writer--container" action="<%=request.getContextPath()%>/review/reviewWrite" method="post"
        enctype="multipart/form-data">
            <div class="writer-container-items">
                <dl>
                    <dd>
                        제목:<input type="text" style="height:30px;width:400px;" name="title" required>
                    </dd>
                    <dd>
                        작성자:<input type="text" style="height:30px;width:400px;" name="writer" value="" readonly>
                    </dd>
                    <dd>
                        파일명:<input type="file" style="height:30px;width:400px;" name="upload" >
                      
                        <button type="submit" style="height:40px;width:100px;">파일등록하기</button>
                    </dd>
                    <dd>
                         <textarea name="content" id="" cols="30" rows="6" placeholder="내용을 작성하세요."></textarea>
                    </dd>
                </dl>
            </div>   
         
        </form>
        <div class="btn-group">
            <button type="submit" name="등록하기" id="updateBtn-write" class="btn">등록하기 </button>  
            </div>

    </section>
<%@ include file="/views/common/footer.jsp"%> --%>