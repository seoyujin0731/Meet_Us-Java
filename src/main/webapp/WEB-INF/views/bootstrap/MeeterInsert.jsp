<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<title>Meet us</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style type="text/css">
/*   로딩 돼지 */
 #loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
 
 #loading-image {  
 position: absolute;  
 top: 50%;   
 left: 28%;  
 z-index: 100; }
 
 @media(min-width:600px){
 #loading-image {  
 position: absolute;  
 top: 50%;   
 left: 43%;  
 z-index: 100; }
 }
</style>
</head>
<!-- 주소 값 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/images/meeting.jpg');"
		data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-start">
			<div class="col-md-9 ftco-animate pb-4">
				<h1 class="mb-3 bread">Meeting</h1>
				<p class="breadcrumbs">
					<span class="mr-2"> <a href="../">Home <i
							class="ion-ios-arrow-forward"></i></a>
					</span> <span class="mr-2">Meeting <i
							class="ion-ios-arrow-forward"></i>
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
				<p class="jg" style="font-size: 30px;">Meeting Create</p>
			</div>
		</div>
		<div class="row"></div>
	</div>
	</section>

	<div class="container">
		<div class="comment-form-wrap">
			<!-- form -->
			<form action="../MeeterInsertAction"
				method="post" class="p-5 bg-light" name="MeetingCreateForm">

				<!-- 멤버 인원 -->
				<div class="form-group">
					<label for="member"><strong>*최대 모집 멤버 인원</strong></label> <input
						type="number" class="form-control" id="member"
						name="member" placeholder="숫자만 입력가능" min="1" max="100">
				</div>

				<!-- 모이는 날짜 -->
				<div class="form-group">
					<label for="MeetingDate"><strong>*만나는 날짜</strong></label> <input
						type="date" class="form-control" id="MeetingDate"
						name="MeetingDate" >
				</div>
				
				<!-- 모이는 시간 -->
				<div class="form-group">
					<label for="MeetingDate"><strong>*만나는 시간</strong></label> <input
						type="time" class="form-control" id="MeetingTime" placeholder="만나는 시간을 입력해주세요."
						name="MeetingTime" autocomplete="off">
				</div>

				<!-- 만남 목적 -->
				<div class="form-group">
					<label for="metting_purpose"><strong>*만나는 목적&nbsp&nbsp&nbsp&nbsp&nbsp</strong></label> 
					<select name="metting_purpose" id="metting_purpose">
						<option value='0000'>-- 선택 --</option>
						<option value='0001'>주류</option>
						<option value='0002'>스터디</option>
						<option value='0003'>운동</option>
						<option value='0004'>프로젝트</option>
						<option value='0005'>카페</option>
						<option value="direct">직접입력</option>
					</select>
					<!-- 상단의 select box에서 '직접입력'을 선택하면 나타날 인풋박스 -->
					<input type="text" id="selfPurpose" name="selfPurpose" autocomplete="off"/>
				</div>
				
				<c:set var="MeetingPlace" value="${MeetingPlace }" />
				<c:set var="address" value="${address }" />
				<c:choose>
				<c:when test="${!empty MeetingPlace and !empty address}">
				<div class="form-group">
					<label for="MeetingPlace"><strong>*만나는 장소</strong></label> <input
						type="text" class="form-control" id="MeetingPlace"
						name="MeetingPlace" placeholder="만남 장소를 입력해주세요." autocomplete="off" value="${MeetingPlace } - ${address }">
				</div>
				</c:when>
				<c:otherwise>
				<div class="form-group">
					<label for="MeetingPlace"><strong>*만나는 장소</strong></label> <input
						type="text" class="form-control" id="MeetingPlace"
						name="MeetingPlace" placeholder="만남 장소를 입력해주세요." autocomplete="off">
				</div>
				</c:otherwise>
				</c:choose>

				<!-- 제목 -->
				<div class="form-group">
					<label for="title"><strong>*제목</strong></label> <input type="text"
						class="form-control" id="title" name="title"
						placeholder="제목을 작성해주세요." autocomplete="off">
				</div>

				<!-- 내용 -->
				<div class="form-group">
					<label for=""contents""><strong>*내용</strong></label>
					<textarea name="contents" id="contents" cols="30" rows="10"
						class="form-control" placeholder="모임에 대한 내용을 적어주세요." autocomplete="off"></textarea>
				</div>
				
				<!-- 모집 조건 -->
				<div class="form-group">
					<label for="metting_condition"><strong>모집 조건&nbsp&nbsp&nbsp&nbsp&nbsp</strong></label> 
					<select name="metting_condition" id="metting_condition">
						<option value='000'>--없음--</option>
						<option value='direct_Condition'>조건 있음</option>
					</select>
					<!-- 상단의 select box에서 '직접입력'을 선택하면 나타날 인풋박스 -->
					<div class="card" id="selbocDirect_condition" name="selbocDirect_condition" style="padding:20px;">
					    <label for="user_age"><strong>최소 나이</strong></label>
					    <input type="number" class="form-control" id="user_age_min" name="user_age_min" placeholder="숫자만 입력가능" min="10" max="100"/><br>
					    <label for="user_age"><strong>최대 나이</strong></label>
					    <input type="number" class="form-control" id="user_age_max" name="user_age_max" placeholder="숫자만 입력가능" min="10" max="100"/><br>
					    
					    <div class="form-group">
					    <label for="user_gender"><strong>성별</strong></label> <br/> 
					    <input type='radio' name='user_gender' id='user_gender' value='n' checked/>상관 없음&nbsp;&nbsp;
					    <input type='radio'name='user_gender' id='user_gender' value='f' />여성만&nbsp;&nbsp; 
					    <input type='radio' name='user_gender' id='user_gender' value='m' />남성만&nbsp;&nbsp; 
					    </div>
					    
					    <label for="user_other"><strong>기타</strong></label>
					    <input type="text" class="form-control" id="user_other" name="user_other" placeholder="(컴공 전공/대학생만/)" autocomplete="off"/><br>
					</div>
				</div>
				

				<div class="form-group">
					<input type="button" value="작성하기" class="btn py-3 px-4 btn-primary" onclick="MeetingBoardInsert()">
					<input type="button" value="취소" class="btn py-3 px-4 btn-primary" onclick="cencle_click()" style="margin:10px;">
				</div>
			</form>
		</div>
	</div>
	
	<!-- 	핑크 돼지 로딩 -->
	<div id="loading">
	<img id="loading-image" src="resources/images/Pinky Pig.svg" alt="Loading..." />
	</div>
	

