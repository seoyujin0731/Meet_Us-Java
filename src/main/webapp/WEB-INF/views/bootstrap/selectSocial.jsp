<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Meet us</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<!-- 주소 값 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 카카오 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

   <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/welcome.jpg');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div
         class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">Sign Up</h1>
            <p class="breadcrumbs">
               <span class="mr-2"> <a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span>
               <span class="mr-2"> <a href="../Login">Login <i class="ion-ios-arrow-forward"></i></a>
               <span class="mr-2"> Sign Up <i class="ion-ios-arrow-forward"></i>
               </span>
            </p>
         </div>
      </div>
   </div>
   </section>
   
   <section class="ftco-section" style="padding: 2em 0;">
       <div class="container">
          <div class="row justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
             <span class="subheading">Meet Us</span>
            <p class="jg" style="font-size:30px; margin-bottom:50px;">회원가입</p>
				<div class="col-md-6 col-lg-4-login ftco-animate" style="float:left;">
					<div class="project" style="overflow: inherit;">
						<div class="img">
							<a
								href="https://kauth.kakao.com/oauth/authorize?client_id=51842c99904f5e62277ee17ee6d97da2&redirect_uri=http://localhost:8087/kakaoLogin&response_type=code">
								<img src="resources/images/kakaoimage.png" class="img-fluid"
								alt="Colorlib Template"
								style="max-width: 200px;">
							</a>
						</div>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=51842c99904f5e62277ee17ee6d97da2&redirect_uri=http://localhost:8087/kakaoLogin&response_type=code" class="btn btn-primary" style="margin-top:2rem;"><p class="jg" style="margin:0;">kakao 회원가입</p></a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4-login ftco-animate" style="float:left;">
					<div class="project" style="overflow: inherit;">
						<div class="img">
							<a href="../signUp"><img src="resources/images/login.jpg"
								class="img-fluid" alt="Colorlib Template"
								style="max-width: 200px; border-radius: 50px 50px 50px 50px;"></a>
						</div>
						<a href="../signUp" class="btn btn-primary" style="margin-top:2rem;"><p class="jg" style="margin:0;">일반 회원가입</p></a>
					</div>
				</div>

			</div>
        </div>
          <div class="row">
          
<!--              <div class="col-md-6 col-lg-4-login ftco-animate"> -->
<!--                 <div class="project" style="overflow:inherit;"> -->
<!--                    <div class="img"> -->
<!--                       <a href="https://kauth.kakao.com/oauth/authorize?client_id=51842c99904f5e62277ee17ee6d97da2&redirect_uri=http://localhost:8087/kakaoLogin&response_type=code"> -->
<!--                       <img src="resources/images/kakaoimage.png" class="img-fluid" alt="Colorlib Template" style="max-width: 200px; margin-left: 6.5rem;"></a> -->
<!--                    </div> -->
<!--                    <div class="text"> -->
<!--                       <h4 class="price" style="font-size:20px; left:10%;border-radius:10px;">카카오톡 회원가입</h4> -->
<!--                    </div> -->
<!--                 </div> -->
<!--              </div> -->
             
<!--              <div class="col-md-6 col-lg-4-login ftco-animate"> -->
<!--                 <div class="project" style="overflow:inherit;"> -->
<!--                    <div class="img"> -->
<!--                       <a href="../signUp"><img src="resources/images/login.jpg" class="img-fluid" alt="Colorlib Template" style="max-width: 200px; margin-left: 6.5rem;border-radius: 50px 50px 50px 50px;"></a> -->
<!--                    </div> -->
<!--                    <div class="text"> -->
<!--                       <h4 class="price" style="font-size:20px; left:10%;border-radius:10px;">일반 회원가입</h4> -->
<!--                    </div> -->
<!--                 </div> -->
<!--              </div> -->
             
          </div>
       </div>
    </section>
   
</body>
</html>