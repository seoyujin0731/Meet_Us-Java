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
<!-- firebasePushNotification -->
<script src="https://www.gstatic.com/firebasejs/7.2.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.2.1/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.10.1/firebase-messaging.js"></script>

<body onload="document.f.username.focus();">
<!-- firebasePushNotification -->
<script>
  var firebaseConfig = {
    apiKey: "AIzaSyD3duuXGUcKPwZ8dSl7XZrcvq1bcMRp2xo",
    authDomain: "meet-us-95c93.firebaseapp.com",
    databaseURL: "https://meet-us-95c93.firebaseio.com",
    projectId: "meet-us-95c93",
    storageBucket: "meet-us-95c93.appspot.com",
    messagingSenderId: "422622734938",
    appId: "1:422622734938:web:277da1b4b6d061601d8663",
    measurementId: "G-DE1ZQKWHTF"
  };
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>

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
         <div class="about-author d-flex p-4 bg-light" style="border: 1px solid; border-color:#e2c0bb; margin-top:3rem; margin-bottom:3rem;">
              <div class="desc" style="width:100%;">
               <div class="comment-form-wrap" style="width:60%; float:left;">
                <h2 class="jg" style="margin-bottom:0; color:#e8705e;float:left;"><strong>알림 설정</strong></h2>
                <br><br>
                <p class="jg">*안드로이드 사용자 중 크롬 or 파이어폭스 사용자는 알림 기능을 이용할 수 있습니다.</p>
              </div>
              <c:if test="${!empty pushUser}">
              <button type="button" onclick="pushCancelClick();" class="btn py-3 px-4 btn-warning jg" style="width: 30%; height:60%; color: white; background:#e8705e; border-color: #e8705e; float:right; font-size:1.2rem; margin-top:1.5rem;">알림 차단</button>
              </c:if>
              <c:if test="${empty pushUser}">
              <button type="button" onclick="pushClick();" class="btn py-3 px-4 btn-warning jg" style="width: 30%; height:60%; color: white; background:#fbc420; border-color: #fbc420; float:right; font-size:1.2rem; margin-top:1.5rem;">알림 허용</button>
              </c:if>
            </div>
            </div>
            
             <div class="about-author d-flex p-4 bg-light" style="border: 1px solid; border-color:#e2c0bb;">
              <div class="bio mr-5" style="width:30%;">
                <c:if test="${!empty profilePath}">
				<img src="${profilePath }" alt="Image placeholder"
					class="img-fluid mb-4">
				</c:if>
				<c:if test="${empty profilePath}">
					<img src="resources/images/profile.png" alt="Image placeholder"
						class="img-fluid mb-4">
				</c:if>
              </div>
              <div class="desc" style="width:60%;">
				<!--  자기 정보 -->
               <div class="comment-form-wrap ">
                <h3><strong>My Information</strong></h3>
                <hr>
                <p>My Id :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.user_id }</p>
                <hr>
                <p>My NickName :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.user_name }</p>
                <hr>
                <p>My Age :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.user_age }</p>
                <hr>
                <p>My Gender :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.user_gender } </p>
                <hr>
                <p>My password :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href='/UserSettingModify?code=1' class="tag-cloud-link jg" style="background:#e2c0bb; color:white; width:6rem; height:2rem; font-size:14px;">비밀번호 변경</a> </p>
                <hr>
              </div>
              
              
                 <div class="tagcloud">
                 <a href="/MyPageImageSave" class="tag-cloud-link jg" style="background:#e2c0bb; color:white; float:right; width:7.5rem; height:2rem; font-size:14px;">프로필 사진 수정</a>
                  <a href="/UserSettingModify?code=2" class="tag-cloud-link jg" style="background:#e2c0bb; color:white; float:right; width:6rem; height:2rem; font-size:14px;">내 정보 수정</a>
            	 </div>
            </div>
            </div>
            
            <div class="about-author d-flex p-4 bg-light" style="border: 1px solid; border-color:#e2c0bb; margin-top:3rem; margin-bottom:3rem;">
              <div class="desc" style="width:100%;">
               <div class="comment-form-wrap ">
                <h2><strong>My Meeting</strong></h2>
                <div class="card" style="padding:1rem;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">내가 만든 Meeting</h4>
                <hr>
                <c:forEach var="team" items="${team}">
                <a href ='MeeterDetail?MB_NO=<c:out value="${team.MB_NO}" />' style="color:#999999;">
	                <p style="margin-bottom:0;" style="color:#999999;">Meeting Date : <c:out value="${team.MB_MEETING_DATE}" /></p>
	                <c:out value="${team.MB_TITLE}" />
	                <hr>
	            </a>
                </c:forEach>
                </div>
                
				<!-- 참석한 곳 -->
				<div class="card" style="padding:1rem; margin-top:2rem;">
                <h4 class="jg" style="font-size:20px; color:#e2c0bb;">내가 참석한 Meeting</h4>
                <hr>
                <c:forEach var="myAttendList" items="${myAttendList}">
                <a href ='MeeterDetail?MB_NO=<c:out value="${myAttendList.MB_NO}" />' style="color:#999999;">
	                <p style="margin-bottom:0;" style="color:#999999;">Meeting Date : <c:out value="${myAttendList.MB_MEETING_DATE}" /></p>
	                <c:out value="${myAttendList.MB_TITLE}" />
	                <hr>
	            </a>
                </c:forEach>
                </div>
                
              </div>
            </div>
            </div>
            
