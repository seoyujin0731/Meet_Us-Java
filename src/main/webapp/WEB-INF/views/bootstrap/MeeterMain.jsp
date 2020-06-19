<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
		style="background-image: url('resources/images/meeting.jpg');"
		data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-start">
			<div class="col-md-9 ftco-animate pb-4">
				<h1 class="mb-3 bread">Meeting</h1>
				<p class="breadcrumbs">
					<span class="mr-2"><a href="../">Home <i
							class="ion-ios-arrow-forward"></i></a></span> <span>Meeting <i
						class="ion-ios-arrow-forward"></i></span>
				</p>
			</div>
		</div>
	</div>
	</section>
	
	     <div class="row justify-content-center" style="margin:2rem;">
          <div class=" heading-section text-center ftco-animate">
            <span class="subheading"><p class="jg">직접 만나요!</p></span>
            <h2 class="mb-4">Our Meeting</h2>
            <p class="jg">직접 사람들을 모아 보기도 하고<br>다른 사람이 만든 모임에 참여도 할 수도 있습니다.</p>
          </div>
        </div>
        
	<section class="ftco-section" style="padding-top:0;">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 pr-lg-4">
				<div class="row">
					<c:if  test="${fn:length(arrayList) == 0}">
					<h4 class="col-md-6 col-lg-4 ftco-animate"><p class="jg" style="color:#e2c0bb; text-align: center;">검색 결과가 없습니다.</p></h4>
					<input type="button" value="전체 Meeting 보기" class="btn py-3 px-4 btn-primary ftco-animate" onclick="location.href='/MeeterMain'" style="margin:3rem; width:100%;">
					</c:if>
					<c:forEach var="arrayList" varStatus="i" items="${arrayList }">
						<div class="col-md-6-1 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
								<c:choose>
									<c:when test="${!empty arrayList.getFILE_PATH()}" >
									<a
										href="../MeeterDetail?MB_NO=${arrayList.getMB_NO() }">
										<img src="${arrayList.getFILE_PATH() }" style="height:14rem; width:100%;"
										class="img-fluid" alt="Colorlib Template">
									</a>
									</c:when>
									<c:otherwise>
									<a
										href="../MeeterDetail?MB_NO=${arrayList.getMB_NO() }">
										<img src="resources/images/gallery-1.jpg" style="height:14rem; width:100%;"
										class="img-fluid" alt="Colorlib Template">
									</a>
									</c:otherwise>
								</c:choose>
								</div>
								<div class="text">
									<h4 class="price">
										<c:choose>
											<c:when test="${arrayList.getMB_CURRENT_MEMBER() == arrayList.getMB_MEMBER()}">
												<span class="old-price">${arrayList.getMB_CURRENT_MEMBER() }/${arrayList.getMB_MEMBER()	}</span>
											</c:when>
											<c:otherwise>
												${arrayList.getMB_CURRENT_MEMBER() }&nbsp/&nbsp${arrayList.getMB_MEMBER() }
											</c:otherwise>
										</c:choose>
									</h4>
									<h5>
										<a href="../MeeterDetail?MB_NO=${arrayList.getMB_NO() }"><p class="jg" style="margin-top:1rem; margin-bottom:0; font-size:14px;">#${arrayList.getMB_PURPOSE() }<br>#${arrayList.getMB_PLACE() }<br>#${arrayList.getMB_MEETING_DATE() }<br>#${arrayList.getMB_MEETING_TIME() }</p></a>
									</h5>
									<h3>
										<a href="../MeeterDetail?MB_NO=${arrayList.getMB_NO() }"><p class="jg" style="margin-bottom:0;">${arrayList.getMB_TITLE() }</p></a>
									</h3>
									
									<div class="star d-flex clearfix" style="float:left;">
											<span class="rate"><a href="#"><strong>작성자 :
													${arrayList.getMB_WRITER() }</strong></a></span>
									</div>
									<div class="star d-flex clearfix" style="float:right;">
											<span class="rate"><a href="#"><strong>조회수 :
													${arrayList.getMB_VIEW_COUNT() }</strong></a></span>
									</div>
								</div>
							</div>
						</div>
