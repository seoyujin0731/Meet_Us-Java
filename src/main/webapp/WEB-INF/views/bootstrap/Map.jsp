<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <title>Meet Us</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <style>
    .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
    .placeinfo {position:relative;width:70%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
    .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
    .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:20px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
    .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
    .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
    .placeinfo .tel {color:#0f7833;}
    .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
    /* �߰����� ��Ÿ�� */
    .hAddr {font-size:10px; position:absolute;left:30px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    @media(min-width:700px){.hAddr {font-size:15px; position:absolute;left:30px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .title {font-weight:bold;display:block;}
    
	</style> 

 </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	  
	  <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/place.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">Map</h1>
            <p class="breadcrumbs">
					<span class="mr-2"><a href="../">Home <i
							class="ion-ios-arrow-forward"></i></a></span> <span>Map <i
						class="ion-ios-arrow-forward"></i></span>
				</p>
          </div>
        </div>
      </div>
    </section>
    
        <div class="row justify-content-center" style="margin:2rem;">
          <div class=" heading-section text-center ftco-animate">
            <span class="subheading"><p class="jg">���⼭ ������!</p></span>
            <h2 class="mb-4">Our Place</h2>
            <p class="jg">���ΰ� �����ϴ� �ո����� ���� ��Ҹ� ã�ƺ�����.<br>�ִ� 5��ҿ� ���� �߰������� ã�� �� �ֽ��ϴ�.<br>ã�� �߰��������� �ڼ��� ��Ұ˻��� �� ���� ����.<br></p>
          </div>
        </div>

    <section class="ftco-section" style="padding-top:0;">
      <div class="container">
		<div class="row">
			<div class="col-lg-8 ftco-animate">
<!-- 			<div class="map_wrap"> -->
				<div id="map"></div>
					<div id="centerInfoDiv">
					</div>
<!-- 				</div> -->
			</div>

			<div class="col-lg-4 sidebar ftco-animate">
				<div class="sidebar-box-lee" style="margin-top:2rem;">
					<form action="#" class="search-form" onkeypress="return event.keyCode != 13;">
						<div class="form-group">
							<span class="icon icon-search" onclick="SearchPlace()" style="cursor: pointer;"></span> <input type="text" id="SearchPlaceId"
								class="form-control" placeholder="Place Searching" onkeydown="JavaScript:Enter_Check()" >
						</div>
						<div class="form-group" id="CenterPlaceKeyword">
						</div>
					</form>
				</div>
				<div class="sidebar-box-lee ftco-animate">
				<div id="meetingPlaceStyleId" style="margin-bottom:5%;" >
					<h3 class="heading-sidebar" style="margin-bottom:0;"><p class="jg" id="meetingPlaceId" style="margin-bottom:0;">Meeting Place</p></h3>
					<p id="meetingPlaceAddressId" style="font-size:80%;"></p>
				</div>
					<ul class="categories" id="Location">
						<li id="Location0"></li>
						<li id="Location1"></li>
						<li id="Location2"></li>
						<li id="Location3"></li>
						<li id="Location4"></li>
						<li></li>
					</ul>

					<div class="comment-form-wrap pt-5">

						<div class="form-group">
							<button type="button"
								onclick="centerView_click();"
								class="btn py-3 px-4 btn-warning" style="width: 100%; color: white; background:#e2c0bb; border-color: #e2c0bb;">Center View</button>
						</div>
						<div class="form-group">
							<button type="button" onclick="largeCenter_click();"
								class="btn py-3 px-4 btn-primary" style="width: 100%; background:#e8705e;">Large Center</button>
						</div>
						<div class="form-group">
							<button type="button" onclick="reset_click();"
								class="btn py-3 px-4 btn-dark" style="width: 100%;">Reset</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    </section> 
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
    
    
   	<!-- kakao map api & lib -->
	//app key ����
	<script>
	
	// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var markers = [];
	var centerPlace;
	
	// ��Ŀ�� Ŭ������ �� �ش� ����� �������� ������ Ŀ���ҿ��������Դϴ�
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	contentNode = document.createElement('div'); // Ŀ���� ���������� ������ ������Ʈ �Դϴ� 
    
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(37.4871566284483, 126.826600044574), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };  
	
	// Ŀ���� ���������� ������ ��忡 css class�� �߰��մϴ� 
	contentNode.className = 'placeinfo_wrap';
	
	// Ŀ���� �������� �������� �����մϴ�
	placeOverlay.setContent(contentNode);  
	
	// ������ �����մϴ�    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// ��� �˻� ��ü�� �����մϴ�
	var ps = new kakao.maps.services.Places(); 

	//�߰� ��ũ 
	// ��� �߽��� ��ũ
	var imageSrcCenter = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	var imageSize = new kakao.maps.Size(29, 35);
	var markerImageCenter = new kakao.maps.MarkerImage(imageSrcCenter, imageSize); 
	// ��Ŀ �̹����� �̹��� ũ�� �Դϴ� 
   
	
// 	��� �˻� �̺�Ʈ-------------------------------------------------------------------------------------------------------------------------------------------
	function SearchPlace(){
	// ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
	removeMarker();
	
	// ������ ǥ�õǰ� �ִ� ����â�� �����մϴ�
	placeOverlay.setMap(null);
		
	var place = document.getElementById('SearchPlaceId').value;
	

	// Ű����� ��Ҹ� �˻��մϴ�
	ps.keywordSearch(place, placesSearchCB); 

	// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
	        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	    } 
	    
	    else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	    	swal("��!", "�˻������ �����.", "error");
	    }
	    
	    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
        map.setBounds(bounds);
	}

	// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
	function displayMarker(place) {
		
	    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
	    var marker = new kakao.maps.Marker({
// 	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	    
	    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
	    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�
	    
	    
	    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
	    kakao.maps.event.addListener(marker, 'click', function() {
		 content = '<div class="placeinfo">'
											+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
											+ place.place_name + '</a>';

									if (place.road_address_name) {
										content += '    <span title="' + place.road_address_name + '">'
												+ place.road_address_name 
												+ '</span>'
												+ '  <span class="jibun" title="' + place.address_name + '">(���� : '
												+ place.address_name 
												+ ')</span>';
									} else {
										content += '    <span title="' + place.address_name + '">'
												+ place.address_name 
												+ '</span>';
									}

									content += '    <span class="tel">'
											+ place.phone + '</span>';
											
									content += '<button type="button" onclick="save_click('+"'"+ place.place_name +"'"+","+"'"+ place.y+"'"+","+"'"+ place.x+"'"+');" class="btn btn-success btn-sm" style="margin-left:26%; margin-top:10px;">����</button>'
											+ '<button type="button" onclick="close_window();" class="btn btn-dark btn-sm" style="margin-left:5%; margin-top:10px;">�ݱ�</button>'
											+ '</div>'
											+ '<div class="after"></div>';
											
									contentNode.innerHTML = content;
								    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
								    placeOverlay.setMap(map);
								    
								});
			}
		}
		

<!-- �ݱ� ��ư -->
	function close_window() {        
 	placeOverlay.setMap(null); 
	}


<!-- �ּ� ����  �̺�Ʈ ----------------------------------------------------------------------------------------------------------------------------->
	 var names = new Array();
 	 var nameCnt = 0;
	 var placey = new Array();
	 var placex = new Array();
	 var check = false;

		function save_click(name, placeY, placeX) {
			// ù��° �ּ� ����
			if(nameCnt == 0){
				names.push(name);
				placey.push(placeY);
				placex.push(placeX);
				nameCnt++;
				document.getElementById("Location0").innerHTML= '<li id="Location0">'+names[0]+'<span></span></a></li>';
				swal(name, "����Ǿ����ϴ�.");
			}
			
			else if(nameCnt > 0){
				if(nameCnt >= 5){
					swal("��!", "�ּҰ� �ʹ� �����ϴ�.", "error");
				}else{
					//�ߺ� �ּ� �˻�
					for(var i=0; i<nameCnt; i++){
						if(names[i] == name){
							check = true;
						}
					}
					if(check == true){
						swal("����!", name+"��(��) �̹� ����� �ּ��Դϴ�.", "error");
						check = false;
					}else if(check == false){
						names[nameCnt] = name;
						placey[nameCnt] = placeY;
						placex[nameCnt] = placeX;
						swal(name, "����Ǿ����ϴ�.");
						nameCnt++;
					}
					for(var i=1; i<nameCnt; i++){
// 						document.getElementById("Location"+i).innerHTML= names[i];
						document.getElementById("Location"+i).innerHTML= '<li id="Location'+i+ '">'+names[i]+'<span></span></a></li>';
					}
				}
			}
		}

	
	
<!-- ���� �Է½� �̺�Ʈ ------------------------------------------------------------------------------------------------->
		function Enter_Check() {
			// ����Ű�� �ڵ�� 13�Դϴ�.
			if (event.keyCode == 13) {
				SearchPlace();
			}
		}
		
		function Enter_Check_keyword() {
			// ����Ű�� �ڵ�� 13�Դϴ�.
			if (event.keyCode == 13) {
				CenterPlaceKeyword();
			}
		}

	
	
<!-- centerView Ŭ���� ---------------------------------------------------------------------------------------------->
	let RcenterY = 0;
	let RcenterX = 0;
	
	function centerView_click(){ 
		
	if(names.length < 2){
		swal("����!", "����� �ּҰ� �ʹ� �����ϴ�.", "error");
	}else{
	document.getElementById('CenterPlaceKeyword').innerHTML='	<span class="icon icon-search" onclick="CenterPlaceKeyword()" style="cursor: pointer;"></span> <input type="text" id="CenterPlaceKeywordId" class="form-control" placeholder="Category Keyword" onkeydown="JavaScript:Enter_Check_keyword()" >';
	
	removeMarker();
	placeOverlay.setMap(null);
		
	// 	�߽���ǥ
	var centerY = 0;
	var centerX = 0;
	
	// ��Ŀ �̹����� �̹��� �ּ��Դϴ� 
	var imageSrc = "resources/images/map-marker-icon.png";  
	
	for (var i = 0; i < nameCnt; i++) { 
	
// 	    // ��Ŀ �̹����� �̹��� ũ�� �Դϴ� 
// 	    var imageSize = new kakao.maps.Size(29, 35);  
	
	    // ��Ŀ �̹����� �����մϴ�     
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);  
	    
	    var latlng = new kakao.maps.LatLng(placey[i], placex[i]); 
	    var title = names[i]; 
	    
	    //�߽���ǥ ���ϱ�
	    centerY += placey[i]*1;
	    centerX += placex[i]*1;

	    // ��Ŀ�� �����մϴ� 
	    var marker = new kakao.maps.Marker({ 
	        position: latlng, // ��Ŀ�� ǥ���� ��ġ 
	        title : title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
	        image : markerImage // ��Ŀ �̹���  
	    }); 
	    
	    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
	    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�
	    
	}
	

		// �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
			// LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
			var bounds = new kakao.maps.LatLngBounds();

			for (var i = 0; i < nameCnt; i++) {
				bounds.extend(new kakao.maps.LatLng(placey[i], placex[i]));
			}

			// �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
			map.setBounds(bounds);
			

// 			var markerImageCenter = new kakao.maps.MarkerImage(imageSrcCenter, imageSize);
			
			// �߽��� ��Ŀ�� �����մϴ� 
		    var marker = new kakao.maps.Marker({ 
		        position: new kakao.maps.LatLng(centerY/(nameCnt*1.0), centerX/(nameCnt*1.0)), // ��Ŀ�� ǥ���� ��ġ 
		        title : "�߽�", // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
		        image : markerImageCenter // ��Ŀ �̹���  
		    }); 
			
		    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
		    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�
			
			 RcenterY = centerY/(nameCnt*1.0);
			 RcenterX = centerX/(nameCnt*1.0);
			 
			 
			 var centerInfoDiv = document.getElementById('centerInfoDiv');
			 centerInfoDiv.innerHTML = '<div class="hAddr"><span class="title">�����߽ɱ��� ������ �ּ�����</span><span id="centerAddr"></span></div>';
			 
			 
		//�߽� ��ǥ �ּ� ǥ��â
			// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
			 var geocoder = new kakao.maps.services.Geocoder();
		
			// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
			 searchAddrFromCoords(new kakao.maps.LatLng(centerY/(nameCnt*1.0), centerX/(nameCnt*1.0)) , displayCenterInfo);
			
			 function searchAddrFromCoords(coords, callback) {
				    // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}

				// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
			 function displayCenterInfo(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        var infoDiv = document.getElementById('centerAddr');

				        for(var i = 0; i < result.length; i++) {
				            // �������� region_type ���� 'H' �̹Ƿ�
				            if (result[i].region_type === 'H') {
				                infoDiv.innerHTML = result[i].address_name;
				                centerPlace = result[i].address_name;
				                break;
				            }
				        }
				    }    
				}
			
		}
	}


 
<!-- largeCenter_click �̺�Ʈ ----------------------------------------------------------------------------------------------------------------> 
 	function largeCenter_click(){
 		if(names.length < 2){
 			swal("����!", "����� �ּҰ� �ʹ� �����ϴ�.", "error");
 		}else{
		removeMarker();
		
		map.setCenter(new kakao.maps.LatLng(RcenterY, RcenterX));
		map.setLevel(5);
		    
		// ��� �˻� ��ü�� �����մϴ�
// 		var ps = new kakao.maps.services.Places(map); 
		
		var imageSrcCenter = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		// ��Ŀ �̹����� �̹��� ũ�� �Դϴ� 
	    var imageSize = new kakao.maps.Size(29, 35);  
		var markerImageCenter = new kakao.maps.MarkerImage(imageSrcCenter, imageSize);
		
		// ��Ŀ ���
		var marker = new kakao.maps.Marker({ 
		    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
		    position: new kakao.maps.LatLng(RcenterY,RcenterX),
			image : markerImageCenter
		}); 
		// ������ ��Ŀ�� ǥ���մϴ�
		marker.setMap(map);
 		markers.push(marker);
		
		 var centerInfoDiv = document.getElementById('centerInfoDiv');
		 centerInfoDiv.innerHTML = '<div class="hAddr"><span class="title">�����߽ɱ��� ������ �ּ�����</span><span id="centerAddr"></span></div>';
		 
			//�߽� ��ǥ �ּ� ǥ��â
			// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
			 var geocoder = new kakao.maps.services.Geocoder();
		
			// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
			 searchAddrFromCoords(new kakao.maps.LatLng(RcenterY, RcenterX) , displayCenterInfo);
			
			 function searchAddrFromCoords(coords, callback) {
				    // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}

				// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
			 function displayCenterInfo(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        var infoDiv = document.getElementById('centerAddr');

				        for(var i = 0; i < result.length; i++) {
				            // �������� region_type ���� 'H' �̹Ƿ�
				            if (result[i].region_type === 'H') {
				                infoDiv.innerHTML = result[i].address_name;
				                centerPlace = result[i].address_name;
				                break;
				            }
				        }
				    }    
				}
 	 	}
 	}
 	
 	
 	
 	
<!--  	CenterPlaceKeyword �˻��� �̺�Ʈ ---------------------------------------------------------------------------------------------------> 
 	function CenterPlaceKeyword(){
 	removeMarker();
 	placeOverlay.setMap(null);
	var centerMarker = new kakao.maps.Marker({
	        position: new kakao.maps.LatLng(RcenterY, RcenterX),
	        image : markerImageCenter
	    });
	centerMarker.setMap(map);
// 	map.setCenter(new kakao.maps.LatLng(RcenterY, RcenterX));
	map.setLevel(5);
	
 
 	var placeKeyword = document.getElementById('CenterPlaceKeywordId').value;
 	centerPlace
 // Ű����� ��Ҹ� �˻��մϴ�
 	ps.keywordSearch(placeKeyword, placesSearchCB, {location:new kakao.maps.LatLng(RcenterY, RcenterX)}); 

 	// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
 	function placesSearchCB (data, status, pagination) {
 	    if (status === kakao.maps.services.Status.OK) {

 	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
 	        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
 	        var bounds = new kakao.maps.LatLngBounds();

 	        for (var i=0; i<data.length; i++) {
 	            displayMarker(data[i]);    
 	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
 	        }       
 	    }

 	     else if (status === kakao.maps.services.Status.ZERO_RESULT) {
 	    	
	    }
	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
     		map.setBounds(bounds);
 	}

 	// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
 	function displayMarker(place) {
 	    
 	    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
 	    var marker = new kakao.maps.Marker({
 	        position: new kakao.maps.LatLng(place.y, place.x) 
 	    });
 	   
		marker.setMap(map);
		markers.push(marker);

	    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
	    kakao.maps.event.addListener(marker, 'click', function() {
		 content = '<div class="placeinfo">'
											+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
											+ place.place_name + '</a>';

									if (place.road_address_name) {
										content += '    <span title="' + place.road_address_name + '">'
												+ place.road_address_name 
												+ '</span>'
												+ '  <span class="jibun" title="' + place.address_name + '">(���� : '
												+ place.address_name 
												+ ')</span>';
									} else {
										content += '    <span title="' + place.address_name + '">'
												+ place.address_name 
												+ '</span>';
									}

									content += '    <span class="tel">'
											+ place.phone + '</span>';
											
									content += '<button type="button" onclick="meetingPlaceSave_click('+"'"+ place.place_name +"'"+","+"'"+ place.y+"'"+","+"'"+ place.x+"'"+","+"'"+ place.road_address_name +"'"+","+"'"+place.place_url+"'"+');" class="btn btn-success btn-sm" style="margin-left:9.5%; margin-top:10px;">Meeting Place</button>'
											+ '<button type="button" onclick="close_window();" class="btn btn-dark btn-sm" style="margin-left:5%; margin-top:10px;">�ݱ�</button>'
											+ '</div>'
											+ '<div class="after"></div>';
											
									contentNode.innerHTML = content;
								    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
								    placeOverlay.setMap(map);
								    
								    
								});
 							}
 			}
 	
<!-- meeting Place Ŭ�� �̺�Ʈ  ---------------------------------------------------------------------------------------------------------->
	var MeetingPlace;
	var MeetingY;
	var MeetingX;
	var MeetingAd
	
 	function meetingPlaceSave_click(placeName, y, x, address, url){
 		 MeetingPlace = placeName;
 		 MeetingY = y;
 		 MeetingX = x;
 		 MeetingAd = address;
 		 MeetingURL = url;
 		 
 		swal({
 			  title: MeetingPlace,
 			  text: "Meeting Place�� �����Ͻðڽ��ϱ�?",
 			  icon: "warning",
 			  buttons: true,
 			})
 			.then((willDelete) => {
 			  if (willDelete) {
 			    swal(MeetingPlace, MeetingPlace+"��(��) Meeting Place�� �����Ǿ����ϴ�.", {
 			      icon: "success",
 			    });

 			  document.getElementById('meetingPlaceStyleId').innerHTML = '<div style="margin-bottom:0; border-style:solid; border-color:#e2c0bb; border-width:4px; padding:5px;"><h3 class="heading-sidebar" style="margin-bottom:0;"><p class="jg" id="meetingPlaceId" style="margin-bottom:0;">' +MeetingPlace+ '</p></h3><p id="meetingPlaceAddressId" style="font-size:80%; margin-bottom:0;">'+address+'</p><button type="button" onclick="urlSave();" class="btn btn-dark btn-sm" style="width:100%; margin-top:10px; background-color:#e2c0bb; border-color:#e2c0bb;">URL ����</button></p><button type="button" onclick="meetingCreate('+"'"+ MeetingPlace+"'"+','+"'"+address+"'"+');" class="btn btn-dark btn-sm" style="width:100%; background-color:#e8705e; border-color:#e2c0bb;">Meeting �����</button></div>';
 			
 			   
 			   
 			  } 
 			});
 	}
	function meetingCreate(MeetingPlace, address){

		location.href="/MeeterFromMapInsert?MeetingPlace=" + MeetingPlace +"&address=" + address;
	}

	<!-- Meeting Place Ŭ���� Ŭ�����忡 url ���� -->
	 src="//code.jquery.com/jquery-3.2.1.min.js"
		function copyToClipboard(val) {
		  var t = document.createElement("textarea");
		  document.body.appendChild(t);
		  t.value = val;
		  t.select();
		  document.execCommand('copy');
		  document.body.removeChild(t);
		}
		function urlSave() {
		  copyToClipboard(MeetingURL);
		  swal("Ŭ������ ���� �Ϸ�");
		};
		
<!--  	reset ��ư Ŭ�� �̺�Ʈ -->
 	function reset_click(){
 		location.reload();
 	}
 	
<!-- 	��Ŀ ���� -->
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }
 </script>

</body>
</html>