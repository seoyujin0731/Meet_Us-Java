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
    /* 중간지점 스타일 */
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
            <span class="subheading"><p class="jg">여기서 만나요!</p></span>
            <h2 class="mb-4">Our Place</h2>
            <p class="jg">서로가 인정하는 합리적인 만남 장소를 찾아보세요.<br>최대 5장소에 대한 중간지점을 찾을 수 있습니다.<br>찾은 중간지점에서 자세한 장소검색을 할 수도 있죠.<br></p>
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
	//app key 제거
	<script>
	
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var markers = [];
	var centerPlace;
	
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	contentNode = document.createElement('div'); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.4871566284483, 126.826600044574), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';
	
	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	//중간 마크 
	// 장소 중심점 마크
	var imageSrcCenter = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	var imageSize = new kakao.maps.Size(29, 35);
	var markerImageCenter = new kakao.maps.MarkerImage(imageSrcCenter, imageSize); 
	// 마커 이미지의 이미지 크기 입니다 
   
	
// 	장소 검색 이벤트-------------------------------------------------------------------------------------------------------------------------------------------
	function SearchPlace(){
	// 지도에 표시되고 있는 마커를 제거합니다
	removeMarker();
	
	// 지도에 표시되고 있는 정보창을 제거합니다
	placeOverlay.setMap(null);
		
	var place = document.getElementById('SearchPlaceId').value;
	

	// 키워드로 장소를 검색합니다
	ps.keywordSearch(place, placesSearchCB); 

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	    } 
	    
	    else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	    	swal("헛!", "검색결과가 없어요.", "error");
	    }
	    
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
		
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
// 	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	    
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	    
	    
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
		 content = '<div class="placeinfo">'
											+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
											+ place.place_name + '</a>';

									if (place.road_address_name) {
										content += '    <span title="' + place.road_address_name + '">'
												+ place.road_address_name 
												+ '</span>'
												+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
												+ place.address_name 
												+ ')</span>';
									} else {
										content += '    <span title="' + place.address_name + '">'
												+ place.address_name 
												+ '</span>';
									}

									content += '    <span class="tel">'
											+ place.phone + '</span>';
											
									content += '<button type="button" onclick="save_click('+"'"+ place.place_name +"'"+","+"'"+ place.y+"'"+","+"'"+ place.x+"'"+');" class="btn btn-success btn-sm" style="margin-left:26%; margin-top:10px;">저장</button>'
											+ '<button type="button" onclick="close_window();" class="btn btn-dark btn-sm" style="margin-left:5%; margin-top:10px;">닫기</button>'
											+ '</div>'
											+ '<div class="after"></div>';
											
									contentNode.innerHTML = content;
								    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
								    placeOverlay.setMap(map);
								    
								});
			}
		}
		

<!-- 닫기 버튼 -->
	function close_window() {        
 	placeOverlay.setMap(null); 
	}


<!-- 주소 저장  이벤트 ----------------------------------------------------------------------------------------------------------------------------->
	 var names = new Array();
 	 var nameCnt = 0;
	 var placey = new Array();
	 var placex = new Array();
	 var check = false;

		function save_click(name, placeY, placeX) {
			// 첫번째 주소 저장
			if(nameCnt == 0){
				names.push(name);
				placey.push(placeY);
				placex.push(placeX);
				nameCnt++;
				document.getElementById("Location0").innerHTML= '<li id="Location0">'+names[0]+'<span></span></a></li>';
				swal(name, "저장되었습니다.");
			}
			
			else if(nameCnt > 0){
				if(nameCnt >= 5){
					swal("헛!", "주소가 너무 많습니다.", "error");
				}else{
					//중복 주소 검사
					for(var i=0; i<nameCnt; i++){
						if(names[i] == name){
							check = true;
						}
					}
					if(check == true){
						swal("아차!", name+"는(은) 이미 저장된 주소입니다.", "error");
						check = false;
					}else if(check == false){
						names[nameCnt] = name;
						placey[nameCnt] = placeY;
						placex[nameCnt] = placeX;
						swal(name, "저장되었습니다.");
						nameCnt++;
					}
					for(var i=1; i<nameCnt; i++){
// 						document.getElementById("Location"+i).innerHTML= names[i];
						document.getElementById("Location"+i).innerHTML= '<li id="Location'+i+ '">'+names[i]+'<span></span></a></li>';
					}
				}
			}
		}

	
	
<!-- 엔터 입력시 이벤트 ------------------------------------------------------------------------------------------------->
		function Enter_Check() {
			// 엔터키의 코드는 13입니다.
			if (event.keyCode == 13) {
				SearchPlace();
			}
		}
		
		function Enter_Check_keyword() {
			// 엔터키의 코드는 13입니다.
			if (event.keyCode == 13) {
				CenterPlaceKeyword();
			}
		}

	
	
