<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<title>Meet us</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<!-- 주소 값 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

   <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/welcome.jpg');" data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div
         class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-9 ftco-animate pb-4">
         
         	<c:if test="${check eq 'id'}">
            	<h1 class="mb-3 bread">ID Search</h1>
            </c:if>
            
            <c:if test="${check eq 'password'}">
            	<h1 class="mb-3 bread">Password Search</h1>
            </c:if>
            
           <p class="breadcrumbs">
               <span class="mr-2"> <a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span>
               <span class="mr-2"> <a href="../Login">Login <i class="ion-ios-arrow-forward"></i></a></span>
               <span class="mr-2"> ID & Password Search <i class="ion-ios-arrow-forward"></i></span>
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
				<p class="jg" style="font-size: 30px;">ID & Password Search</p>
			</div>
		</div>
		<div class="row"></div>
	</div>
	</section>
   
   
	<div class="container" style='max-width:900px; margin-bottom:1rem;'>
         <div class="comment-form-wrap">
      
         <!-- form -->
         <form action="${pageContext.request.contextPath}/SuccessPage" method="post" class="p-5 bg-light" name="">
         
          <c:if test="${check eq 'password'}">
            <!--아이디 -->
            <div class="form-group">
               <label for="user_id">아이디</label> 
               <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" autocomplete="off">
               <div class="check_font" id="id_check"></div>
            </div>
		 </c:if>
		 
            <!--이름 -->
            <!--번호 안들어가게 수정 -->
            <div class="form-group">
               <label for="user_name">이름</label> 
               <input type="text" class="form-control" id="user_name" name="user_name" placeholder="name" autocomplete="off">
               <div class="check_font" id="name_check"></div>
            </div>

            <!--이메일 -->
            <div class="form-group">
               <label for="user_email">이메일</label> 
               <input type="text" class="form-control" id="user_email" name="user_email" placeholder="email" autocomplete="off">
               <div class="check_font" id="email_check"></div>
            </div>
            
            <br/>
            
             <div class="form-group">
                <input type="button" value="찾기" id="checkButton" class="btn py-3 px-4 btn-primary">
                <input type="button" value="로그인" class="btn py-3 px-4 btn-primary" onclick="location.href='../Login'" style="margin:10px;">
            </div>
         </form>
      </div>
   </div>
   
   <h3 class="mb-5">&nbsp</h3>   

</body>
<script type="text/javascript">
$("#checkButton").click(function() {
	let user_id = $('#user_id').val();
	let user_name = $('#user_name').val();
	let user_email = $('#user_email').val();
	let patton = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
    let pattonNum = /[^0-9]/g;
    let emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    
	
	if (user_name.length == 0) {
	    $("#name_check").text("공백은 안돼요 :(");
	    $('#name_check').css('color', 'red');
	    $("#reg_submit").attr("disabled", true);
	 }else if (patton.test(user_name)) {
         $("#name_check").text("특수문자 안돼요 :(");
         $('#name_check').css('color', 'red');
         $("#reg_submit").attr("disabled", true);
      }else{
    	  $("#name_check").text("");
          $("#reg_submit").attr("disabled", true);
      }
	
	if (user_email.length == 0) {
	    $("#email_check").text("공백은 안돼요 :(");
	    $('#email_check').css('color', 'red');
	    $("#reg_submit").attr("disabled", true);
	 }else if(!emailCheck.test(user_email)){
		$("#email_check").text("이메일 형식을 지켜주세요 :(");
		$('#email_check').css('color', 'red');
		$("#reg_submit").attr("disabled", true);
	 }else{
		 $("#email_check").text("");
		 $("#reg_submit").attr("disabled", true);
	 }
	
	if(user_id===undefined){
	 $.ajax({
         url : '${pageContext.request.contextPath}/SeachUserId?user_email='+user_email+'&user_name='+user_name,
         type : 'GET',
         success : function(data) {
			if(data.length==0){
 				swal("ㅠㅠ", "찾으시는 계정이 존재하지 않아요.", "error");
			}else{
				let dataChange="";
				for(var i=0; i<data.length; i++) {
					if(i<3){
						dataChange+=data.substring(i,i+1);
					}else{
						dataChange+="*";
					}
					
				}
				swal("찾으시는 ID는 ", dataChange+" 입니다");
				
			}
         },
         error : function() {
            console.log("실패");
         }
      });
	}else{
		if (user_id.length == 0) {
		    $("#id_check").text("공백은 안되요 :(");
		    $('#id_check').css('color', 'red');
		    $("#reg_submit").attr("disabled", true);
		 }else if (patton.test(user_id)) {
	         $("#id_check").text("특수문자 안되요 :(");
	         $('#id_check').css('color', 'red');
	         $("#reg_submit").attr("disabled", true);
	      }else{
	    	  $("#id_check").text("");
	          $("#reg_submit").attr("disabled", true);
	      }
		
		
		 $.ajax({
	         url : '${pageContext.request.contextPath}/SeachUserPw?user_email='+user_email+'&user_name='+user_name+'&user_id='+user_id,
	         type : 'GET',
	         success : function(data) {
				if(data==0){
					swal("ㅠㅠ", "아이디가 존재하지 않습니다.",'error')
				}else{
					swal("전송완료", "비밀번호를 전송해드렸습니다.",'success')
				}
	         },
	         error : function() {
	            console.log("실패");
	         }
	      });
	}
 });
</script>
</html>