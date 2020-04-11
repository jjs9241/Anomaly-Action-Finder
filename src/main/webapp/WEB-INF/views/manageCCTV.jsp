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
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <!--header-->
    <div id="header">
        <a href="#"><img src="resources/img/logo_b.png" alt="로고"></a>
        <ul class="navbar">
            <li class="notice"><a href="#"></a></li>
            <li class="user_icon"><i class="far fa-bell"></i></li>
        </ul>
    </div>
    <!--//header-->
        <div id="wrap">
            <div id="side">
                <!--sidebar-->
                <div id="sidebar">
                    <div class="video">
                        <span>VIDEO</span>
                        <ul>
                            <li><a href="/manage">CCTV 관제</a></li>
                            <li><a href="/map">지도</a></li>
                            <li><a href="/strange">이상행동</a></li>
                        </ul>
                    </div>
                    <div class="cctv">
                        <span>CCTV</span>
                        <ul>
                            <li><a href="/cctvlist">CCTV 관리</a></li>
                        </ul>
                    </div>
                    <div class="qa">
                        <span>Q&A</span>
                        <ul>
                            <li><a href="#">문의하기</a></li>
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
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4" autoplay muted></video>
                </div>
            </div>
            <!--//content-->
    </div>
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript"src="<c:url value="/resources/js/manageCCTV.js" />"></script>
</body>
</html>