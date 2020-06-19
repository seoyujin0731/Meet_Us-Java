<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
if(request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control","no-cache");
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
    @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
    .jg{font-family: 'Jeju Gothic', sans-serif;};
    </style>
	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/aos.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	
	<title>Meet_Us</title>
	</head>
	<body>
		
		<nav role="navigation">
		<tiles:insertAttribute name="header"  ignore="true"/>
		</nav>
		<main role="main flex-shrink-0">
			<tiles:insertAttribute name="body" ignore="true"/>
		</main>
		<footer role="footer">
			<tiles:insertAttribute name="footer" ignore="true"/>
		</footer>
		
  <!-- loader -->
<%--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> --%>

 
  <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/popper.min.js"/>"></script>
  <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
  <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
  <script src="<c:url value="/resources/js/aos.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
  <script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>
  <script src="<c:url value="/resources/js/main.js"/>"></script>
  
<!--   SweetAlert alert css  -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	</body>
</html>