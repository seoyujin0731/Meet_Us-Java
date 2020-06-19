<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Meet Us</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	  <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/meeting.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">Meeting</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="../MeeterMain">Meeting <i class="ion-ios-arrow-forward"></i></a></span> <span>Meeting Detail <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>


	<section class="ftco-section ftco-services-2 ftco-no-pt">
	<div class="container-fluid px-0 bg-light">
		<div class="container">
			<div class="row tour py-5">
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block " style="width:100%;">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-manager"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3"><p class="jg">${detail.MB_CURRENT_MEMBER }/${detail.MB_MEMBER}</p></h3>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block " style="width:100%;">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-calendar"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3"><p class="jg">${detail.MB_MEETING_DATE }<br>${detail.MB_MEETING_TIME }</p></h3>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block" style="width:100%;">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-tour-guide"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3"><p class="jg">${detail.MB_PURPOSE }</p></h3>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block" style="width:100%;">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-map-of-roads"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3"><p class="jg">${detail.MB_PLACE }</p></h3>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services text-center d-block" style="width:100%;">
						<div class="icon justify-content-center align-items-center d-flex">
							<span class="flaticon-layers"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3"><p class="jg">
							<c:set var="MB_LIMIT_AGE_MIN" value="${detail.MB_LIMIT_AGE_MIN }" />
							<c:set var="MB_LIMIT_AGE_MAX" value="${detail.MB_LIMIT_AGE_MAX }" />
							<c:set var="MB_LIMIT_GENDER" value="${detail.MB_LIMIT_GENDER }" />
							<c:set var="MB_LIMIT_OTHER" value="${detail.MB_LIMIT_OTHER }" />
							
							<c:if test="${MB_LIMIT_AGE_MIN ne '0'}">
							<p class="jg">최소 나이 : ${detail.MB_LIMIT_AGE_MIN }</p>
							</c:if>
							<c:if test="${MB_LIMIT_AGE_MAX ne '0'}">
							<p class="jg">최대 나이 : ${detail.MB_LIMIT_AGE_MAX }</p>
							</c:if>
							<c:if test="${MB_LIMIT_AGE_MAX eq '0' || MB_LIMIT_AGE_MIN eq '0'}">
							<p class="jg">나이 :상관없음</p>
							</c:if>
							<c:if test="${MB_LIMIT_GENDER eq 'n'}">
							<p class="jg">성별 : 상관없음</p>
							</c:if>
							<c:if test="${MB_LIMIT_GENDER eq 'f'}">
							<p class="jg">성별 : 여자만</p>
							</c:if>
							<c:if test="${MB_LIMIT_GENDER eq 'm'}">
							<p class="jg">성별 : 남자만</p>
							</c:if>
							<c:if test="${MB_LIMIT_OTHER ne '미정'}">
							<p class="jg">${detail.MB_LIMIT_OTHER }</p>
							</c:if>
							
							</p></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
        	<div class="col-md-12 tour-wrap mb-5 mt-5">
    				<div class="row">
    					<div class="col-md-6 d-flex ftco-animate">
    					<c:set var="imageUrl" value="${imageUrl }" />
    					<!-- 저장한 사진이 없을 경우 -->
    					<c:if test="${fn:length(imageUrl) == 0}">
    					<div class="img align-self-stretch" style="background-image: url(resources/images/gallery-1.jpg);"></div>
    					</c:if>
    					<!--  저장한 사진이 한장 이상인 경우 -->
    					<c:if test="${fn:length(imageUrl) != 0}">
    					<div class="img align-self-stretch" style="background-image: url(${imageUrl[0]});"></div>
    					</c:if>
    					</div>
    					<div class="col-md-6 ftco-animate">
    						<div class="text py-5">
    							<h3 class="jg" style="word-break:break-all">${detail.MB_TITLE }</a></h3>
    							<hr>
    							<p class="jg" style="word-break:break-all">${detail.MB_CONTENTS }</p>
    						</div>
    						<hr>
    						<p class="jg" style="word-break:break-all">작성자 : ${detail.MB_WRITER }<BR>작성일 : ${detail.MB_ModiDt }<BR>조회수 : ${detail.MB_VIEW_COUNT }</p>
    					</div>
    				</div>
    		</div>
    		
