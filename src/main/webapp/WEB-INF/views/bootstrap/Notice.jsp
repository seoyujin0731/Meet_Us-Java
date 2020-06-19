</html><%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="en">
<head>
<title>Meet us</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<script type="text/javascript">
	function noticeDetail(board_no) {
		location.href = "/NoticeDetail?board_no=" + board_no;
	}
	function enterCheck(keyword) {
		let test = keyword.value();
        if (event.keyCode == 13) {
           //SearchPlace();
    		location.href = "/NoticeDetail?board_no=" + board_no;
        }
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
							class="ion-ios-arrow-forward"></i></a></span> <span>Notice <i
						class="ion-ios-arrow-forward"></i></span>
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
				<p class="jg" style="font-size: 30px;">공지사항</p>
			</div>
		</div>
		<div class="row"></div>
	</div>
	</section>

	<div class="sidebar-box ftco-animate" style="padding-left:10%; padding-right:10%;">
		<!--       <h3 class="heading-sidebar">Notice</h3> -->
		<ul class="categories">
			<c:forEach var="list" varStatus="i" items="${list }">
				<li><a href="../NoticeDetail?board_no=${list.board_no }"><span>${list.board_insertdate }&nbsp&nbsp(${list.board_viewcount})</span><br>${list.board_title }</a>
				</li>
			</c:forEach>
		</ul>
		<!-- 		</div> -->

<!-- 관리자 페이지로 이전 -->
		<div class="tag-widget post-tag-container mb-5 mt-5">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="tagcloud">
				<a href="../NoticeInsert" class="tag-cloud-link">공지사항 추가</a>
			</div>
		</sec:authorize>
		</div>

<!-- 		<div class="sidebar-box"> -->
			<form action="/NoticeSearchList" class="search-form" style="margin:2rem;">
				<div class="form-group">
					<span class="icon icon-search"></span> 
					<input type="text" id = "keyword" name = "keyword" class="form-control" onkeydown="JavaScript:enterCheck()" placeholder="제목 or 본문 검색">
				</div>
			</form>
<!-- 		</div> -->

		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<c:choose>
							<c:when test="${pageCriteria.keyword == null}"> <!-- 전체 리스트 출력 시 -->
								<c:if test="${pageMaker.prev }">
									<li><a href='<c:url value="/Notice?page=${pageMaker.startPage-1 }"/>'>&lt;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<c:choose>
    	  								<c:when test="${idx == pageCriteria.page}"> 
											<li class="active"><a href='<c:url value="/Notice?page=${idx }"/>'>${idx }</a></li>
       		 							</c:when>         
        								<c:otherwise>
											<li><a href='<c:url value="/Notice?page=${idx }"/>'>${idx }</a></li>
         								</c:otherwise>
    								</c:choose>	
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
									<li><a href='<c:url value="/Notice?page=${pageMaker.endPage+1 }"/>'>&gt;</a></li>
								</c:if>
							</c:when>
							
							<c:otherwise> <!-- 검색된 키워드로 리스트 출력 시 -->
								<c:if test="${pageMaker.prev }">
									<li><a href='<c:url value="/NoticeSearchList?keyword=${pageCriteria.keyword }&page=${pageMaker.startPage-1 }"/>'>&lt;</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<c:choose>
    	  								<c:when test="${idx == pageCriteria.page}"> 
											<li class="active"><a href='<c:url value="/NoticeSearchList?keyword=${pageCriteria.keyword }&page=${idx }"/>'>${idx }</a></li>
       		 							</c:when>         
        								<c:otherwise>
											<li><a href='<c:url value="/NoticeSearchList?keyword=${pageCriteria.keyword }&page=${idx }"/>'>${idx }</a></li>
         								</c:otherwise>
    								</c:choose>	
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
									<li><a href='<c:url value="/NoticeSearchList?keyword=${pageCriteria.keyword }&page=${pageMaker.endPage+1 }"/>'>&gt;</a></li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>

	</div>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px"> <circle
			class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4"
			stroke="#eeeeee" /> <circle class="path" cx="24" cy="24" r="22"
			fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
</body>
</html>