<!-- 정보 입력 관련 스크립트 -->
<script type="text/javascript">
$('#loading').hide();
	$(function(){
	//직접입력 인풋박스 기존에는 숨어있다가
	$("#selfPurpose").hide();
	$("#metting_purpose").change(function() {
	        //직접입력을 누를 때 나타남
			if($("#metting_purpose").val() == "direct") {
				$("#selfPurpose").show();
			}  else {
				$("#selfPurpose").hide();
			}
		}) 
	});
	
	$(function(){
		//직접입력 인풋박스 기존에는 숨어있다가
		$("#selbocDirect_condition").hide();
		$("#metting_condition").change(function() {
		        //직접입력을 누를 때 나타남
				if($("#metting_condition").val() == "direct_Condition") {
					$("#selbocDirect_condition").show();
				}  else {
					$("#selbocDirect_condition").hide();
				}
			}) 
		});
	
	function cencle_click(){
		location.href="../";
	}
	
// 	입력폼 유효성 검사
	function MeetingBoardInsert(){
		var MB_MEMBER = $("#member").val();
		var MB_MEETING_DATE = $("#MeetingDate").val();
		var MB_MEETING_TIME = $("#MeetingTime").val();
		var MB_PURPOSE = $("#metting_purpose").val();
		var condition = $("#metting_condition").val();
		var MB_PLACE = $("#MeetingPlace").val();
		var MB_TITLE = $("#title").val();
		var MB_CONTENTS = $("#contents").val().replace(/\n/g,"<br>");
		var MB_LIMIT_AGE_MIN;
		var MB_LIMIT_AGE_MAX;
		var MB_LIMIT_GENDER;
		var MB_LIMIT_OTHER;
		
		if(MB_PURPOSE == "direct")
			MB_PURPOSE = $("#selfPurpose").val();
		
		if(condition == "direct_Condition"){
			if($("#user_age_min").val() != "" && $("#user_age_min").val() != null)
				MB_LIMIT_AGE_MIN = $("#user_age_min").val();
			if($("#user_age_max").val() != "" && $("#user_age_max").val() != null)
				MB_LIMIT_AGE_MAX = $("#user_age_max").val();
			if($('input[name="user_gender"]:checked').val() != "" && $('input[name="user_gender"]:checked').val() != null )
				MB_LIMIT_GENDER = $('input[name="user_gender"]:checked').val();
			if($("#user_other").val() != "" && $("#user_other").val() != null)
				MB_LIMIT_OTHER = $("#user_other").val();
			}
		
		if(MB_MEMBER == '' || MB_MEMBER == null)
			swal("모집인원", "모집인원을 결정해주세요.","error");
		else if(MB_MEETING_DATE == '' || MB_MEETING_DATE == null)
			swal("만나는 날짜", "만나는 날짜를 결정해주세요.","error");
		else if(MB_MEETING_TIME == '' || MB_MEETING_TIME == null)
			swal("만나는 시간", "만나는 시간을 결정해주세요.","error");
		else if(MB_PURPOSE == "0000" || MB_PURPOSE == "" || MB_PURPOSE == null)
			swal("만나는 목적", "만나는 목적을 결정해주세요.","error");
		else if(MB_PLACE == '' || MB_PLACE == null)
			swal("만나는 장소", "만나는 장소를 결정해주세요.","error");
		else if(MB_TITLE == '' || MB_TITLE == null)
			swal("제목", "모집 글의 제목을 결정해주세요.","error");
		else if(MB_CONTENTS == '' || MB_CONTENTS == null)
			swal("내용", "모집 글의 내용을 채워주세요.","error");
		else if(MB_LIMIT_AGE_MIN >= MB_LIMIT_AGE_MAX)
			swal("나이제한", "최대 나이가 최소나이보다 작거나 같습니다.","error");
		else{
			$('#loading').show();
			$.ajaxSettings.traditional = true;
			$.ajax({
			    type: "POST",
			    url : "/MeeterInsertAction",
			    data : { 	 MB_MEMBER : MB_MEMBER
							 ,MB_MEETING_DATE : MB_MEETING_DATE
							 ,MB_MEETING_TIME : MB_MEETING_TIME
							 ,MB_PURPOSE : MB_PURPOSE
							 ,MB_LIMIT_AGE_MIN : MB_LIMIT_AGE_MIN
							 ,MB_LIMIT_AGE_MAX : MB_LIMIT_AGE_MAX
							 ,MB_LIMIT_GENDER : MB_LIMIT_GENDER
							 ,MB_LIMIT_OTHER : MB_LIMIT_OTHER
							 ,MB_PLACE : MB_PLACE
							 ,MB_TITLE : MB_TITLE
							 ,MB_CONTENTS : MB_CONTENTS
							 ,condition : condition
			             },
			    contentType : "application/x-www-form-urlencoded; charset=utf-8",
			    success : function(){
			    	$('#loading').hide();
			    	swal("성공", "성공적으로 Meeting 게시글을 작성했습니다.", "success")
			    	.then((value) => { location.href="../MeeterMain" })
			    },error : function(){
			    	$('#loading').hide();
			    	swal("실패", "안타깝게도 Meeting 게시글을 작성하지 못했습니다..", "error");
			    }
			});
		}
	}
</script>


</body>

</html>