<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!--    로그인 성공시 이동하는 주소 등록 -> spring 시큐리티 조건 -->
<link rel="stylesheet" type="text/css" href="<c:url value="/"/>">
<title>Meet us</title>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<!-- 주소 값 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 카카오 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<body onload="document.f.username.focus();">

   <section class="hero-wrap hero-wrap-2"
      style="background-image: url('resources/images/happy.jpg');"
      data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div
         class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">MyPage</h1>
            <p class="breadcrumbs">
               <span class="mr-2"> <a href="../">Home <i
                     class="ion-ios-arrow-forward"></i></a>
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
            <p class="jg" style="font-size: 30px;">정보 수정</p>
         </div>
      </div>
      <div class="row"></div>
   </div>
   </section>
   
<input type="hidden" name="name" id="name" value="${name }" />

<c:set var="key" value="${key }" />
<c:if test="${key eq 2}">
   <section>
   <div class="container">
      <div class="about-author d-flex p-4 bg-light"
         style="border: 1px solid; border-color: #e2c0bb;">
         <div class="bio mr-5" style="width: 30%;">
         <c:if test="${!empty profilePath}">
            <img src="${profilePath }" alt="Image placeholder"
               class="img-fluid mb-4">
         </c:if>
         <c:if test="${empty profilePath}">
            <img src="resources/images/profile.png" alt="Image placeholder"
               class="img-fluid mb-4">
         </c:if>
         </div>
         <div class="desc" style="width: 60%;">
            <!--  자기 정보 -->
            <form action="${pageContext.request.contextPath}/updateUser" name="update" id="update" method="post">
            <input type="hidden" name="user_id" id="user_id" value="${user.user_id  }" />
            <div class="comment-form-wrap ">
               <h3>
                  <strong>My Information</strong>
               </h3>
               <hr>
               <p>My Id :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.user_id }</p>
               <hr>
               <div class="form-group">
               <p>My NickName :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="user_name" name="user_name" value="${user.user_name }" style="max-width: 90%;" requird></p>
               <p id="name_check" name="name_check"></p>
               </div>
               <hr>
               <p>My Age :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" id="user_age" name="user_age" value="${user.user_age }" min="1" max="100" style="max-width: 90%;" requird> </p>
               <hr>
               <p>My Gender : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="user_gender" name="user_gender" value="${user.user_gender }" style="max-width: 80%;" requird>  
               <hr>
            </div>
            <div class="tagcloud">
               <a onclick="submit()" class="tag-cloud-link jg" name="btn" id="btn"
                  style="background: #e2c0bb; color: white; float: right; width: 6rem; height: 2rem; font-size: 14px;" >내 정보 수정</a>
            </div>
            </form>
         </div>
      </div>
   </div>
   </section>
</c:if>

<c:if test="${key eq 1}">
<section>
      <div class="container" style="max-width:900px; margin-bottom:1rem;">
      <!-- END comment-list -->
         <div class="comment-form-wrap">
         <form action="userPwUpdate" method="post" name="pwForm" id="pwForm">
         <input type="hidden" name="user_name" id="user_name" value="${name }" />
            <!--아이디 -->
            <div class="form-group">
               <label for="user_id">현재 비밀번호</label> 
               <input type="password" class="form-control" id="current" name="current" requird>
               <div class="check_font" id="current_check"></div>
            </div>
       
            <!--이름 -->
            <!--번호 안들어가게 수정 -->
            <div class="form-group">
               <label for="user_name">변경 할 비밀번호</label> 
               <input type="password" class="form-control" id="user_password" name="user_password" requird>
            </div>

            <!--이메일 -->
            <div class="form-group">
               <label for="user_email">비밀번호 확인 </label> 
               <input type="password" class="form-control" id="user_passwordConfig" name="user_passwordConfig" requird>
                <p id="password_check"></p>
            </div>
            
            <br/>
            
            <input type="hidden" name="name" id="name" value="${name }" />
             <div class="form-group">
                <input type="button" value="비밀번호 변경 " class="btn py-3 px-4 btn-primary" onclick="pw()" style="margin:10px;">
            </div>
            </form>
      </div>
      
</div>
</section>
</c:if>

   <br>

</body>
<script>
let check=false;

