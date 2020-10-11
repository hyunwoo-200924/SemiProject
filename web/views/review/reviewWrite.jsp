<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/review.css">
    <section class="section-writer-container">
    <h1 class="write-title">리뷰 작성하기</h1>
        <form class="writer--container" action="<%=request.getContextPath()%>/review/reviewWriteEnd" method="post" enctype="multipart/form-data">
            <div class="writer-container-items">
                <dl>
                    <dd>
                        제목:<input type="text" id="reviewTitle" style="height:30px;width:400px;" name="title" required>
                    </dd>
                    <!-- <dd>
                        작성자:<input type="text" id="reviewWriter"style="height:30px;width:400px;" name="reviewWriter" value="현우 " readonly>
                    <input type="hidden" name="mNo" value="현우">
                    </dd> -->
                    <dd>
                        파일명:<input type="file" id="file" style="height:30px;width:400px;" name="upload" >
                        <button type="submit" style="height:40px;width:100px;">파일등록하기</button>
                    </dd>
                    <dd>
                        내용:<textarea name="content" id="reviewContent" cols="30" rows="6" placeholder="내용을 작성하세요."></textarea>
                    </dd>
                </dl>
            </div>   
         	<div class="btn-group">
            <input type="submit" value="등록하기" id="updateBtn-write" class="btn">  
            </div>
        </form>

    </section>
<%@ include file="/views/common/footer.jsp"%>