<!-- 		참석 인원 영역 -->
			<div class="col-md-12" style="margin-bottom:3rem;">
			<h6 style="margin-bottom:2rem;"><strong>참석 인원 (${detail.MB_CURRENT_MEMBER })</strong></h6>
			<c:forEach var="memberList" items="${memberList}">
			<ul class="comment-list">
			    <li class="comment">
                  <div class="vcard bio" style="width:50px;">
						<c:if test="${!empty memberList.file_path}">
							<img src="${memberList.file_path}" style="width:50px; height:50px; border:solid; border-color:#e2c0bb;" alt="Image placeholder">
						</c:if>
						<c:if test="${empty memberList.file_path}">
							<img src="resources/images/profile.png" style="width:50px; height:50px; border:solid; border-color:#e2c0bb;" alt="Image placeholder">
						</c:if>
                  </div>
                  <div class="comment-body" style="margin-top:1rem; float:left; margin-left:1rem;">
                    <h7 class="jg">${memberList.attend_name}</h7>
                  </div>
                </li>
            </ul>
            </c:forEach>
			</div>
				
		<section class="ftco-gallery" style="width:100%;">
    	<div class="container-fluid px-0">
    		<div class="row no-gutters">
    		<!-- 저장된 사진이 없을 경우 -->
    		<c:if test="${fn:length(imageUrl) == 0}">
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="resources/images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(resources/images/gallery-1.jpg);">
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="resources/images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(resources/images/gallery-2.jpg);">
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="resources/images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(resources/images/gallery-3.jpg);">
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="resources/images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(resources/images/gallery-4.jpg);">
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="resources/images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(resources/images/gallery-5.jpg);">
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="resources/images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(resources/images/gallery-6.jpg);">
						</a>
					</div>
    		</c:if>
    		<!--  저장한 사진이 한장 이상인 경우 -->
    		<c:if test="${fn:length(imageUrl) != 0}">
    				<c:forEach var="list" items="${imageUrl}" varStatus="i">
    					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="${list}" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${list});"></a>
						</div>
    				</c:forEach>
    		</c:if>
        		</div>
    	</div>
    </section>
    <!-- 		참석 버튼 -->
			<div class="col-md-12">
				<c:set var="name" value="${name }"/>
				<c:set var="writer" value="${detail.MB_WRITER }"/>
				<c:set var="memberCheck" value="false"/>
				<c:forEach var="memberList" items="${memberList }">
					<c:if test="${memberList.attend_name eq name }">
						<c:set var="memberCheck" value="true"/>
					</c:if>
				</c:forEach>
				<c:choose>
						<c:when test="${writer eq name }">
						<p class="btn btn-primary py-3 px-4" style="background:#ffc107; float:right; width:200px; margin-top:3rem; margin-left:2%; margin-bottom:0;">방장입니다.</p>
						</c:when>
						<c:when test="${memberCheck eq 'true'}">
						<a onclick="AttendcancelClick()" class="btn btn-primary py-3 px-4" style="background:#dc3545; float:right; width:200px; margin-top:3rem; margin-left:2%;">참석 취소하기</a>
						</c:when>
						<c:when test="${detail.MB_CURRENT_MEMBER eq detail.MB_MEMBER}">
						<p class="btn btn-primary py-3 px-4" style="background:#b2bbc9; float:right; width:200px; margin-top:3rem; margin-left:2%; border: 1px solid #b2bbc9 !important;">모집 마감</p>
						</c:when>
						<c:otherwise>
						<a onclick="AttendClick()" class="btn btn-primary py-3 px-4" style="float:right; width:200px; margin-top:3rem; margin-left:2%;">참석하기</a>
						</c:otherwise>
				</c:choose>
					
					<a href="../MeeterMain" class="btn btn-primary py-3 px-4" style="float:right; width:100px; margin-top:3rem; background:#23272b; margin-left:2%;">BACK</a>
					<c:if test="${writer eq name}">
					<a href="../MeetingImageInsert?MB_NO=${detail.MB_NO}" class="btn btn-primary py-3 px-4" style="float:right;  background:#e8705e;margin-top:3rem;"><span class="icon-image"></span></a>
					<div class="tag-widget post-tag-container mb-5 mt-5">
						<div class="tagcloud">
							<a href="../MeetingModify?MB_NO=${detail.MB_NO}" class="tag-cloud-link" style="margin-top:2rem;">MODIFY</a> 
							<a href="../MeetingDelete?MB_NO=${detail.MB_NO}" class="tag-cloud-link">DELETE</a>
						</div>
					</div>
					</c:if>
			</div>
	</div>
	

