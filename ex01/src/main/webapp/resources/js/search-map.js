/**
 *  show map page에서 지도로 찾기
 */

//var callURL = 'http://127.0.0.1:8080';
var callURL = 'http://localhost:8080';
$(function() { 
	
//	ckLoggedIn();
	
	var mapContainer = document.getElementById('map'),
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.501283, 127.039505), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	//jquery ajax 자동완성
	  function log( message ) {
	      $( "<div>" ).text( message ).prependTo( "#log" );
	      $( "#log" ).scrollTop( 0 );
	    }

	  var $si = $( "#search-input" );
	  
//	  $( "#search-input" ).autocomplete({
//	      source: function( request, response ) {
//	        $.ajax( {
//	          url: callURL+"/map/search",
//	          dataType: "JSON",
//	          data: {
//	            param: request.term
//	          },
//	          success: function( data ) {
//	        	  console.log("data : ",data);
//	        	  var resultEle = document.getElementById("search-result");
//	        	  
//	        	  hideMarkers();
//	        	  
////	        	  resultEle.append
//	        	  if(data == null || data == "" ){
//	        		  
//	        	  
//	        		  resultEle.innerHTML ="";
//	        	  }else{
//	        		  data.forEach(myFunction);
//	        	  }
//
//	        	  function myFunction(item, index) {
//	        		  
//	        		  console.log("item : ",item , " index : ",index);
//	        		  
//	        		  var ele = document.createElement('div');
//	        		  
//	        		  var homepage = (item.homepage != '(null)') ? item.homepage : '-'; 
//	        		  
//	        		  
//	        		  
//	        		  var str = '<div class="wrap" data-idx="'+index+'" onClick="targetMarker(this.dataset.idx)">'  
//							    +'  <div class="info">'  
//							    +'      <div class="title">'  
//							    +'          '+item.name+''
//							    //+'          <!-- <div class="close" onclick="closeOverlay()" title="닫기"></div>   -->
//							    +'      </div>  '
//							    +'      <div class="body">'  
//							    +'          <div class="desc">'  
//							    +'              <div class="ellipsis">'+item.address+'</div>'  
//							    +'              <div class="jibun ellipsis">'+item.phone+'</div>  '
//							    +'              <div class="jibun ellipsis">'+homepage+'</div>'  
//							    +'          </div>'  
//							    +'      </div>  '
//							    +'  </div>     '	
//	        		  			+'</div>     ';	
//	        		  
//	        		  ele.innerHTML = str;
//	        		  resultEle.appendChild(ele);
//	        		  
////	        		  $(ele).on('click',function(){
////	        			  
////	        		  });
//	        		  
//	        		  // 마커 하나를 지도위에 표시합니다 
//	        		  addMarker(new kakao.maps.LatLng(item.latitude, item.longitude));
//	        	  }
//	        	  
////	            response( data );
//	          }
//	        } );
//	      },
//	      minLength: 2
//	    } );
	  
	  
	

	

	  // 마커를 생성하고 지도위에 표시하는 함수입니다
	  function addMarkerDefault(position) {
	      
	      // 마커를 생성합니다
	      var marker = new kakao.maps.Marker({
	          position: position
	      });

	      // 마커가 지도 위에 표시되도록 설정합니다
	      marker.setMap(map);
	      
	      // 생성된 마커를 배열에 추가합니다
	      markers.push(marker);
	  }
	  
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	  function setMarkers(map) {
	      for (var i = 0; i < markers.length; i++) {
	          markers[i].setMap(map);
	      }            
	  }

	  // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	  function showMarkers() {
	      setMarkers(map)    
	  }

	  // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	  function hideMarkers() {
	      setMarkers(null);    
	  }
	  
	// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
	  function addMarker(position) {

	      // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
	      var marker = new kakao.maps.Marker({
	          map: map,
	          position: position,
	          image: normalImage
	      });
	      
	     
	      // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
	      marker.normalImage = normalImage;

	      // 마커에 mouseover 이벤트를 등록합니다
	      kakao.maps.event.addListener(marker, 'mouseover', function() {

	          // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
	          // 마커의 이미지를 오버 이미지로 변경합니다
	    	  marker.setImage(overImage);
//	          if (!selectedMarker || selectedMarker !== marker) {
//	              marker.setImage(overImage);
//	          }
	      });

	      // 마커에 mouseout 이벤트를 등록합니다
	      kakao.maps.event.addListener(marker, 'mouseout', function() {

	          // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
	          // 마커의 이미지를 기본 이미지로 변경합니다
	    	  marker.setImage(normalImage);
//	          if (!selectedMarker || selectedMarker !== marker) {
//	              marker.setImage(normalImage);
//	          }
	      });
	      
	      // 생성된 마커를 배열에 추가합니다
	      markers.push(marker);
	      

//	      // 마커에 click 이벤트를 등록합니다
//	      kakao.maps.event.addListener(marker, 'click', function() {
//	          
//	          // 마커를 클릭했을 때 오버레이가 없거나 있으면 닫고, 클릭된 마커에 커스텀 오버레이를 표시합니다
//	          // if(!overlay || )
//	         
//	          // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
//	          // 마커의 이미지를 클릭 이미지로 변경합니다
//	          if (!selectedMarker || selectedMarker !== marker) {
	//
//	              // 클릭된 마커 객체가 null이 아니면
//	              // 클릭된 마커의 이미지를 기본 이미지로 변경하고
//	              !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);
	//
//	              // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
//	              marker.setImage(overImage);
	//
//	              overlay = createOverlay(map, marker);
//	              overlay.setMap(map);
	//  
//	              document.getElementById("overlay-close").addEventListener('click',function(){
//	                console.log("닫기 클릭");
//	                overlay.setMap(null);
//	                marker.setImage(normalImage);
//	                selectedMarker = null;
//	              });
//	          }
//	          // else if(selectedMarker == marker){
//	          //     marker.setImage(normalImage);
//	          //     selectedMarker = null;
//	          //     return;
//	          // }
	//
//	          // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
//	          selectedMarker = marker;
//	      });

	      
	  }//end addMarker
	
});

