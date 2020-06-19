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
</head>

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
				<p class="breadcrumbs">
					<span class="mr-2"><a href="../">Home <i
							class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
						href="../Notice">Notice <i class="ion-ios-arrow-forward"></i></a></span>
					<span>Notice Insert<i class="ion-ios-arrow-forward"></i></span>
				</p>
				</p>
			</div>
		</div>
	</div>
	</section>

	<section>
	<div class="container">
		<!-- 		<div class="row"> -->

		<!-- END comment-list -->

		<div class="comment-form-wrap pt-5">
			<h3 class="mb-5">Notice Insert</h3> 

			<!-- Æû -->
			<form action="/NoticeInsertProcess" class="p-5 bg-light" enctype="multipart/form-data" method="post" >
				<div class="form-group">
					<label for="name">Title</label> <input type="text"
						class="form-control" name="board_title" id="board_title" required>
				</div>

				<div class="form-group">
					<label for="message">Notice</label>
					<textarea name="board_content" id="board_content" cols="30" rows="10"
						class="form-control" required></textarea> <%-- <c:out value="${content}" /> --%>
						
				</div>
				
<!-- 		  	Ã·ºÎÆÄÀÏ Æû -->
				<div class="form-group">
					<label for="message">File Add</label>
					<div class="card">
						<div id="fileDiv">
							<div class="form-group" style="margin: 20px;">
								<input type="file" multiple="multiple" name="files" id="files" class="form-control-file" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary" >
					<input type="button" value="Back" class="btn py-3 px-4 btn-primary" onclick="cencle_click()" style="margin:10px;">
				</div>
			</form>

		</div>
	</div>
	<!-- 	</div> --> </section>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px"> <circle
			class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4"
			stroke="#eeeeee" /> <circle class="path" cx="24" cy="24" r="22"
			fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	
<script>
function cencle_click(){
	location.href="../Notice";
}

</script>

</body>
</html>