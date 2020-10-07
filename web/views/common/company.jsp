<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath() %>/css/admin.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<!-- section -->
    <section>

        <h1>회사소개  </h1>
        <div class="div-container">
            
            
            <div class="img">
                <img src="img\회사이미지.png" style="height: 300px; width:1200px;" alt="">
            </div>
            <div class="text">
                <p>1. Servlet에서 세션 사용하는 방법
        
                    doGet, doPost 메서드의 HttpServletRequest 파라미터에 대해 getSession 메서드를 호출.
                    
                    getSession 메서드는 javax.servlet.http.HttpSession 타입의 객체를 리턴 하므로
                    
                    
                    
                    - 세션 생성
                    
                    HttpSession session = request.getSession();
                    
                    session.setAttribute("ID", "abcd");
                    
                    * setAttribute 메서드는 같은 이름의 데이터가 이미 존재하면 새로운 값으로 저장하므로 수정도 같은 방법으로 처리
                    
                    
                    
                    - 세션 정보
                    
                    HttpSession session = request.getSession();
                    
                    String str = (String) session.getAttribute("ID");
                    
                    * 리턴 타입은 java.lang.Object이므로 데이터 본래의 타입으로 캐스트 연산을 해야 한다.
                    
                    
                    
                    - 세션 종료
                    
                    session.invalidate();
                    
                    
                    
                    
                    
                    2. JSP에서 세션 사용하는 방법
                    
                    JSP 에서는 session 내장 변수를 사용하면 됨.
                    
                    setAttribute, getAttribute, removeAttribute 메서드를 호출.
                    
                    
                    
                    - 세션 생성
                    
                    session.setAttribute("ID", "abcd");
                    
                    
                    
                    - 세션 정보
                    
                    session.getAttribute("ID");
                    
                    String str =  (String) session.getAttribute("ID");
                    
                    * 리턴 타입은 java.lang.Object이므로 데이터 본래의 타입으로 캐스트 연산을 해야 한다.
                    
                    
                    
                    - 세션 삭제
                    
                    session.removeAttribute("ID");</p>
            </div>

  </div>
    <div class="cotainer-group">

        <h2>구성원</h2>
        <picture class="cg">
            <div class="person">
                  <li><img src="img\곰돌이.jpg" alt="">박현우</li>    
                </div>
                <div class="person">
                    <li><img src="img\어피치.jpg" alt="">이요셉</li>
            </div>
            <div class="person">
                <li><img src="img\여행.png" alt="">이하영</li>
            </div>
            <div class="person">
                <li><img src="img\ori.jpg" alt="">이윤나</li>
            </div>
            <div class="person">
                <li><img src="img\라이언.jpg" alt="">이지훈</li>
            </div>
            
        </picture>
        <div class="group">
                <h2>단체사진</h2>
                <li><img src="img\단체사진.jpg" alt="" style="width: 1200px;height:300px;">팀원구성중</li>
        </div>


    </div>
    
    </section>
<%@ include file="/views/common/footer.jsp"%>