<!-- centerView 클릭시 ---------------------------------------------------------------------------------------------->
	let RcenterY = 0;
	let RcenterX = 0;
	
	function centerView_click(){ 
		
	if(names.length < 2){
		swal("아차!", "저장된 주소가 너무 적습니다.", "error");
	}else{
	document.getElementById('CenterPlaceKeyword').innerHTML='	<span class="icon icon-search" onclick="CenterPlaceKeyword()" style="cursor: pointer;"></span> <input type="text" id="CenterPlaceKeywordId" class="form-control" placeholder="Category Keyword" onkeydown="JavaScript:Enter_Check_keyword()" >';
	
	removeMarker();
	placeOverlay.setMap(null);
		
	// 	중심좌표
	var centerY = 0;
	var centerX = 0;
	
	// 마커 이미지의 이미지 주소입니다 
	var imageSrc = "resources/images/map-marker-icon.png";  
	
	for (var i = 0; i < nameCnt; i++) { 
	
// 	    // 마커 이미지의 이미지 크기 입니다 
// 	    var imageSize = new kakao.maps.Size(29, 35);  
	
	    // 마커 이미지를 생성합니다     
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);  
	    
	    var latlng = new kakao.maps.LatLng(placey[i], placex[i]); 
	    var title = names[i]; 
	    
	    //중심좌표 구하기
	    centerY += placey[i]*1;
	    centerX += placex[i]*1;

	    // 마커를 생성합니다 
	    var marker = new kakao.maps.Marker({ 
	        position: latlng, // 마커를 표시할 위치 
	        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
	        image : markerImage // 마커 이미지  
	    }); 
	    
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	    
	}
	

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			var bounds = new kakao.maps.LatLngBounds();

			for (var i = 0; i < nameCnt; i++) {
				bounds.extend(new kakao.maps.LatLng(placey[i], placex[i]));
			}

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
			

// 			var markerImageCenter = new kakao.maps.MarkerImage(imageSrcCenter, imageSize);
			
			// 중심점 마커를 생성합니다 
		    var marker = new kakao.maps.Marker({ 
		        position: new kakao.maps.LatLng(centerY/(nameCnt*1.0), centerX/(nameCnt*1.0)), // 마커를 표시할 위치 
		        title : "중심", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
		        image : markerImageCenter // 마커 이미지  
		    }); 
			
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			
			 RcenterY = centerY/(nameCnt*1.0);
			 RcenterX = centerX/(nameCnt*1.0);
			 
			 
			 var centerInfoDiv = document.getElementById('centerInfoDiv');
			 centerInfoDiv.innerHTML = '<div class="hAddr"><span class="title">지도중심기준 행정동 주소정보</span><span id="centerAddr"></span></div>';
			 
			 
		//중심 좌표 주소 표시창
			// 주소-좌표 변환 객체를 생성합니다
			 var geocoder = new kakao.maps.services.Geocoder();
		
			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			 searchAddrFromCoords(new kakao.maps.LatLng(centerY/(nameCnt*1.0), centerX/(nameCnt*1.0)) , displayCenterInfo);
			
			 function searchAddrFromCoords(coords, callback) {
				    // 좌표로 행정동 주소 정보를 요청합니다
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}

				// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			 function displayCenterInfo(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        var infoDiv = document.getElementById('centerAddr');

				        for(var i = 0; i < result.length; i++) {
				            // 행정동의 region_type 값은 'H' 이므로
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


 
<!-- largeCenter_click 이벤트 ----------------------------------------------------------------------------------------------------------------> 
 	function largeCenter_click(){
 		if(names.length < 2){
 			swal("아차!", "저장된 주소가 너무 적습니다.", "error");
 		}else{
		removeMarker();
		
		map.setCenter(new kakao.maps.LatLng(RcenterY, RcenterX));
		map.setLevel(5);
		    
		// 장소 검색 객체를 생성합니다
// 		var ps = new kakao.maps.services.Places(map); 
		
		var imageSrcCenter = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		// 마커 이미지의 이미지 크기 입니다 
	    var imageSize = new kakao.maps.Size(29, 35);  
		var markerImageCenter = new kakao.maps.MarkerImage(imageSrcCenter, imageSize);
		
		// 마커 찍기
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: new kakao.maps.LatLng(RcenterY,RcenterX),
			image : markerImageCenter
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
 		markers.push(marker);
		
		 var centerInfoDiv = document.getElementById('centerInfoDiv');
		 centerInfoDiv.innerHTML = '<div class="hAddr"><span class="title">지도중심기준 행정동 주소정보</span><span id="centerAddr"></span></div>';
		 
			//중심 좌표 주소 표시창
			// 주소-좌표 변환 객체를 생성합니다
			 var geocoder = new kakao.maps.services.Geocoder();
		
			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			 searchAddrFromCoords(new kakao.maps.LatLng(RcenterY, RcenterX) , displayCenterInfo);
			
			 function searchAddrFromCoords(coords, callback) {
				    // 좌표로 행정동 주소 정보를 요청합니다
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}

				// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			 function displayCenterInfo(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        var infoDiv = document.getElementById('centerAddr');

				        for(var i = 0; i < result.length; i++) {
				            // 행정동의 region_type 값은 'H' 이므로
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
 	
 	
 	
 	
<!--  	CenterPlaceKeyword 검색시 이벤트 ---------------------------------------------------------------------------------------------------> 
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
 // 키워드로 장소를 검색합니다
 	ps.keywordSearch(placeKeyword, placesSearchCB, {location:new kakao.maps.LatLng(RcenterY, RcenterX)}); 

 	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
 	function placesSearchCB (data, status, pagination) {
 	    if (status === kakao.maps.services.Status.OK) {

 	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
 	        // LatLngBounds 객체에 좌표를 추가합니다
 	        var bounds = new kakao.maps.LatLngBounds();

 	        for (var i=0; i<data.length; i++) {
 	            displayMarker(data[i]);    
 	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
 	        }       
 	    }

 	     else if (status === kakao.maps.services.Status.ZERO_RESULT) {
 	    	
	    }
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
     		map.setBounds(bounds);
 	}

 	// 지도에 마커를 표시하는 함수입니다
 	function displayMarker(place) {
 	    
 	    // 마커를 생성하고 지도에 표시합니다
 	    var marker = new kakao.maps.Marker({
 	        position: new kakao.maps.LatLng(place.y, place.x) 
 	    });
 	   
		marker.setMap(map);
		markers.push(marker);

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
		 content = '<div class="placeinfo">'
											+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
											+ place.place_name + '</a>';

									if (place.road_address_name) {
										content += '    <span title="' + place.road_address_name + '">'
												+ place.road_address_name 
												+ '</span>'
												+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
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
											+ '<button type="button" onclick="close_window();" class="btn btn-dark btn-sm" style="margin-left:5%; margin-top:10px;">닫기</button>'
											+ '</div>'
											+ '<div class="after"></div>';
											
									contentNode.innerHTML = content;
								    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
								    placeOverlay.setMap(map);
								    
								    
								});
 							}
 			}
 	
<!-- meeting Place 클릭 이벤트  ---------------------------------------------------------------------------------------------------------->
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
 			  text: "Meeting Place로 저장하시겠습니까?",
 			  icon: "warning",
 			  buttons: true,
 			})
 			.then((willDelete) => {
 			  if (willDelete) {
 			    swal(MeetingPlace, MeetingPlace+"가(이) Meeting Place로 선정되었습니다.", {
 			      icon: "success",
 			    });

 			  document.getElementById('meetingPlaceStyleId').innerHTML = '<div style="margin-bottom:0; border-style:solid; border-color:#e2c0bb; border-width:4px; padding:5px;"><h3 class="heading-sidebar" style="margin-bottom:0;"><p class="jg" id="meetingPlaceId" style="margin-bottom:0;">' +MeetingPlace+ '</p></h3><p id="meetingPlaceAddressId" style="font-size:80%; margin-bottom:0;">'+address+'</p><button type="button" onclick="urlSave();" class="btn btn-dark btn-sm" style="width:100%; margin-top:10px; background-color:#e2c0bb; border-color:#e2c0bb;">URL 복사</button></p><button type="button" onclick="meetingCreate('+"'"+ MeetingPlace+"'"+','+"'"+address+"'"+');" class="btn btn-dark btn-sm" style="width:100%; background-color:#e8705e; border-color:#e2c0bb;">Meeting 만들기</button></div>';
 			
 			   
 			   
 			  } 
 			});
 	}
	function meetingCreate(MeetingPlace, address){

		location.href="/MeeterFromMapInsert?MeetingPlace=" + MeetingPlace +"&address=" + address;
	}

	<!-- Meeting Place 클릭시 클립보드에 url 복사 -->
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
		  swal("클립보드 복사 완료");
		};
		
<!--  	reset 버튼 클릭 이벤트 -->
 	function reset_click(){
 		location.reload();
 	}
 	
<!-- 	마커 제거 -->
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }
 </script>

</body>
</html>