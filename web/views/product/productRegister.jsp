<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/menu.css">
<%@ include file="/views/common/header.jsp" %>


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

    //상품 등록 유효성 검사
    $(document).ready(function(){
    	$("addProduct").click(function(){
    		const pName= $("#pName").val();
    		const pPrice= $("#pPrice").val();
    		const pDiscount=$("#pDiscount").val();
    		const pStock= $("#pStock").val();
    		const pServing= $("#pServing").val();
    		const pCooktime= $("#pCooktime").val();
    		const pCooktime=$("#pReadytime").val();
    		
    		const pTaste=$("#pTaste").val();
    		const pImage1=$("#pImage1").val();
    		const pImage2=$("#pImage2").val();
    		const pImage3=$("#pImage3").val();
    		const pVideo=$("#pVideo").val();
    		
    		const pDetailImage1=$("#pDetailImage1").val();
    		const pDetailImage2=$("#pDetailImage2").val();
    		const pDetailImage3=$("#pDetailImage3").val();
    		const pDetailTitle1=$("#pDetailTitle1").val();
    		const pDetailTitle2=$("#pDetailTitle2").val();
    		
    		const pRecipeImage1=$("#pRecipeImage1").val();
    		const pRecipeImage2=$("#pRecipeImage2").val();
    		const pRecipeImage3=$("#pRecipeImage3").val();
    		const pRecipeImage4=$("#pRecipeImage4").val();
    		
    		const pRecipeContent1=$("#pRecipeContent1").val();
    		const pRecipeContent2=$("#pRecipeContent2").val();
    		const pRecipeContent3=$("#pRecipeContent3").val();
    		const pRecipeContent4=$("#pRecipeContent4").val();
    		
    		if(pName==""){
    			alert("상품명을 입력해주세요");
    			pName.focus();
    		}else if(pPrice==""){
    			alert("상품가격을 입력해주세요");
    			pPrice.focus();
    		}else if(pDiscount){
    			alert("할인률을 입력해주세요");
    			pDiscount.focus();
    		}else if(pStock){
    			alert("상품갯수을 입력해주세요");
    			pStock.focus();
    		}else if(pServing==""){
    			alert("몇인분인지  입력해주세요");
    			pServing.focus();
    		}else if(pCooktime==""){
    			alert("조리시간을 입력해주세요");
    			pCooktime.focus();
    		}else if(pReadytime==""){
    			alert("준비시간을 입력해주세요");
    			pReadytime.focus();
    		}else if(pTaste==""){
    			alert("보통 :1 약간 :2 중간:3 많이 :4 로표기해주세요");
    			pTaste.focus();
    		}else if(pImage1==""){
    			alert("이미지1에 파일을 선택을해주세요");
    			pImage1.focus();
    		}else if(pImage2==""){
    			alert("이미지2에 파일을 선택을해주세요");
    			pImage2.focus();
    		}else if(pImage3==""){
    			alert("이미지3에 파일을 선택을해주세요");
    			pImage3.focus();
    		}else if(pVideo==""){
    			alert("비디오에 mp또는 avi파일을 선택을해주세요");
    			pVideo.focus();
    		}else if(pDetailImage1==""){
    			alert("디테일이미지1에 파일을 선택을해주세요");
    			pDetailImage1.focus();
    		}else if(pDetailImage2==""){
    			alert("디테일이미지2에 파일을 선택을해주세요");
    			pDetailImage2.focus();
    		}else if(pDetailImage3==""){
    			alert("디테일이미지3에 파일을 선택을해주세요");
    			pDetailImage3.focus();
    		}else if(pDetailTitle1==""){
    			alert("디테일타이틀1을 적어주세요");
    			pDetailTitle1.focus();
    		}else if(pDetailTitle2==""){
    			alert("디테일타이틀2을 적어주세요");
    			pDetailTitle2.focus();
    		}else if(pDetailmain==""){
    			alert("상품가격메인타이틀을 적어주세요");
    			pDetailmain.focus();
    		}else if(pDetailcontent1==""){
    			alert("상품상세설명1을 적어주세요");
    			pDetailcontent1.focus();
    		}else if(pDetailcontent2==""){
    			alert("상품상세설명2을 적어주세요");
    			pDetailcontent2.focus();
    		}else if(pRecipeImage1==""){
    			alert("상품레시피이미지파일1 선택해주세요");
    			pRecipeImage1.focus();
    		}else if(pRecipeImage2==""){
    			alert("상품레시피이미지파일2 선택해주세요");
    			pRecipeImage2.focus();
    		}else if(pRecipeImage3==""){
    			alert("상품레시피이미지파일3 선택해주세요");
    			pRecipeImage3.focus();
    		}else if(pRecipeImage4==""){
    			alert("상품레시피이미지파일4 선택해주세요");
    			pRecipeImage4.focus();
    		}
    		//상풍정보전송
     		document.form.action="<%=request.getContextPath()%>/product/productWriteEnd";
    		document.form.submit();
    	});
    	//상품목록이동
    	$("#gotoMenu").click(function(){
    		location.href="<%=request.getContextPath()%>/product/productList.jsp";
    	})
    		
    	}
    }
