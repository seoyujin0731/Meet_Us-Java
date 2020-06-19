</html><%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Meet us</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<style type="text/css">
		.reButtonPosition p { right : 30px; }
	</style>
</head>

<script type="text/javascript">
	function contentWithline(content) {
		// alert("4");
		// alert("3");
		// location.href = "/NoticeDetail?board_no=" + board_no;
	}
</script>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/images/notice.jpg');"
		data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-start">
			<div class="col-md-9 ftco-animate pb-4">
				<h1 class="mb-3 bread">Notice</h1>
				<p class="breadcrumbs">
					<span class="mr-2"><a href="../">Home <i
							class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
						href="../Notice">Notice <i class="ion-ios-arrow-forward"></i></a></span>
					<span>Notice Detail<i class="ion-ios-arrow-forward"></i></span>
				</p>
			</div>
		</div>
	</div>
	</section>

	<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-8-1 ftco-animate">
				<!-- 제목 -->
				
				<h7 class="float-right" style="font-size:11px;"><br>작성일 : ${ detail.board_insertdate} <br>수정일 : ${ detail.board_modifydate}</h7>
				<h2 class="jg" style="margin-bottom:0;"><strong>${detail.board_title }</strong></h2>
				<hr>
				<!-- 내용 -->
				<p class="mb-3">${detail.board_content }</p>
<!-- 				첨부파일 폼 -->
				<c:choose>
					<c:when test="${!empty files}">
							<hr>
							<div class="form-group">
								첨부파일 다운로드
<!-- 								<label>첨부파일</label> -->
								<c:forEach var="files" varStatus="i" items="${files }">
									<p>
										<a href="///fileDown/${files.up_Seq}/${files.seq}">${files.file_Real_Name}</a>
									</p>
								</c:forEach>
							</div>
					</c:when>
				</c:choose>


				<div class="tag-widget post-tag-container mb-5 mt-5">
					<div class="tagcloud">
						<a href="../Notice" class="tag-cloud-link">File Add</a>
						<a href="../NoticeModify?board_no=${detail.board_no}" class="tag-cloud-link">MODIFY</a> 
						<a href="../NoticeDelete?board_no=${detail.board_no}" class="tag-cloud-link">DELETE</a>
						<a href="../Notice" class="tag-cloud-link">Back</a>
					</div>
				</div>


				<!-- 관리자 프로필 -->
				<div class="about-author d-flex p-4 bg-light">
					<div class="bio mr-5">
						<img src="resources/images/person_1.jpg" alt="Image placeholder"
							class="img-fluid mb-4">
					</div>
					<div class="desc">
						<h3>${detail.user_id }</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ducimus itaque, autem necessitatibus voluptate quod mollitia
							delectus aut, sunt placeat nam vero culpa sapiente consectetur
							similique, inventore eos fugit cupiditate numquam!</p>
					</div>
				</div>
			</div>
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
</html>