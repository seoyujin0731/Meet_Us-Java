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
    <title>Meet Us</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	  
	  <section id="home-section" class="hero">
	  	<img src="${pageContext.request.contextPath}/resources/images/blob-shape-3.svg" class="svg-blob" alt="Colorlib Free Template">
		  <div class="home-slider owl-carousel">
	      
	      
	      <div class="slider-item"style="overflow-y : scroll; overflow-y:hidden; ">
	      	<div class="overlay"></div>
	        <div class="container-fluid p-0">
	          <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
	          	<div class="one-third order-md-last">
	          		<div class="img cipal" style="background-image:url(resources/images/place.jpg);" >
	          			<div class="overlay"></div>
	          		</div>
	          		<div class="bg-primary">
		          		<div class="vr"><span class="pl-3 py-4" style="background-image: url(resources/images/bg_1-1.jpg);">Place</span></div>
	          		</div>
	          	</div>
		          <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
		          	<div class="text">
		          		<span class="subheading pl-5">place</span>
			            <h1 class="jg">�츮 ��� ������?</h1>
			            <p>����� �׸�! �߰� ������ ã�� ��ΰ� ������ �ո����� ���� ��Ҹ� ã���� �����ݴϴ�.</p>
			            
			            <p><a href="../Map" class="btn btn-primary px-5 py-3 mt-3">Place Search  <span class="ion-ios-arrow-forward"></span></a></p>
		            </div>
		          </div>
	        	</div>
	        </div>
	      </div>

	      <div class="slider-item" style="overflow-y : scroll; overflow-y:hidden; ">
	      	<div class="overlay"></div>
	        <div class="container-fluid p-0">
	          <div class="row d-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
	          	<div class="one-third order-md-last">
	          		<div class="img cipal" style="background-image:url(resources/images/meeting.jpg);">
	          			<div class="overlay"></div>
	          		</div>
	          		<div class="vr"><span class="pl-3 py-4" style="background-image: url(resources/images/bg_2-2.jpg);">Meeting</span></div>
	          	</div>
		          <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
		          	<div class="text">
		          		<span class="subheading pl-5">Meeting</span>
			            <h1 class="jg">�츮 ������ ������?</span></h1>
			            <p>�ڽ��� ���ϴ� ������ ����� ������� �����ų�, ������� ���ӿ� ������ �� �ֽ��ϴ�.</p>
			            
			            <p><a href="../MeeterMain" class="btn btn-primary px-5 py-3 mt-3">Meeting Search <span class="ion-ios-arrow-forward"></span></a></p>
		            </div>
		          </div>
	        	</div>
	        </div>
	      </div>
	    </div>
    </section>

    
     <section class="ftco-section bg-light" id="blog-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading"><p class="jg">�츮 �������?</p></span>
            <h2 class="mb-4">Meet Us</h2>
            <p class="jg">���� ���� ���� meeting�� ��õ�ص帳�ϴ�. <br>�����е� �Բ� �����غ�����.</p>
          </div>
        </div>
        <div class="row d-flex">
          <c:forEach var="list" varStatus="i" items="${list }">
          <div class="col-md-6 col-lg-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end" style="width:100%;">
          	<c:if test="${empty list.getFILE_PATH() }">
          	<a href="../MeeterDetail?MB_NO=${list.getMB_NO() }" class="block-20" style="background-image: url('resources/images/image_3.jpg');"></a>
          	</c:if>
          	<c:if test="${!empty list.getFILE_PATH() }">
          	<a href="../MeeterDetail?MB_NO=${list.getMB_NO() }" class="block-20" style="background-image: url('${list.getFILE_PATH()}');"></a>
          	</c:if>
<%--               <a href="../MeeterDetail?MB_NO=${list.getMB_NO() }" class="block-20" style="background-image: url('${list.getFILE_PATH()}');"></a> --%>
              <div class="text float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="yr">
              			<span class="day">${list.getMB_CURRENT_MEMBER()}/${list.getMB_MEMBER()}</span>
              			
              		</div>
              	</div>
              	<p class="jg" style="color:#e2c0bb;"><a href="../MeeterDetail?MB_NO=${list.getMB_NO() }">#${list.getMB_PURPOSE()}#${list.getMB_PLACE()}#${list.getMB_MEETING_DATE()}#${list.getMB_MEETING_TIME()}</a></p>
                <h3 class="heading"><a href="../MeeterDetail?MB_NO=${list.getMB_NO() }"><p class="jg">${list.getMB_TITLE()}</p></a></h3>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="../MeeterDetail?MB_NO=${list.getMB_NO() }" class="btn btn-primary">Read More <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                	<a href="../MeeterDetail?MB_NO=${list.getMB_NO() }" class="mr-2">${list.getMB_WRITER()}</a>
	                	<a href="../MeeterDetail?MB_NO=${list.getMB_NO() }" class="meta-chat"><span class="icon-eye"></span> ${list.getMB_VIEW_COUNT()}</a>
	                </p>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
          
        </div>
      </div>
    </section>
		
    <section class="ftco-intro img" id="destination-section" style="background-image: url(resources/images/happy_meeting.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-9 text-center">
						<h2>Create Meeting</h2>
						<p class="jg">������ ��� ������ ��������? <br>�׷� ���� ������� ��ƺ�����!</p>
						<p class="mb-0"><a href="../MeeterInsert" class="btn btn-white px-4 py-3">Create</a></p>
					</div>
				</div>
			</div>
		</section>

   

    <section class="ftco-section contact-section" id="contact-section">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading"><p class="jg">�ñ��ؿ�</p></span>
            <h2 class="mb-4">Contact Me</h2>
            <p class="jg">�������� �ñ��� ���̳� ������ ���� �˷��ּ���. <br>������ �ذ��� �帳�ϴ�.</p>
          </div>
        </div>

        <div class="row block-9">
          <div class="col-md-7 order-md-last d-flex">
            <form action="#" class="bg-light p-4 p-md-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>
        </div>
      </div>
    </section>

  </body>
</html>