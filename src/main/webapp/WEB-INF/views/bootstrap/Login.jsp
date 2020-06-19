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

   <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/welcome.jpg');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div
         class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">Login&nbsp</h1>
            <p class="breadcrumbs">
               <span class="mr-2"> <a href="../">Home <i class="ion-ios-arrow-forward"></i></a>
               </span> <span class="mr-2">Login <i class="ion-ios-arrow-forward"></i>
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
            <p class="jg" style="font-size: 30px;">로그인</p>
         </div>
      </div>
      <div class="row"></div>
   </div>
   </section>

    <section>
         <div class="container">

      <div class="comment-form-wrap ftco-animate">
         
         <div class="col-md-12">
         
            <form class="form-signin" action="/login" method="post" name="loginUser">
               <div class="col-lg align-items-end" >
                  <div class="form-group">
                     <div class="form-field"style="text-align: center; padding-bottom:10px;">
<!--                         <div class="icon"> -->
<!--                            <span class="ion-ios-search"></span> -->
<!--                         </div> -->
                        <input type="text" style="width: 300px; display: inline;" class="form-control" id="user_id" name="user_id" placeholder="ID" autocomplete="off" >
                           <div class="check_font" id="id_check"></div>
                     </div>
                  </div>
               </div>
               
            <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
               
               <div class="col-lg align-items-end">
                  <div class="form-group">
                     <div class="form-field" style="text-align: center;">
<!--                         <div class="icon"> -->
<!--                            <span class="ion-ios-calendar"></span> -->
<!--                         </div> -->
                        <input type="password" style="width: 300px; display: inline;" class="form-control checkin_date" id="user_password" name="user_password" placeholder="Password" autocomplete="off">
                         <div class="check_font" id="pw_check"></div>
                     </div>
                  </div>
               </div>
               <br>
               <div class="col-lg align-self-end">
                  <div class="form-group" style="text-align: center; padding-bottom:10px;">
                     <div class="form-field">
<!--                         <input type="submit" style="width: 300px; display: inline;" value="Login" class="form-control btn btn-primary" > -->
                        <input type="submit" style="width: 300px; display: inline;" value="Login" class="btn py-3 px-4 btn-primary">
                     </div>
                        <c:if test="${param.error != null}"> 
                        <p style="color:red;">아이디와 비밀번호가 잘못되었습니다.</p>
                      </c:if>
                  </div>
               </div>
              
               <div class="form-group" style="text-align: center;">
              <a href ="/signUp">회원가입&nbsp&nbsp&nbsp|</a>
                  <a href="../IdSearch">&nbsp&nbsp아이디 찾기&nbsp&nbsp&nbsp|</a>
                  <a href="../PasswordSearch">&nbsp&nbsp비밀번호 찾기</a>
               </div>
            </form>

         </div>
      </div>

     </div>
   </section>
<!--    <form class="form-signin" action="/login" method="post"> -->
<!--               <input type="text" class="form-control" id="user_id" name="user_id" placeholder="id"> -->
<!--              <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Password"> -->
<%--                  <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/> --%>
<!--               <button type="submit" class="btn btn-primary">Sign in</button> -->
<!--  </form> -->
   
   
   <h3 class="mb-5">&nbsp</h3>   

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