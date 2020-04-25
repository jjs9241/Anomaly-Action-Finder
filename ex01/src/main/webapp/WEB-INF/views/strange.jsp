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
    <link href="<c:url value="/resources/css/strange.css" />" rel="stylesheet">  
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <!--header-->
<<<<<<< HEAD
    <div id="header">
        <a href="/manageCCTV"><img src="resources/img/logo_b.png" alt="로고"></a>
        <ul class="navbar">
            <li class="user_icon"><a href="#"></a></li>
            <li class="notice"><i class="far fa-bell"></i></li>
        </ul>
        <div class="user_ele hide">
            <div class="user_name">
                <div class="user_icon2"></div>
                <h2>Valerie Luna</h2>
                <p>vluna@aol.com<p>
            </div>
            <a href="#"><i class="fas fa-cog"></i>Account</a>
            <a href="/customLogout"><i class="fas fa-sign-out-alt"></i>Logout</a>
        </div>
    </div>
=======
   	<%@ include file="/WEB-INF/views/commons/header.jsp" %>
>>>>>>> refs/heads/v1
    <!--//header-->
    <div id="wrap">
<<<<<<< HEAD
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
            <!--모달&로딩-->
            <!-- <div id="modal">
                <video id="big_video" autoplay></video>
                <div id="close"><button><i class="fas fa-times"></i></button></div>
            </div>    -->

            <div class="content_container">
                <div class="sort">
                    <h2>정렬하기</h2>
                    <ul>
                        <li>즐겨찾기</li>
                        <li>날짜</li>
                        <li>이름</li>
                    </ul>
                </div>
                 <!--//sort-->  

                <!--content-->
                <div id="content">
                    <div class="strange_video_wrap">
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/Love - 32021.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/Sea - 33194.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/Cello - 33565.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/Cane - 31180.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                        </div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                     <!--
	                    <div class="video">
	                        <div class="star_wrap">                       
	                            <div class="star"><i class="far fa-star"></i> </div>
	                       	</div>
	                        <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
	                    </div>
	                    -->
	                </div>
                    <!--//strange_video_wrap-->
                </div>
                <!--//content-->
            </div>
            <!--//content_container-->    
           <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
           <script type="text/javascript"src="<c:url value="/resources/js/strange.js" />"></script>  
=======
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
		<!--모달&로딩-->
		<!-- <div id="modal">
		    <video id="big_video" autoplay></video>
		    <div id="close"><button><i class="fas fa-times"></i></button></div>
		</div>    -->
		
		<div class="content_container">
		    <div class="sort">
		        <h2>정렬하기</h2>
		        <ul>
		            <li>즐겨찾기</li>
		            <li>날짜</li>
		            <li>이름</li>
		        </ul>
		    </div>
		     <!--//sort-->  
		
		    <!--content-->
		    <div id="content">
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/Love - 32021.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/Sea - 33194.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/Cello - 33565.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/Cane - 31180.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		        <div class="video">
		            <div class="star_wrap">                       
		                <div class="star"><i class="far fa-star"></i> </div>
		            </div>
		            <video src="resources/video/테스트영상.mp4" autoplay loop muted></video>
		        </div>
		    </div>
		    <!--//content-->
		</div>
	<!--//content_container-->
	</div>    
	<script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
	<script type="text/javascript"src="<c:url value="/resources/js/strange.js" />"></script>  
>>>>>>> refs/heads/v1
</body>
</html>