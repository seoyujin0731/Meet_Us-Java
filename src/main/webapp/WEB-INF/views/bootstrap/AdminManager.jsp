<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!--    로그인 성공시 이동하는 주소 등록 -> spring 시큐리티 조건 -->
   <link rel="stylesheet" type="text/css" href="<c:url value="/"/>">
<title>Meet us</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<!-- 주소 값 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 카카오 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<body onload="document.f.username.focus();">

   <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/happy.jpg');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div
         class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">Admin page</h1>
            <p class="breadcrumbs">
               <span class="mr-2"> <a href="../">Home <i class="ion-ios-arrow-forward"></i></a>
               </span> 
            </p>
         </div>
      </div>
   </div>
   </section>

   <section class="ftco-section" style="padding: 2em 0;">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-md-12 heading-section text-center ftco-animate">
            <span class="subheading">Meet Us</span>
            <p class="jg" style="font-size: 30px;">AdminPage</p>
         </div>
      </div>
      <div class="row"></div>
   </div>
   </section>

    <section>
         <div class="container">
           
            
            <div class="about-author d-flex p-4 bg-light" style="margin-top:3rem;">
              <div class="desc" style="width:100%;">
               <div class="comment-form-wrap ">
                <h2><strong>My Meeting</strong></h2>
                
                <div class="card" style="padding:1rem; float:left; width:48%;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">User</h4>
                <hr style="margin:0;">
                 
                <c:forEach var="user" items="${user}">
	                <p style="margin-bottom:0;">${user.user_id }<a href='/이름을 넣으세요~~~~~~~~~제시점?user_name=${user.user_name }' class="tag-cloud-link jg" style="background:#e2c0bb; color:white; width:6rem;height:1.3rem;  font-size:14px; float:right;">아이디 비활성</a></p>
	                <p style="margin-top:1%; margin-bottom:1%;">${user.user_name } <a style="float:right;">${user.user_email }</a> </p>
	                <hr style="margin:0;">
                </c:forEach>
                
                </div>
             
                <div class="card" style="padding:1rem; float:left; width:48%; margin-left: 4%;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">Team</h4>
                <hr style="margin:0;"> 
                  
                <c:forEach var="team" items="${team}">
	                <p style="margin-bottom:0;">${team.MB_WRITER }</p>
	                <p style="margin-top:1%; margin-bottom:1%;">${team.MB_TITLE }</p>
	                <hr style="margin:0;">
                </c:forEach>
                
                
                </div>
                
              </div>
            </div>
            </div>
            
             <div class="about-author d-flex p-4 bg-light" style="border: 1px solid; border-color:#e2c0bb; margin-top:3rem; margin-bottom:3rem;">
              <div class="desc" style="width:100%;">
               <div class="comment-form-wrap ">
                <h2><strong>Message sent to the admin</strong></h2>
                <div class="card" style="padding:1rem; float:left; width:48%;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">보낸 Massage</h4>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">From Date : 2019-10-12</p>
                <p style="margin-top:1%; margin-bottom:1%;">map에 주소 더 많이 넣게 해주세요.</p>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">From Date : 2019-10-12</p>
                <p style="margin-top:1%; margin-bottom:1%;">감사합니다.</p>
                <hr style="margin:0;">
                </div>
                
                <div class="card" style="padding:1rem; float:left; width:48%; margin-left: 4%;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">받은 메세지</h4>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">To Date : 2019-10-13</p>
                <p style="margin-top:1%; margin-bottom:1%;">(Re):map에 주소 더 많이 넣게 해주세요.</p>
                <hr style="margin:0;">
                </div>
              </div>
            </div>
            </div>
           </div>
   </section>
   
   

</body>

</html>