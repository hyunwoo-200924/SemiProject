<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/cart.css">   
<%@ include file="/views/common/header.jsp"%>

	  <!-- section -->
    
    <section class="taste-section-container">
        <!-- 사용자 이름대신 아이디또는 사용자 이름 나오게 h2 title에 -->
        <h2 class="taste-text"><span>사용자</span>님의 맛 취향!</h2>
        <form class="taste-section-container-group">
            <div class="">
                <!-- spicy -->
                <ol class="mytaste-items-group">
                    <li>매운맛!---
                        <ol class="mytaste-items">
                            <li class="taste-li"><input  name="spicy" type="radio"class="taste-check">좋아하지않음!</li>
                            <li class="taste-li"><input name="spicy" type="radio" class="taste-check">약간매운맛!</li>
                            <li class="taste-li"><input  name="spicy" type="radio" class="taste-check">중간 매운맛!</li>
                            <li class="taste-li"><input name="spicy" type="radio" class="taste-check">매우 매운맛!</li>
                        </ol>    
                    </li>
                  
                </ol>
            </div>
            <div class="">

                <ol class="mytaste-items-group">
                    <!-- source -->
                    <li>새콤한맛!---
                        <ol class="mytaste-items">
                            <li class="taste-li"><input name="source" type="radio" class="taste-check">좋아하지않음</li>
                            <li class="taste-li"><input name="source" type="radio" class="taste-check">약간새콤한맛!</li>
                            <li class="taste-li"><input name="source" type="radio" class="taste-check">중간 새콤한맛!</li>
                            <li class="taste-li"><input name="source" type="radio" class="taste-check">매우 새콤한맛!</li>
                        </ol>    
                    </li>
                  
                </ol>
            </div>
            <div class="">
                <ol class="mytaste-items-group">
                    <!-- light -->
                    <li>담백한맛!---
                        <ol class="mytaste-items">
                            <li class="taste-li"><input name="light" type="radio" class="taste-check">좋아하지않음!</li>
                            <li class="taste-li"><input name="light" type="radio" class="taste-check">약간담백한맛!</li>
                            <li class="taste-li"><input name="light" type="radio" class="taste-check">중간담백한맛!</li>
                            <li class="taste-li"><input name="light" type="radio" class="taste-check">매우 담백한맛!</li>
                        </ol>    
                    </li>
                  
                </ol>
            </div>
            <div class="">
                <ol class="mytaste-items-group">
                    <!-- sweety -->
                    <li>단 맛!---
                        <ol class="mytaste-items">
                            <li class="taste-li"><input name="sweety" type="radio" class="taste-check">좋아하지않음!</li>
                            <li class="taste-li"><input name="sweety" type="radio" class="taste-check">약간 단맛!</li>
                            <li class="taste-li"><input name="sweety"type="radio" class="taste-check">중간 단맛!</li>
                            <li class="taste-li"><input name="sweety" type="radio" class="taste-check">매우 단맛!</li>
                        </ol>    
                    </li>
                  
                </ol>
            </div>
            <div class="">
                <ol class="mytaste-items-group">
                    <!-- oily -->
                    <li>느끼한맛!---
                        <ol class="mytaste-items">
                            <li class="taste-li"><input name="dily" type="radio" class="taste-check">좋아하지않음!</li>
                            <li class="taste-li"><input  name="oily" type="radio" class="taste-check">약간 느끼한맛!</li>
                            <li class="taste-li"><input  name="oily" type="radio" class="taste-check">중간 느끼한맛!</li>
                            <li class="taste-li"><input  name="oily" type="radio" class="taste-check">매우 느끼한맛!</li>
                        </ol>    
                    </li>
                  
                </ol>
            </div>
            <!-- 맛대맛취향 체크후 반영되게해야함 버튼 눌르면 저장 -->
            <div class="taste-container-child">
                <button class="taste-reviews-btn " type="submit" onclick="mytasteLike()"> 등록</button>
                <button class="taste-reviews-btn " type="submit" onclick="mytasteLike()"> 취소</button>
               
            </div>
        </form>
    </section>
    

<%@ include file="/views/common/footer.jsp" %>