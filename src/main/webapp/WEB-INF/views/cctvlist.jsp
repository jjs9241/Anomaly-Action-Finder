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
        <link href="<c:url value="/resources/css/cctvlist.css" />" rel="stylesheet">
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
                <!--모달&로딩-->
                <div id="modal">
                    <video id="big_video"  autoplay></video>
                    <div id="close"><button><i class="fas fa-times"></i></button></div>
                </div>
                <!--content-->
                <div id="content">
                    <div class="table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="number">No.</th>
                                    <th class="name">name</th>
                                    <th class="cctvid">CCTVID</th>
                                    <th class="address">Address</th>
                                    <th class="rate">Rate</th>
                                    <th class="edit">Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="number">1</td>
                                    <td class="name">super</td>
                                    <td class="cctvid">cam1</td>
                                    <td class="address">경기도 부천시 dlkfjaldsjfalksdjflkajsdfl;jadsl;fk</td>
                                    <td class="rate">0.1%</td>
                                    <td class="edit">                                                       
                                        <a href="/changecctv" class="mr-2"><i class="fas fa-edit text-info"></i></a>
                                        <a href="#"><i class="fas fa-trash-alt text-danger"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td class="name">mart</td>
                                    <td class="cctvid">cam2</td>
                                    <td class="address">서울특별시 강남구 adslkfjaldsjflasdjflkajsdl;faj</td>
                                    <td class="rate">0.1%</td>
                                    <td class="edit">                                                       
                                        <a href="/changecctv" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                        <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td class="name">shop</td>
                                    <td class="cctvid">cam3</td>
                                    <td class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa</td>
                                    <td class="rate">0.1%</td>
                                    <td class="edit">                                                       
                                        <a href="/changecctv" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                        <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td class="name">shop</td>
                                    <td class="cctvid">cam3</td>
                                    <td class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa</td>
                                    <td class="rate">0.1%</td>
                                    <td class="edit">                                                       
                                        <a href="/changecctv" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                        <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td class="name">shop</td>
                                    <td class="cctvid">cam3</td>
                                    <td class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa</td>
                                    <td class="rate">0.1%</td>
                                    <td class="edit">                                                       
                                        <a href="/changecctv" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                        <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                    </td>
                                </tr>
                            </tbody>                           
                        </table>
                        <div class="table_footer">
                            <ul >
                                <li class="pre"><a href="#">Previous</a></li>
                                <li class="num"><a href="#">1</a></li>
                                <li class="num"><a href="#">2</a></li>
                                <li class="next"><a href="#">Next</a></li>
                            </ul>
                            <button type="button"><a href="/createcctv"><i class="fas fa-plus-circle"></i>Add New CCTV</a></button>
                        </div>
                    </div>
                <!--//content-->
            </div>  
            <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    </body>
    </html>