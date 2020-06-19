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
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<!-- 중바꿈 태그 변환 처리 -->
	<script type="text/javascript">
		$(document).ready(function() {

			var description = '${modify.board_content}';
			result = description.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
			$('#board_content').val(result);
		});
	</script>


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
					<span>Notice Modify<i class="ion-ios-arrow-forward"></i></span>
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
			<h3 class="mb-5">Notice Modify</h3>
			<hr>
			<!-- 폼 -->
			<form action="/NoticeModifyProcess" class="p-5 bg-light" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="name">Title</label> <input type="text"
						class="form-control" name="board_title" id="board_title"
						value="${modify.board_title }">
				</div>

				<div class="form-group">
					<label for="message">Notice</label>
					<textarea name="board_content" id="board_content" cols="30"
						rows="10" class="form-control"></textarea>
				</div>
				
												<div class="col-lg-13" style="margin-bottom: 1rem;">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">첨부파일 수정</h4>
											<div class="basic-form">
												<div id="fileDiv" >
													<div class="form-group">
														<input type="file" multiple="multiple" name="files" class="form-control-file">
													</div>
													<c:choose>
														<c:when test="${!empty files}">
															<div class="card-body">
															<div class="card" style="padding:1rem;">
																<div class="form-group">
																	<!-- 첨부파일 다운로드 -->
																	<label>첨부파일 삭제 </label>
																	<c:forEach var="files" varStatus="i" items="${files }">
																		<p>
																				${files.file_Real_Name}&nbsp;&nbsp;&nbsp;&nbsp;
																				<button type="button" class="btn btn-danger btn-sm" id="modigyBtn" onclick="modifyBtn_click(${files.up_Seq},${files.seq});">
																				 x
																				</button>
																		</p> 
																	</c:forEach>
																</div>
															</div>
															</div>
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</div>
				
				<div class="form-group">
					<input type="hidden" name="board_no" id="board_no" value="${modify.board_no}" /> <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
					<input type="button" value="Back" class="btn py-3 px-4 btn-primary" onclick="location.href='../NoticeDetail?board_no='+'${modify.board_no}'" style="margin:10px;">
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
function modifyBtn_click(upSeq, seq, team) {
	swal({
		  title: "첨부파일을 삭제합니까?",
		  text: "첨부파일을 삭제하면 지금까지 수정한 제목과 내용은 초기화됩니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    location.href='/fileDelete/'+ upSeq + '/' +seq ;
		  } 
		  else {
		  }
		});
}
</script>
</body>
</html>