//마커 출력
// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
  var markers = [];
  
function targetMarker(idx){
	console.log("target call");
	console.log("this idx : ",idx);
	
	
	for(var i= 0 ;i < markers.length;i++){
		markers[i].setImage(normalImage);
	}
	
	var pos = markers[idx].getPosition();
	
	map.panTo(pos);
	markers[idx].setImage(overImage);
}  

function setCenter(pos) {            
    // 이동할 위도 경도 위치를 생성합니다 
//    var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(pos);
}

function panTo(pos) {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(pos);            
}        
  
//기본 마커 설정
//  var imageSrc = callURL+'/library/basic-theme2/main/marker.png', // 마커이미지의 주소입니다    
  var imageSrc = callURL+'/resources/img/marker.jpg', // 마커이미지의 주소입니다    
      imageSize = new kakao.maps.Size(25,35), // 마커이미지의 크기입니다
      imageOption = {offset: new kakao.maps.Point(20, 38)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
          
  // 기본 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
  var normalImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
      markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

  //오버 마커
  var overImageSrc = callURL+'/resources/img/marker_over_s.png',
      overImageSize = new kakao.maps.Size(25,35),
      overImageOption = {offset: new kakao.maps.Point(20,38)};

  //오버 마커 이미지 생성    
  var overImage = new kakao.maps.MarkerImage(overImageSrc, overImageSize, overImageOption);    

  var selectedMarker = null;


  // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
  function addMarker(position) {

      // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
      var marker = new kakao.maps.Marker({
          map: map,
          position: position,
          image: normalImage
      });
      
     
      // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
      marker.normalImage = normalImage;

      // 마커에 mouseover 이벤트를 등록합니다
      kakao.maps.event.addListener(marker, 'mouseover', function() {

          // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
          // 마커의 이미지를 오버 이미지로 변경합니다
          if (!selectedMarker || selectedMarker !== marker) {
              marker.setImage(overImage);
              selectedMarker = marker;
          }
      });

      // 마커에 mouseout 이벤트를 등록합니다
      kakao.maps.event.addListener(marker, 'mouseout', function() {

          // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
          // 마커의 이미지를 기본 이미지로 변경합니다
          if (!selectedMarker || selectedMarker !== marker) {
          }
          marker.setImage(normalImage);
          selectedMarker = null;
      });
      
      // 생성된 마커를 배열에 추가합니다
      markers.push(marker);
      

//      // 마커에 click 이벤트를 등록합니다
      kakao.maps.event.addListener(marker, 'click', function() {
          
          // 마커를 클릭했을 때 오버레이가 없거나 있으면 닫고, 클릭된 마커에 커스텀 오버레이를 표시합니다
          // if(!overlay || )
         
          // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
          // 마커의 이미지를 클릭 이미지로 변경합니다
          if (!selectedMarker || selectedMarker !== marker) {

              // 클릭된 마커 객체가 null이 아니면
              // 클릭된 마커의 이미지를 기본 이미지로 변경하고
              !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

              // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
              marker.setImage(overImage);

              overlay = createOverlay(map, marker);
              overlay.setMap(map);
  
              document.getElementById("overlay-close").addEventListener('click',function(){
                console.log("닫기 클릭");
                overlay.setMap(null);
                marker.setImage(normalImage);
                selectedMarker = null;
              });
          }
          // else if(selectedMarker == marker){
          //     marker.setImage(normalImage);
          //     selectedMarker = null;
          //     return;
          // }

          // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
          selectedMarker = marker;
      });

      
  }//end addMarker
  