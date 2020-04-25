<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<% List urlListList = (List)request.getAttribute("urlListList"); %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <!--header-->
    <div id="header">
        <a href="/manageCCTV"><img src="/resources/img/logo_b.png" alt="로고"></a>
        <ul class="navbar">
        	<!--
        	<li class="logout"><a href="/login/login"><i class="fa fa-sign-out fa-fw"></i>Logout</a></li>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        	-->
        	<li class="notice"><a href="#"></a></li>
            <li class="user_icon"><i class="far fa-bell"></i></li>    
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
    <!--//header-->
    </div>
    <!--//header-->
        <div id="wrap">
            <div id="side">
                <!--sidebar-->
                <div id="sidebar">
                    <div class="video_title">
                        <span>VIDEO</span>
                        <ul>
                            <li><a href="/manageCCTV">CCTV 관제</a></li>
                            <li><a href="/map">지도</a></li>
                            <li><a href="/strange">이상행동</a></li>
                        </ul>
                    </div>
                    <div class="cctv">
                        <span>CCTV</span>
                        <ul>
                            <li><a href="/indexStore">CCTV 관리</a></li>
                        </ul>
                    </div>
                    <div class="qa">
                        <span>Q&A</span>
                        <ul>
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
            <div id="modal">
                <video id="big_video"  autoplay></video>
                <div id="close"><button><i class="fas fa-times"></i></button></div>
            </div>
            <!--content-->
            <div id="content">
            
            	<sec:authorize access="isAuthenticated()">
            	<c:forEach items="${urlListList}" var="urlList">
            		<!-- <div class="urlList"> -->
            		<c:forEach items="${urlList}" var="url">
            			<div class="video">
                    		<img src='<c:out value="${url}"/>'> </img><!--  style="width:300px; height:300px;"></img> -->
                		</div>
                	</c:forEach>
            		<!-- </div> -->
            	</c:forEach>
            	</sec:authorize>
           	    <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" autoplay muted></video>
                </div>
                <div class="video">
                    <video src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4" autoplay muted></video>
                </div>
                
            </div>
            <!--//content-->
    </div>
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript"src="<c:url value="/resources/js/manageCCTV.js" />"></script>
    <script>
        //ul태그에 이벤트 걸고 클릭했을떄 active클래스 넣어서 블루로 만들기
        //요소들 마우스 후버시 파랑색으로 변경
        //var ul = document.getElementsByTagName('ul');
        //for(var i=0 ;i<ul.length;i++){
        //    ul[i].addEventListener('click', clickHandler)
        //}
        //var currentimg;
        //function clickHandler() {
        //   if(currentimg){
        //        currentimg.classList.remove('active');
        //   }
        //    var title = this.getElementsByTagName('li')[0];
        //    title.classList.add('active');
        //    currentimg=title;
        //    }
            //비디오 창 클릭하면 모달창으로 크게 뜨는거
          //  var content = document.getElementById('content');
          //  var modal = document.querySelector("#modal");
          //  content.addEventListener('click',modalHandler);
          //  function modalHandler(e){
          //      video_src=e.target.getAttribute("src")
          //      vid.setAttribute("src" ,video_src)
          //      modal.style.display="block"
          //  }
            //x표& sidebar or heade 누르면 모달창 닫힘
           // var modal_btn = document.querySelector("#close button");
           // var sidebar = document.querySelector("#sidebar");
           // var header = document.querySelector("#header");
           // var vid = document.getElementById("big_video");
           // function modalcloseHandler(){
           //     modal.style.display="none"
                //modal_btn.style.display="none"
            //    vid.pause();
           // }
            //modal_btn.addEventListener('click',modalcloseHandler);
            //sidebar.addEventListener('click',modalcloseHandler);
            //header.addEventListener('click',modalcloseHandler);            
    </script>
</body>
</html>