<div class="col-md-12 tour-wrap" style="margin-bottom:3rem; margin-top:3rem; overflow-x:hidden;">
      
            <h3 class="mb-5">${count } Reviews</h3>
            
            <ul class="comment-list">
               <li class="comment">
                <div class="vcard bio">
						<c:if test="${!empty LoginUserProfile}">
							<img src="${LoginUserProfile }" alt="Image placeholder" style="border:solid; border-color:#e2c0bb; width:70px; height:70px;">
						</c:if>
						<c:if test="${empty LoginUserProfile}">
							<img src="resources/images/profile.png" alt="Image placeholder" style="border:solid; border-color:#e2c0bb; width:70px; height:70px;">
						</c:if>
                  </div>
                  <div class="comment-body">
                     <h4 class="jg"><strong>${name }</strong></h4>
                     <form id="ff">
                        <textarea  id="board_reply_content" name="board_reply_content" style="width:100%; float:left;"></textarea>
                        <a onclick="replyInsert()" class="reply" style="float:right; margin-top: 1rem;">insert</a>
                        <input type="hidden" value='${name }' id="board_reply_writer" name="board_reply_writer" />
                        <input type="hidden" value='${detail.MB_NO}' id="mb_no" name="mb_no" />
                     </form>   
                  </div>
               </li>
            
                <li class="comment">
                <div class="comment-body">
<!--                    <a onclick="replyInsert()" class="reply" style="float:right;">insert</a> -->
                   </div>
                </li>
                
               <c:forEach var="list" items="${list}">
               <!-- c태그 거는거 염두해둬요 -->
               <li class="comment">
                <div class="vcard bio">
<!--                     <img src="resources/images/seo.jpg" alt="Image placeholder" style="border:solid; border-color:#e2c0bb; width:60px; height:60px;"> -->
                	<c:if test="${!empty list.file_path}">
						<img src="${list.file_path }" alt="Image placeholder" style="border:solid; border-color:#e2c0bb; width:60px; height:60px;">
					</c:if>
					<c:if test="${empty list.file_path}">
					<img src="resources/images/profile.png" alt="Image placeholder" style="border:solid; border-color:#e2c0bb; width:60px; height:60px;">
					</c:if>
                  </div>
                  <div class="comment-body">
                     <h3 class="jg"><strong>${list.board_reply_writer }</strong></h3>
                     <div class="meta">${list.board_reply_insertdate }</div>
                     <p>${list.board_reply_content }</p>
                     <c:if test="${list.board_reply_writer  == name ? true : false}" var="result">
                        <a onclick="replyDelete('${list.board_reply_no }')" class="reply">delete</a>
                     </c:if>
                     <hr/>
                     
                  </div>
               </li>
               </c:forEach>
            </ul>
      </div>

		<div class="ftco-animate">
              <h3 class="heading-sidebar"><p class="jg">비슷한 모임</p></h3>
              
              <c:forEach var="subList" varStatus="i" items="${subList }">
              <div class="block-21 mb-4 d-flex">
              <c:if test="${empty subList.FILE_PATH}">
              <a href="../MeeterDetail?MB_NO=${subList.MB_NO}" class="blog-img mr-4" style="background-image: url(resources/images/image_1.jpg);"></a>
              </c:if>
              <c:if test="${!empty subList.FILE_PATH}">
                <a href="../MeeterDetail?MB_NO=${subList.MB_NO}" class="blog-img mr-4" style="background-image: url(${subList.FILE_PATH});"></a>
              </c:if>
                <div class="text">
                  <h3 class="heading jg" style="margin-bottom:0;"><a href="../MeeterDetail?MB_NO=${subList.MB_NO}">${subList.MB_TITLE}</a></h3>
                  <h4 class="heading jg" style="margin-bottom:0;"><a href="../MeeterDetail?MB_NO=${subList.MB_NO}" style="color:#e2c0bb; font-size:14px;">${subList.MB_PURPOSE}#${subList.MB_PLACE}#${subList.MB_MEETING_TIME}</a></h4>
                  <div class="meta">
                    <div><a href="../MeeterDetail?MB_NO=${subList.MB_NO}"><span class="icon-calendar"></span> ${subList.MB_MEETING_DATE}</a></div>
                    <div><a href="../MeeterDetail?MB_NO=${subList.MB_NO}"><span class="icon-person"></span> ${subList.MB_WRITER}</a></div>
                    <div><a href="../MeeterDetail?MB_NO=${subList.MB_NO}"><span class="icon-eye"></span> ${subList.MB_VIEW_COUNT}</a></div>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
		</div>
	</section>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px"> <circle
			class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4"
			stroke="#eeeeee" /> <circle class="path" cx="24" cy="24" r="22"
			fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	
