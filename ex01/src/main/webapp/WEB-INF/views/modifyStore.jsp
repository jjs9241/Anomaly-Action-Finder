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
    <link href="<c:url value="/resources/css/createshop.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/alarm.css"/>" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <!--header-->
    <div id="header">
        <a href="/manageCCTV"><img src="resources/img/logo_b.png" alt="로고"></a>
        <ul class="navbar">
            <li class="user_icon"><a href="#"></a></li>
            <li class="notice"><i class="far fa-bell"></i></li>
        </ul>
        <div class="user_ele hide">
            <div class="user_name">
                <div class="user_icon2"><img src="" alt=""></div>
                <h2>Valerie Luna</h2>
                <p>vluna@aol.com<p>
            </div>
            <a href=""><i class="fas fa-cog"></i>Account</a>
            <a href=""><i class="fas fa-sign-out-alt"></i>Logout</a>
        </div>
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
            <div id="content">
                <h2>Store 수정</h2>
                <div class="formwrap">
                    <form action="/registerStore" method="post" encType="multiplart/form-data">
                        <div class="row">
                            <span>No :</span><input type="text" name="number" value="6" readonly/>
                        </div>
                        <div class="row">
                            <span>Store Name :</span><input id="name" type="text" placeholder="이름을 입력하세요. " name="name">
                        </div>
                        <div class="row">
                            <span>Store IP :</span><input type="text" placeholder="서버 IP를 입력하세요" name="store_ip" />
                        </div>
                        <div class="row">
                            <span>Store ID :</span><input type="text" value="1234" name="store_id"  readonly/>
                        </div>
                        <div class="row">
                            <span>Address :</span><input id="address" type="text" placeholder="주소를 입력하세요" name="address"/>
                        </div>
                        <div class="row">
                            <span>Rate :</span><input type="text" value="0%" name="rate"  readonly/>
                        </div>
                        <div class="btn_container">
                            <input type="submit" value="수정" class="btn1"/>
                            <input type="reset" value="reset" class="btn2"/>
                            <input id = "gotostorelist" type="button" value="글 목록으로" class="btn3"/>
                        </div>
                    </form>
                </div>
            <!--//content-->
        </div>  
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript"src="<c:url value="/resources/js/register.js" />"></script>
</body>
</html>