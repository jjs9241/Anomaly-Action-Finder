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
</head>
<body>
    <!--header-->
	<%@ include file="/WEB-INF/views/commons/header.jsp" %>    
    <!--//header-->
    <div id="wrap">
        <div id="side">
            <!--sidebar-->
            <div id="sidebar">
                <div class="video_title">
                    <ul>
                        <li>VIDEO</li>
                        <li><a href="/manageCCTV">CCTV 관제</a></li>
                        <li><a href="/map">지도</a></li>
                        <li><a href="/strange">이상행동</a></li>
                    </ul>
                </div>
                <div class="cctv">
                    <!--<span>CCTV</span>-->
                    <ul>
                        <li>CCTV</li>
                        <li><a href="/indexStore">CCTV 관리</a></li>
                    </ul>
                </div>
                <div class="qa">
                    <!--<span>Q&A</span>-->
                    <ul>
                        <li>Q&A</li>
                        <li><a href="/qa">문의하기</a></li>
                    </ul>
                </div>
            </div>
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
                                <th class="cctvid">CCTVID</th>
                                <th class="address">Address</th>
                            </tr>
                        </thead>
                        <tbody>
                                <tr>
                                <th class="number">1</th>
                                <th class="name">super</td>
                                <th class="cctvid">cam1</td>
                                <th class="address">경기도 부천시 dlkfjaldsjfalksdjflkajsdfl;jadsl;fk....</td>
                            </tr>
                            <tr>
                                <th>2</th>
                                <th class="name">mart</td>
                                <th class="cctvid">cam2</td>
                                <th class="address">서울특별시 강남구 adslkfjaldsjflasdjflkajsdl;fajf....</td>
                            </tr>
                            <tr>
                                <th>3</th>
                                <th class="name">shop</td>
                                <th class="cctvid">cam3</td>
                                <th class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa....</td>
                            </tr>
                            <tr>
                                <th>4</th>
                                <th class="name">shop</td>
                                <th class="cctvid">cam3</td>
                                <th class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa....</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--//content-->
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8f35a2a00c1126d366e7507524e0890"></script> 
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript"src="<c:url value="/resources/js/map.js" />"></script>
</body>
</html>