<!--              <div class="about-author d-flex p-4 bg-light" style="border: 1px solid; border-color:#e2c0bb; margin-top:3rem; margin-bottom:3rem;"> -->
<!--               <div class="desc" style="width:100%;"> -->
<!--                <div class="comment-form-wrap "> -->
<!--                 <h2><strong>Message sent to the admin</strong></h2> -->
<!--                 <div class="card" style="padding:1rem;"> -->
<!--                 <h4 class="jg" style="font-size:20px; color:#e2c0bb;">보낸 Massage</h4> -->
<!--                 <hr style="margin:0;"> -->
<!--                 <p style="margin-bottom:0;">From Date : 2019-10-12</p> -->
<!--                 <p style="margin-top:1%; margin-bottom:1%;">map에 주소 더 많이 넣게 해주세요.</p> -->
<!--                 <hr style="margin:0;"> -->
<!--                 <p style="margin-bottom:0;">From Date : 2019-10-12</p> -->
<!--                 <p style="margin-top:1%; margin-bottom:1%;">감사합니다.</p> -->
<!--                 <hr style="margin:0;"> -->
<!--                 </div> -->
                
                
<!--                 <div class="card" style="padding:1rem; margin-top:2rem;"> -->
<!--                 <h4 class="jg" style="font-size:20px; color:#e2c0bb;">받은 메세지</h4> -->
<!--                 <hr style="margin:0;"> -->
<!--                 <p style="margin-bottom:0;">To Date : 2019-10-13</p> -->
<!--                 <p style="margin-top:1%; margin-bottom:1%;">(Re):map에 주소 더 많이 넣게 해주세요.</p> -->
<!--                 <hr style="margin:0;"> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             </div> -->
            
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

<script type="text/javascript">
const messaging = firebase.messaging();
messaging.usePublicVapidKey("BDnvbWzOi2QMcOl4DzSqeUEod_w_PCzUoev15dYvP5ciCPIB5VzGssxPxavI0p9o5iIYzwMuKSEi7jWseUKGRO4");
function pushClick(){
Notification.requestPermission().then((permission) => {
	if (permission === 'granted') {
		console.log('Notification permission granted.');
		messaging.getToken().then((currentToken) => {				
			if (currentToken) {
				console.log(currentToken);
				$.ajax({
					url: '/insertPushToken',
					type: 'POST',
					data: currentToken,
					success: function(data) {
						console.log('RESULT', data);
						swal("성공", "알림 등록에 성공했습니다.", "success")
	  		    	.then((value) => { location.reload();})
					},
					error: function(err) {
						console.log('ERROR', err);
						swal("실패", "알림 등록에 실패했습니다.", "error")
					}
				});
			} else {
				console.log('No Instance ID token available. Request permission to generate one.');
			}
		}).catch((err) => {
			console.log('An error occurred while retrieving token. ', err);
			showToken('Error retrieving Instance ID token. ', err);
			setTokenSentToServer(false);
		});
	} 
	else {
		console.log('Unable to get permission to notify.');
	}
});
}
</script>

<script type="text/javascript">
function pushCancelClick(){
// 	location.href="/DeletePushToken";
// 	swal("성공", "알림 등록에 성공했습니다.", "success")
//   	.then((value) => { location.reload();})
	$.ajax({
		url: '/DeletePushToken',
		type: 'GET',
// 		data: currentToken,
		success: function(data) {
			swal("성공", "알림 차단에 성공했습니다.", "success")
	    	.then((value) => { location.reload();})
		},
		error: function(err) {
			swal("실패", "알림 차단에 실패했습니다.", "error")
		}
	});
}
</script>

</html>