</body>
<script type="text/javascript">
let checkInsert = 0;

   function replyDelete(board_reply_no){
      $.ajax({
            url : '${pageContext.request.contextPath}/replyDelete?board_reply_no='+board_reply_no,
            type : 'GET',
            success : function(data) {
              location.reload();
            },
            error : function() {
               console.log("실패");
            }
         });
   }

   let click = true;

   function replyInsert(){
      let insertForm = $("#ff").serialize();
      if (click) {
      $.ajax({
         url : '${pageContext.request.contextPath}/insertReply',
         type : 'GET',
         data : insertForm,
         success : function(data) {
              location.reload();
         },
         error : function() {
            console.log("실패");
         }
      });
      click = !click;
      }else{
         
      }
   }
   function AttendClick(){
	   var limit_min_age = ${detail.MB_LIMIT_AGE_MIN };
	   var limit_max_age = ${detail.MB_LIMIT_AGE_MAX };
	   var limit_gender = '${detail.MB_LIMIT_GENDER }';
	   
       var user_age = ${userLimit.user_age };
       var user_gender = '${userLimit.user_gender }';
       
       if(limit_min_age > user_age){
    	   swal("나이 조건", "참가자의 나이가 제한 나이보다 적습니다.", "error");
       }else if(limit_max_age < user_age && limit_max_age != 0){
    	   swal("나이 조건", "참가자의 나이가 제한 나이보다 많습니다.", "error");
       }else if(limit_gender != 'n' ){
    	   if(limit_gender != user_gender)
    		   swal("성별 조건", "참가자의 성별이 제한 성별과 다릅니다.", "error");
       }else{
    	   swal({
    		   title: "참여",
    		   text: "현재 보고 계신 Meeting 에 참여하시겠습니까?",
    		   icon: "info",
    		   buttons: true,
    		   dangerMode: true,
    		 })
    		 .then((willDelete) => {
    		   if (willDelete) {
    		     swal("성공","성공적으로 참여되었습니다.", {
    		       icon: "success",
    		     }).then((value) => {
    		    	 location.href="/MeetingAttend?MB_NO="+ ${detail.MB_NO};
    			   });
    		   } else {
    		   }
    		 });
       }
   }
   
   function AttendcancelClick(){
	   swal({
		   title: "참여 취소",
		   text: "참석을 취소하시겠습니까?",
		   icon: "warning",
		   buttons: true,
		   dangerMode: true,
		 })
		 .then((willDelete) => {
		   if (willDelete) {
		     swal("취소","참여를 취소하였습니다.", {
		       icon: "success",
		     }).then((value) => {
		    	 location.href="/MeetingAttendCancel?MB_NO="+ ${detail.MB_NO};
		    	 
			   });
		   } else {
		   }
		 });
   }
   
</script>
</html>