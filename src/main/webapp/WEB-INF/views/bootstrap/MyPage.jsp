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
            <h1 class="mb-3 bread">MyPage</h1>
            <p class="breadcrumbs">
               <span class="mr-2"> <a href="../">Home <i class="ion-ios-arrow-forward"></i></a>
               </span> <span class="mr-2">MyPage <i class="ion-ios-arrow-forward"></i>
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
            <p class="jg" style="font-size: 30px;">MyPage</p>
         </div>
      </div>
      <div class="row"></div>
   </div>
   </section>

    <section>
         <div class="container">
             <div class="about-author d-flex p-4 bg-light" style="border: 1px solid; border-color:#e2c0bb;">
              <div class="bio mr-5" style="width:30%;">
                <img src="resources/images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4">
              </div>
              <div class="desc" style="width:60%;">
               <div class="comment-form-wrap ">
                <h3><strong>My Information</strong></h3>
                <hr>
                <p>My Id :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dldrjsdn1</p>
                <hr>
                <p>My Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;watby</p>
                <hr>
                <p>My Age :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;25</p>
                <hr>
                <p>My Gender :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 남자</p>
                <hr>
              </div>
              	<div class="tagcloud">
						<a href="#" class="tag-cloud-link jg" style="background:#e2c0bb; color:white; float:right; width:6rem; height:2rem; font-size:14px;">내 정보 수정</a>
 				</div>
            </div>
            </div>
            
            <div class="about-author d-flex p-4 bg-light" style="border: 1px solid; border-color:#e2c0bb; margin-top:3rem;">
              <div class="desc" style="width:100%;">
               <div class="comment-form-wrap ">
                <h2><strong>My Meeting</strong></h2>
                <div class="card" style="padding:1rem;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">내가 만든 Meeting</h4>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">Meeting Date : 2019-10-12</p>
                <p style="margin-top:1%; margin-bottom:1%;">시험공부 같이하실분 :)</p>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">Meeting Date : 2019-10-12</p>
                <p style="margin-top:1%; margin-bottom:1%;">시험공부 같이하실분 :)</p>
                <hr style="margin:0;">
                </div>
                
                <div class="card" style="padding:1rem; margin-top:2rem;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">내가 참가한 Meeting</h4>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">Meeting Date : 2019-10-16</p>
                <p style="margin-top:1%; margin-bottom:1%;">홍대 교수 곱창으로 모여라</p>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">Meeting Date : 2019-11-12</p>
                <p style="margin-top:1%; margin-bottom:1%;">java spring study</p>
                <hr style="margin:0;">
                </div>
                
              </div>
            </div>
            </div>
            
             <div class="about-author d-flex p-4 bg-light" style="border: 1px solid; border-color:#e2c0bb; margin-top:3rem; margin-bottom:3rem;">
              <div class="desc" style="width:100%;">
               <div class="comment-form-wrap ">
                <h2><strong>Message sent to the admin</strong></h2>
                <div class="card" style="padding:1rem;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">보낸 Massage</h4>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">From Date : 2019-10-12</p>
                <p style="margin-top:1%; margin-bottom:1%;">map에 주소 더 많이 넣게 해주세요.</p>
                <hr style="margin:0;">
                <p style="margin-bottom:0;">From Date : 2019-10-12</p>
                <p style="margin-top:1%; margin-bottom:1%;">감사합니다.</p>
                <hr style="margin:0;">
                </div>
                
                <div class="card" style="padding:1rem; margin-top:2rem;">
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
<script type="text/javascript">
   function selectS(){
      location.href="${pageContext.request.contextPath}bootstrap/selectSocial";
   }

   
   function userLogin(){
      var form = document.loginUser;
      let user_id = $('#user_id').val();
      let user_password = $('#user_password').val();
      let count = 0;
      
   
      
      if(user_id.length==0){
         $("#id_check").text("비었어요 : (");
          $("#id_check").css("color", "red");
          $("#reg_submit").attr("disabled", true);
          count++;
      }
      
      if(user_password.length==0){
         $("#pw_check").text("비었어요 : (");
          $("#pw_check").css("color", "red");
          $("#reg_submit").attr("disabled", true);
          count++;
      }

      
      if(count != 0 ){
         return;
      }
      form.submit();
   }
   
   
   
   
</script>

</html>