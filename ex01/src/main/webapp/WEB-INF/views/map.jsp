<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/map.css" />" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
  
    <title>Document</title>
   	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <!--header-->
    <%@ include file="/WEB-INF/views/commons/header.jsp" %>    
    <!--//header-->
    <div id="wrap">
        <div id="side">
            <!--sidebar-->
            <%@ include file="/WEB-INF/views/commons/sidebar.jsp" %>
            <!--//sidebar-->
                <!--footer-->
                <div id="footer">
                    &copy;Finder
                </div>
                <!--//footer-->
            </div>
            <!--//side-->
            <!--content-->
            <div id="content">
                <!--지도 영역-->
                <div class="wrap">
                    <div id="map" ></div>
                </div>
                <!--검색영역-->
                <div class="search_con">
                    <div class="search">
                        <form>
                            <fieldset>
                                <input type="search" placeholder="검색" /><button class="search_btn"type="submit"><i class="fa fa-search"></i></button>
                            </fieldset>
                        </form>
                    </div>
                    <div class="searchtable">
                    <table>
                        <thead>
                            <tr>
                                <th class="number">No.</th>
                                <th class="name">name</th>
                                <th class="cctvid">StoreIP</th>
                                <th class="address">Address</th>
                            </tr>
                        </thead>
                        <tbody>
	                        <c:forEach items="${storeList}" var="store" varStatus="status">
	                    	<tr class="store">
	            				<td class="number"><c:out value="${status.count}"/></td>
	                            <td class="name"><a href="/stores/${store.pid}/cctvs"> <c:out value="${store.storeName}"/></a> </td>
	                            <td class="stored_ip"><c:out value="${store.ip}"/></td>
<%-- 	                            <td class="stored_id"><c:out value="${store.pid}"/></td>                                     --%>
	                            <td class="address"><c:out value="${store.address}"/></td>
<%-- 	                            <td class="rate"><c:out value="${store.ip}"/></td> --%>
<!-- 	                            <td class="edit">                                                        -->
<!-- 	                                <a href="/modifyStore" class="mr-2"><i class="fas fa-edit text-info"></i></a> -->
<!-- 	                                <a href="#"><i class="fas fa-trash-alt text-danger"></i></a> -->
<!-- 	                            </td> -->
	        				</tr>
	        				</c:forEach>
<!--                                     <tr> -->
<!--                                     <th class="number">1</th> -->
<!--                                     <th class="name">super</td> -->
<!--                                     <th class="cctvid">cam1</td> -->
<!--                                     <th class="address">경기도 부천시 dlkfjaldsjfalksdjflkajsdfl;jadsl;fk....</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <th>2</th> -->
<!--                                     <th class="name">mart</td> -->
<!--                                     <th class="cctvid">cam2</td> -->
<!--                                     <th class="address">서울특별시 강남구 adslkfjaldsjflasdjflkajsdl;fajf....</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <th>3</th> -->
<!--                                     <th class="name">shop</td> -->
<!--                                     <th class="cctvid">cam3</td> -->
<!--                                     <th class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa....</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <th>4</th> -->
<!--                                     <th class="name">shop</td> -->
<!--                                     <th class="cctvid">cam3</td> -->
<!--                                     <th class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa....</td> -->
<!--                                 </tr> -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--//content-->
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b88f73c214829c5ab902ccaa171c4747"></script>
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript"src="<c:url value="/resources/js/map.js" />"></script>
        <script type="text/javascript"src="<c:url value="/resources/js/search-map.js" />"></script>
    <script type="text/javascript">
    
    $(function() { 
    	 $.ajax( {
	          url: "/map/list",
	          dataType: "JSON",
	          type : "GET",
	          success: function( data ) {
	        	  console.log("data : ",data);
	        	  data.forEach(function(item, index){
	           		// 마커 하나를 지도위에 표시합니다 
	           		console.log("item : ",item)
	       		    addMarker(new kakao.maps.LatLng(item.latitude, item.longitude));
	           	  })
	          }
	     });
//         	addMarker(new kakao.maps.LatLng(storeList.latitude, storeList.longitude));
//     	var storeList = JSON.parse(${jsonStoreList});
//     	console.log("storeList : ",storeList[1]);
//     	storeList.forEach(fucntion(item, index){
//     		// 마커 하나를 지도위에 표시합니다 
//     		console.log("item : ",item)
// //  		  addMarker(new kakao.maps.LatLng(item.latitude, item.longitude));
//     	});
    });
    
    </script>
</body>
</html>