<%-- 						</c:forEach> --%>
					</c:forEach>
				</div>
				<div class="row mt-5" style="margin-bottom:3rem;">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<c:choose>
									<c:when test="${empty pageCriteria.getPlaceKeyword() and empty pageCriteria.getPurposeKeyword() and empty pageCriteria.getDateKeyword() and empty pageCriteria.getTitleKeyword()}">
										<!-- 전체 리스트 출력 시 -->
										<c:if test="${pageMaker.prev }">
											<li><a
												href='<c:url value="/MeeterMain?page=${pageMaker.startPage-1 }"/>'>&lt;</a></li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }" var="idx">
											<c:choose>
												<c:when test="${idx == pageCriteria.page}">
													<li class="active"><a
														href='<c:url value="/MeeterMain?page=${idx }"/>'>${idx }</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href='<c:url value="/MeeterMain?page=${idx }"/>'>${idx }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
											<li><a
												href='<c:url value="/MeeterMain?page=${pageMaker.endPage+1 }"/>'>&gt;</a></li>
										</c:if>
									</c:when>

									<c:otherwise>
										<!-- 검색된 키워드로 리스트 출력 시 -->
										<c:if test="${pageMaker.prev }">
											<li><a
												href='<c:url value="/MeetingBoardSearchList?PlaceKeyword=${pageCriteria.getPlaceKeyword() }&PurposeKeyword=${pageCriteria.getPurposeKeyword() }&DateKeyword=${pageCriteria.getDateKeyword() }&TitleKeyword=${pageCriteria.getTitleKeyword() }&page=${pageMaker.startPage-1 }"/>'>&lt;</a></li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }"
 											end="${pageMaker.endPage }" var="idx"> 
 											<c:choose> 
 												<c:when test="${idx == pageCriteria.page}"> 
												<li class="active"><a
 														href='<c:url value="/MeetingBoardSearchList?PlaceKeyword=${pageCriteria.getPlaceKeyword() }&PurposeKeyword=${pageCriteria.getPurposeKeyword() }&DateKeyword=${pageCriteria.getDateKeyword() }&TitleKeyword=${pageCriteria.getTitleKeyword() }&page=${idx }"/>'>${idx }</a></li> 
 												</c:when> 
 												<c:otherwise> 
 													<li><a
 														href='<c:url value="/MeetingBoardSearchList?PlaceKeyword=${pageCriteria.getPlaceKeyword() }&PurposeKeyword=${pageCriteria.getPurposeKeyword() }&DateKeyword=${pageCriteria.getDateKeyword() }&TitleKeyword=${pageCriteria.getTitleKeyword() }&page=${idx }"/>'>${idx }</a></li> 
 												</c:otherwise> 
 											</c:choose> 
 										</c:forEach> 
 										<c:if test="${pageMaker.next && pageMaker.endPage >0 }"> 
 											<li><a
 												href='<c:url value="/MeetingBoardSearchList?PlaceKeyword=${pageCriteria.getPlaceKeyword() }&PurposeKeyword=${pageCriteria.getPurposeKeyword() }&DateKeyword=${pageCriteria.getDateKeyword() }&TitleKeyword=${pageCriteria.getTitleKeyword() }&page=${pageMaker.endPage+1 }"/>'>&gt;</a></li> 
 										</c:if> 
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- end -->
			<div class="col-lg-3 p-4 bg-light">
				<div class="search-wrap-1 ftco-animate">

						<div class="row">
							<div class="col-lg-12 align-self-end">
								<div class="form-group">
									<div class="form-field" style="margin-top:1rem; margin-bottom:2rem;">
										<input type="button" onclick="location.href='../MeeterInsert'" value="Meeting Create" class="form-control btn btn-primary" style="background: #e8705e !important;">
									</div>
								</div>
							</div>
						</div>

					<h2>Find Meeting</h2>
					<form action="/MeetingBoardSearchList" class="search-property-1">
						<div class="row">
							<div class="col-lg-12 align-items-end mb-3">
								<div class="form-group">
									<label for="PlaceKeyword">Place</label>
									<div class="form-field">
										<input type="text" class="form-control" id="PlaceKeyword" name="PlaceKeyword" autocomplete="off"
											placeholder="장소 검색">
									</div>
								</div>
							</div>
							<div class="col-lg-12 align-items-end mb-3">
								<div class="form-group">
									<label for="PurposeKeyword">Purpose</label>
									<div class="form-field">
										<input type="text" class="form-control checkin_date" id="PurposeKeyword" name="PurposeKeyword" autocomplete="off"
											placeholder="(주류, 스터디, 운동, 카페 등)">
									</div>
								</div>
							</div>
							<div class="col-lg-12 align-items-end mb-3">
								<div class="form-group">
									<label for="DateKeyword">Date</label>
									<div class="form-field">
										<input type="date" class="form-control checkout_date" id="DateKeyword" name="DateKeyword" autocomplete="off"
											placeholder="날짜 검색">
									</div>
								</div>
							</div>
							<div class="col-lg-12 align-items-end mb-3">
								<div class="form-group">
									<label for="TitleKeyword">Title</label>
									<div class="form-field">
										<input type="text" class="form-control checkout_date" id="TitleKeyword" name="TitleKeyword" autocomplete="off"
											placeholder="제목 검색">
									</div>
								</div>
							</div>
							<div class="col-lg-12 align-self-end">
								<div class="form-group">
									<div class="form-field">
										<input type="submit" value="Search"
											class="form-control btn btn-primary">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- end -->
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
<script>
var 
</script>
</html>