</script>
<body>
<section class="product-resiter">
    <h1>상품등록</h1>
    <form id="form" name="form" action="<%=request.getContextPath() %>/product/productWriteEnd" method="post" class="product-resiter-container" enctype="multipart/form-data">
       <ol>
           <li>상품이름:<input type="text"required name="pName" value="" id="pName"></li>
           <li>상품가격:<input type="text" name="pPrice" value="" id="pPrice">원</li>
           <li>할인 률:<input type="text" name="pDiscount" value="" id="pDiscount">%</li>
           <li>상품갯수:<input type="text" name="pStock" value="" id="pStock">개</li>
           <li>인분수:<input type="text"  name="pServing" value="" id="pServing" placeholder="예)10">분</li>
           <li>조리시간:<input type="text" name="pCooktime" value="" id="pCooktime" placeholder="예)10">분</li>
           <li>준비시간:<input type="text"  name="pReadytime" value="" id="pReadytime" placeholder="예)10">분</li>
           <li>맛:<input type="text" name="pTaste" value="" id="pTaste" placeholder="예)1:보통 2: 약간 3:중간 4:매우 숫자로표기"></li>
           <li>상품타이틀:<input type="text" name="pDetailMain" value="" id="pDetailMain" placeholer="예)부채살스테이크"></li>
       </ol>
       <ol class="file-items">
                               
                    <li class="file--container">
                    <label for="uploadImg">
                        이미지 
                    </label>
                    <input type="file" name="pImage1" id="pImage1" value="">
                    <div class="select_img"><img src="" frameborder="0"></img></div>
                </li>
                <li class="file--container">
                    <label for="uploadImg">
                        이미지 
                    </label>
                    <input type="file" name="pImage2" id="pImage2" value="">
                    <div><img src="" frameborder="0"></img></div>
            </li>
            <li class="file--container">
                <label for="uploadImg">
                    이미지 
                </label>
                <input type="file" name="pImage3" id="pImage3" value="">
                <div><img src="" frameborder="0"></img></div>
            </li>
            <li class="file--container">
                <label for="uploadImg">
                비디오
                </label>
                <input type="file" name="pVideo" id="pVideo" value="">
                <div><img src="" frameborder="0"></img></div>
            </li>
         </ol>

    <ol class="file-items">

        <li class="file--container">
            <label for="uploadImg">
               상품이미지1
            </label>
            <input type="file" name="pDetailImage1" id="pDetailImage1" value="">
            <div><img src="" frameborder="0"></img></div>
      </li>
      <li class="file--container">
        <label for="uploadImg">
            상품이미지2 
        </label>
        <input type="file" name="pDetailImage2" id="pDetailImage2" value="">
        <div><img src="" frameborder="0"></img></div>
    </li>
    <li class="file--container">
        <label for="uploadImg">
            상품이미지3
        </label>
        <input type="file" name="pDetailImage3" id="pDetailImage3" value="">
        <div><img src="" frameborder="0"></img></div>
    </li>
    </ol>
       <ol class="file-items">
           <li>

        </li>
        
        <li>
            상세설명 타이틀1:<input type="text" name="pDetailTitle1" id="pDetailTitle1">상세설명1
               <textarea value="" name="pDetailContent1" id="pDetailContent1" cols="20" rows="5"></textarea>
            </li>
            상세설명 타이틀2:<input type="text" name="pDetailTitle2" id="pDetailTitle2">
           <li>상세설명2
               <textarea value="" name="pDetailContent2" id="pDetailContent2" cols="20" rows="5"></textarea>
            </li>
        </ol>
        <ul class="file-items1">
            
         
            
            <li class="file--container1">
                <label for="uploadImg">
                   레시피 이미지1
                </label>
                <input type="file" name="pRecipeImage1" id="pRecipeImage1">
                <div><img src="" frameborder="0"></img></div>
                <p>레시피설명1
                    <textarea value="" name="pRecipeContent1" id="pRecipeContent1" cols="20" rows="3"></textarea>
               </p>
          </li> 
            <li class="file--container1">
                <label for="uploadImg">
                   레시피 이미지2 
                </label>
                <input type="file" name="pRecipeImage2" id="pRecipeImage2">
                <div><img src="" frameborder="0"></img></div>
                <p>레시피설명2
                    <textarea value="" name="pRecipeContent2" id="pRecipeContent2" cols="20" rows="3"></textarea>
               </p>
          </li> 
            <li class="file--container1">
                <label for="uploadImg">
                   레시피 이미지3 
                </label>
                <input type="file" name="pRecipeImage3" id="pRecipeImage3">
                <div><img src="" frameborder="0"></img></div>
                <p>레시피설명3
                    <textarea value="" name="pRecipeContent3" id="pRecipeContent3" cols="20" rows="3"></textarea>
               </p>
          </li> 
            <li class="file--container1">
                <label for="uploadImg">
                   레시피 이미지4 
                </label>
                <input type="file" name="pRecipeImage4" id="pRecipeImage4">
                <div><img src="" frameborder="0"></img></div>
                <p>레시피설명4
                    <textarea value="" name="pRecipeContent4" id="pRecipeContent4" cols="20" rows="3"></textarea>
               </p>
          </li> 
        

       </ul>
       <div class="product-btn-box">
           <button type="submit" class="product-register" id="addProduct">등록</button>
           <button type="submit" class="product-register" id="gotoMenu">목록</button>

       </div>


    </form>
    

</section>
<%@ include file="/views/common/footer.jsp" %>