$("#user_name").blur(function() {
    let user_name = $('#user_name').val();
    let name = $('#name').val();
    
     let patton = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
     let pattonNum = /[^0-9]/g;
     if (user_name.length == 0) {
        
        $("#name_check").text("공백은 안되요 :(");
        $('#name_check').css('color', 'red');
        $("#reg_submit").attr("disabled", true);
     } else if (user_name.length < 2&& user_name.replace(/\s/gi, "") == user_name) {
        $("#name_check").text("닉네임이 너무 짧거나 길어요  :(");
        $('#name_check').css('color', 'red');
        $("#reg_submit").attr("disabled", true);
     }
     else if(name == user_name ){
        $("#name_check").text("닉네임이 같습니다, 병경하지 않으셔도 돼요:)");
         $('#name_check').css('color', 'green');
         $("#reg_submit").attr("disabled", true);
     }
     else if (user_name.replace(/\s/gi, "") == user_name) {
         if (patton.test(user_name)) {
             $("#name_check").text("특수문자 안되요 :(");
             $('#name_check').css('color', 'red');
             $("#reg_submit").attr("disabled", true);
          }else {
             $.ajax({
                  //controller 확인 주소
                  url : '${pageContext.request.contextPath}/nameIsCheck?user_name='+user_name ,
                  type : 'GET',
                  success : function(data) {
                     if (data == 1) { 
                        $("#name_check").text("중복된 닉네임입니다 :p");
                        $("#name_check").css("color","red");
                        $("#reg_submit").attr("disabled", true);
                     } else {
                        $("#name_check").text("사용하세요!! :)");
                         $("#name_check").css("color","blue");
                         $("#reg_submit").attr("disabled", true);
                     }
                  },
                  error : function() {
                     console.log("실패");
                  }
               });
          }
       } else {
        $("#name_check").text("닉네임 안에 공백이 있으면 안되요 :(");
        $('#name_check').css('color', 'red');
        $("#reg_submit").attr("disabled", true);
     }
  });
     
        
  $("#btn").mouseenter(function() {
       let user_name = $('#user_name').val();
       let name = $('#name').val();
       
        let patton = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
        let pattonNum = /[^0-9]/g;
        if (user_name.length == 0) {
           
           $("#name_check").text("공백은 안되요 :(");
           $('#name_check').css('color', 'red');
           $("#reg_submit").attr("disabled", true);
        } else if (user_name.length < 2&& user_name.replace(/\s/gi, "") == user_name) {
           $("#name_check").text("닉네임이 너무 짧거나 길어요  :(");
           $('#name_check').css('color', 'red');
           $("#reg_submit").attr("disabled", true);
        }
        else if(name == user_name ){
           $("#name_check").text("닉네임이 같습니다, 병경하지 않으셔도 돼요:)");
            $('#name_check').css('color', 'green');
            $("#reg_submit").attr("disabled", true);
        }
        else if (user_name.replace(/\s/gi, "") == user_name) {
            if (patton.test(user_name)) {
                $("#name_check").text("특수문자 안되요 :(");
                $('#name_check').css('color', 'red');
                $("#reg_submit").attr("disabled", true);
             }else {
                $.ajax({
                     //controller 확인 주소
                     url : '${pageContext.request.contextPath}/nameIsCheck?user_name='+user_name ,
                     type : 'GET',
                     success : function(data) {
                        if (data == 1) { 
                           $("#name_check").text("중복된 닉네임입니다 :p");
                           $("#name_check").css("color","red");
                           $("#reg_submit").attr("disabled", true);
                        } else {
                           $("#name_check").text("사용하세요!! :)");
                            $("#name_check").css("color","blue");
                            $("#reg_submit").attr("disabled", true);
                        }
                     },
                     error : function() {
                        console.log("실패");
                     }
                  });
             }
          } else {
           $("#name_check").text("닉네임 안에 공백이 있으면 안되요 :(");
           $('#name_check').css('color', 'red');
           $("#reg_submit").attr("disabled", true);
        }
     });
        
        
        
        
        
  $("#current").blur(function() {
     let name = $('#name').val();
     let user_password = $('#current').val();
     $.ajax({
          url : '${pageContext.request.contextPath}/pwIsCheck?user_password='+user_password+"&user_name="+name,
          type : 'GET',
          success : function(data) {
             if (data == 0) { 
                check=false;
                $("#current_check").text("비밀번호가 틀려요 :p");
                $("#current_check").css("color","red");
                $("#reg_submit").attr("disabled", true);
             } else {
                check=true;
                $("#current_check").text("현재 사용자 비밀번호 입니다 :)");
                 $("#current_check").css("color","blue");
                 $("input[name=current]").attr("disabled",true);


                 $("#reg_submit").attr("disabled", true);
             }
          },
          error : function() {
             console.log("실패");
          }
       });
     
  });        
  
  $("#user_passwordConfig").blur(function() {
      let user_password = $('#user_password').val();
      let user_passwordConfig = $('#user_passwordConfig').val();
      let pattonNum = /[^0-9]/g;
      if (user_password == user_passwordConfig) {
         check=false;
         if(user_password.length == 0){
            $("#password_check").text("공백입니다 :(");
              $('#password_check').css('color', 'red');
              $("#reg_submit").attr("disabled", true);
         }
         else if (user_password.replace(/\s/gi, "") == user_password) {
            check=false;
            if (user_password.length < 4) {
               $("#password_check").text("길이가 너무 짧아요 :(");
               $('#password_check').css('color', 'red');
               $("#reg_submit").attr("disabled", true);
            } else if (user_password.length > 11) {
               check=false;
               $("#password_check").text("길이가 너무 길어요 :(");
               $('#password_check').css('color', 'red');
               $("#reg_submit").attr("disabled", true);
            } else if (pattonNum.test(user_password)) {
                check=true;
               $("#password_check").text("사용하시면 되는 비밀번호 입니다 :)");
               $('#password_check').css('color', 'blue');
               $("#reg_submit").attr("disabled", true);
               signList[count++]=true;
            } else {
               check=false;
               $("#password_check").text("비밀번호 형식은 문자와 숫자가 들어가는 5~10글자 사이입니다 :)");
               $('#password_check').css('color', 'red');
               $("#reg_submit").attr("disabled", true);
            }
         } else {
             check=false;
            $("#password_check").text("공백이 들어가면 안되요 :(");
            $('#password_check').css('color', 'red');
            $("#reg_submit").attr("disabled", true);
         }
      } else {
         check=false;
         $("#password_check").text("비밀번호가 달라요 :(");
         $('#password_check').css('color', 'red');
         $("#reg_submit").attr("disabled", true);
      }
   });
        
        
        
        
function submit(){
   let form = document.update;
   //여기에 그거 넣어보자 돼지 로딩 넣어보장
    form.submit();
}

function pw(){
    let form = document.pwForm;
   if(check == true){
      form.submit();
   }else
    swal("한번더 자세히","잘못된 정보가 있습니다.","error");
}
</script>
</html>