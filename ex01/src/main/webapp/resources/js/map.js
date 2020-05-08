var container = document.getElementById('map');
var options = {
    center: new daum.maps.LatLng(33.450701, 126.570667),
    level: 3,
    //mapTypeId: daum.maps.MapTypeId.SKYVIEW,
};

var map = new daum.maps.Map(container, options);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("주소", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
    //console.log(status);
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    