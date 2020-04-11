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
    <link href="<c:url value="/resources/css/managecctv.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/createcctv.css" />" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
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
                    <div class="video_title">
                        <!--<span>VIDEO</span>-->
                        <ul>
                            <li>VIDEO</li>
                            <li><a href="/manage">CCTV 관제</a></li>
                            <li><a href="/map">지도</a></li>
                            <li><a href="/strange">이상행동</a></li>
                        </ul>
                    </div>
                    <div class="cctv">
                        <!--<span>CCTV</span>-->
                        <ul>
                            <li>CCTV</li>
                            <li><a href="/cctvlist">CCTV 관리</a></li>
                        </ul>
                    </div>
                    <div class="qa">
                        <!--<span>Q&A</span>-->
                        <ul>
                            <li>Q&A</li>
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
                <h2>CCTV 수정</h2>
                <div class="formwrap">
                    <form action="/" method="post" encType="multiplart/form-data">
                        <div class="row">
                        <span>No :</span><input type="text" name="number" value="6" readonly/>
                        </div>
                        <div class="row">
                        <span>Name :</span><input id="name" type="text" placeholder="이름을 입력하세요. " name="name">
                        </div>
                        <div class="row">
                        <span>CCTV ID :</span><input type="text" value="CAM8" name="cctvid"  readonly/>
                        </div>
                        <div class="row">
                        <span>Address :</span><input id="address" type="text" placeholder="주소를 입력하세요" name="address"/>
                        </div>
                        <div class="btn_container">
                        <input type="button" value="수정" class="btn1"/>
                        <input type="reset" value="reset" class="btn2"/>
                        <a href="/cctvlist"><input type="button" value="글 목록으로" class="btn3"/></a>
                        </div>
                    </form>
                </div>
            <!--//content-->
        </div>  
        <script src="common.js"></script>
</body>
</html>