<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/menu.css">
<%@ include file="/views/common/header.jsp" %>

	<script>
    $("#uploadImg").change(function(){
        if(this.files && this.files[0]){
            const reader =new FileReader;
            reader.onload = function(data){
                $(".select_img img").attr("src",data.target.result).width(200);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });

</script>
<body>
<section class="product-resiter">
    <h1>상품등록</h1>
    <form action="<%=request.getContextPath() %>/product/productWrite" method="post" class="product-resiter-container" ectype="Multipart/form-data">
       <ol>
           <li>상품이름:<input type="text"required name="pName" value=""></li>
           <li>상품가격:<input type="text" name="pPrice" value="">원</li>
           <li>할인 률:<input type="text" name="pDiscount" value="">%</li>
           <li>상품갯수:<input type="text" name="pStock" value="">개</li>
           <li>인분수:<input type="text"  name="pServing" value="" placeholder="예)10">분</li>
           <li>조리시간:<input type="text" name="pCooktime" value="" placeholder="예)10">분</li>
           <li>준비시간:<input type="text"  name="pReadytime" value="" placeholder="예)10">분</li>
           <li>맛:<input type="text" name="pTaste" value="" placeholder="예)1:보통 2: 약간 3:중간 4:매우 숫자로표기"></li>
           <li>상품타이틀:<input type="text" name="pDetailmain" value="" placeholer="예)부채살스테이크"></li>
       </ol>
       <ol class="file-items">
                               
                    <li class="file--container">
                    <label for="uploadImg">
                        이미지 
                    </label>
                    <input type="file" name="pImage1" id="uploadImg" value="">
                    <div class="select_img"><img src="" frameborder="0"></img></div>
                </li>
                <li class="file--container">
                    <label for="uploadImg">
                        이미지 
                    </label>
                    <input type="file" name="pImage2" id="uploadImg" value="">
                    <div><img src="" frameborder="0"></img></div>
            </li>
            <li class="file--container">
                <label for="uploadImg">
                    이미지 
                </label>
                <input type="file" name="pImage3" id="uploadImg" value="">
                <div><img src="" frameborder="0"></img></div>
            </li>
            <li class="file--container">
                <label for="uploadImg">
                비디오
                </label>
                <input type="file" name="pVideo" id="uploadImg" value="">
                <div><img src="" frameborder="0"></img></div>
            </li>
         </ol>

    <ol class="file-items">

        <li class="file--container">
            <label for="uploadImg">
               상품이미지1
            </label>
            <input type="file" name="pDetailImage1" id="uploadImg" value="">
            <div><img src="" frameborder="0"></img></div>
      </li>
      <li class="file--container">
        <label for="uploadImg">
            상품이미2 
        </label>
        <input type="file" name="pDetailImage2" id="uploadImg" value="">
        <div><img src="" frameborder="0"></img></div>
    </li>
    <li class="file--container">
        <label for="uploadImg">
            상품이미지3
        </label>
        <input type="file" name="pDetailImage3" id="uploadImg" value="">
        <div><img src="" frameborder="0"></img></div>
    </li>
    </ol>
       <ol class="file-items">
           <li>

        </li>
        
        <li>
            상세설명 타이틀1:<input type="text" name="pDetailTitle1">상세설명1
               <textarea value="" name="pDetailContent1" id="productInfo" cols="20" rows="5"></textarea>
            </li>
            상세설명 타이틀2:<input type="text" name="pDetailTitle2">
           <li>상세설명2
               <textarea value="" name="pDetailContent2" id="productInfo" cols="20" rows="5"></textarea>
            </li>
        </ol>
        <ul class="file-items1">
            
         
            
            <li class="file--container1">
                <label for="uploadImg">
                   레시피 이미지1
                </label>
                <input type="file" name="pRecipeImage1" id="uploadImg">
                <div><img src="" frameborder="0"></img></div>
                <p>레시피설명1
                    <textarea value="" name="pRecipeContent1" id="productInfo2" cols="20" rows="3"></textarea>
               </p>
          </li> 
            <li class="file--container1">
                <label for="uploadImg">
                   레시피 이미지2 
                </label>
                <input type="file" name="pRecipeImage2" id="uploadImg">
                <div><img src="" frameborder="0"></img></div>
                <p>레시피설명2
                    <textarea value="" name="pRecipeContent2" id="productInfo2" cols="20" rows="3"></textarea>
               </p>
          </li> 
            <li class="file--container1">
                <label for="uploadImg">
                   레시피 이미지3 
                </label>
                <input type="file" name="pRecipeImage3" id="uploadImg">
                <div><img src="" frameborder="0"></img></div>
                <p>레시피설명3
                    <textarea value="" name="pRecipeContent3" id="productInfo2" cols="20" rows="3"></textarea>
               </p>
          </li> 
            <li class="file--container1">
                <label for="uploadImg">
                   레시피 이미지4 
                </label>
                <input type="file" name="pRecipeImage4" id="uploadImg">
                <div><img src="" frameborder="0"></img></div>
                <p>레시피설명4
                    <textarea value="" name="pRecipeContent4" id="productInfo2" cols="20" rows="3"></textarea>
               </p>
          </li> 
        

       </ul>
       <div class="product-btn-box">
           <button type="submit" class="product-register">등록</button>
           <button type="submit" class="product-register">수정</button>
           <button type="submit" class="product-register">삭제</button>

       </div>


    </form>
    

</section>
<%@ include file="/views/common/footer.jsp" %>
