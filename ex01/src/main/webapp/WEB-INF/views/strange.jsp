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
    <link href="<c:url value="/resources/css/alarm.css"/>" rel="stylesheet"> 
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
		    <%@ include file="/WEB-INF/views/commons/sidebar.jsp" %>
		    <!--//sidebar-->
		    <!--footer-->
		    <div id="footer">
		        &copy;Finder
		    </div>
		    <!--//footer-->
		</div>
		<!--//side-->		
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
		    <div id="content" class="video_align">
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
			          <!-- 
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
			         -->
			    </div>
            	<!--//strange_video_wrap-->
		    </div>
		    <!--//content-->
		</div>
	<!--//content_container-->
	</div>    
	<script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
	<script type="text/javascript"src="<c:url value="/resources/js/strange.js" />"></script>  
</body>
</html>