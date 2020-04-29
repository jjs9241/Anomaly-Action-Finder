<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html lang="en">
   <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<c:url value="/resources/css/homeanimation.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/fullpage.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/homestyle.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/reset.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <script 
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous">
    </script>
</head>
<body>
    <!--헤더-->
    <header id="header">
        <div class="logo">
            <a href="#">
                <img src="resources/img/logo_w.png" alt="로고">
            </a>
            <a href="/login" class="login">로그인</a>
            <a href="#" class="join">회원가입</a>
        </div>
    </header> 
    <!--//헤더-->
    <!--fullpage 라이브러리-->
    <div id="full-page">
        <div class="section s0 section-two">
             <div class="slide img1 slide-one">
                <h2 class="main_title">Make your life easier with AI</h2>
                <p class="main_subtitle">AI 기술 기반 서비스 기업</p>
                <button>상담 신청</button>
            </div>
            <div class="slide img2 slide-two">
                <h2>cctv 실시간 이상행동 감지</h2>
				<p class="first">사고 확인용이 아닌 실시간 감시</p>
				<p class="sec">인공지능 기술을 이용하여 실시간으로 이상행동을 감지하고 알림을 보냅니다. </p>
            </div>
            <div class="slide img3 slide-three">
                <h2>24시간 cctv 관제 시스템</h2>
				<p class="first">더이상 지켜보지 마세요</p>
				<p class="sec">인공지능이 실시간으로 지켜보고 필요시 신고까지 해줍니다.</p>
            </div>
            <div class="slide img4 slide-four">
                <h2>안전 지킴이</h2>
                <p class="first">안전</p>
				<p class="sec">당신 가게의 안전을 맡겨 보세요</p>
            </div>
        </div>
         <div class="section s1 section-one">
            <div class="icon_cont">
                <div class="fun_img icon1">
                    <!-- <i class="fas fa-desktop"></i> -->
                    <img src="/resources/img/Monitor.png" alt="">
                    <p>24시간 실시간 cctv 관제 서비스</p>
                </div>
                <div class="fun_img icon2">
                    <!-- <i class="fas fa-bell"></i> -->
                    <img src="/resources/img/bell.png" alt="">
                    <p>이상행동 알람 서비스</p>
                </div>
                <div class="fun_img icon3x">
                    <img src="/resources/img/behavior.png" alt="">
                    <p>이상행동 검출 및 저장 서비스</p>
                </div>
                <div class="fun_img icon4">
                    <img src="/resources/img/cctv.png" alt="">
                    <p>매장별 cctv관리 서비스</p>
                </div>
            </div>
        <!--icon_cont-->
        </div>
        <div class="section s2 section-three">
            <div class="contact_info">
                <h2>Contact Us</h2>
                <p>
			                   궁금하신 사항이 있으시면 오른쪽의 문의하기를 이용해주세요.<br/>
			                   담당자가 자세하게 안내해드리겠습니다.
                </p>
            </div>
      <div class="contact_box">
            <dl>
                <dt class="blind">문의 종류 선택</dt>
                <dd>
                    <select id="cSelect">
                        <option>문의 종류를 선택해 주세요.</option>
                        <option>AI관련문의</option>
                        <option>서비스 신청 문의</option>
                        <option>제휴문의</option>
                        <option>광고문의</option>
                        <option>일반문의</option>
                    </select>
                </dd>
                <dt><label for="cName">제목</label></dt>
                <dd><input type="text" id="cName" placeholder="제목을 입력해주세요." /></dd>
                <dt><label for="cEmail">이메일</label></dt>
                <dd><input type="text" id="cEmail" placeholder="이메일을 입력해주세요." /></dd>
                <dt><label for="cContents">문의 내용</label></dt>
                <dd><textarea id="cContents" placeholder="문의 내용을 입력해주세요."></textarea></dd>
                <dd><a href="#">Send Email</a></dd>
            </dl>
        </div>
        <!-- contact_box -->
        </div>
        <!-- <div class="section s3 section-fore">
            <h2>section 3</h2>  -->
        </div>
    </div>
    <script type="text/javascript"src="<c:url value="/resources/js/fullpage.min.js" />"></script>
    <!--//fullpage 라이브러리-->
    <script>
        new fullpage('#full-page', {
            //options here
            licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
            autoScrolling:true,
            scrollHorizontally: true,
            navigation : true,
            navigationTooltips : ['home','about','contact','what'], //사이드 메뉴 이름 설정
            
            onLeave: function(origin, destination, direction){
                console.log("onLeave",origin.index, destination.index);
            },//스크롤이 시작할때 실행, origin:원래 있던 섹션 destination:가는 섹션
            afterLoad: function(origin, destination, direction){
                if(destination.index == 1){
                    $('.s1 h3').show();
                }
            },//스크롤이 끝날때 실행
        });

        //슬라이드 자동 재생
        $(document).ready(function () {
            $('#fullpage').fullpage({
                sectionsColor: ['#1bbc9b', '#4BBFC3'],
                loopBottom: true,
                afterRender: function () {
                    setInterval(function () {
                        $.fn.fullpage.moveSlideRight();
                    }, 500);
                }
            });
        });
		
        
        //상담신청 버튼 클릭시 맨 아래로 이동
        var contact_info = document.querySelector("#full-page > div.section.s0.section-two.fp-section.active.fp-completely > div.fp-slides > div > div.slide.img1.slide-one.fp-slide.fp-table.active > div > button")
        contact_info.addEventListener("click" , scrollHandler);
        function scrollHandler(){
        document.querySelectorAll("div#fp-nav>ul>li>a")[2].click();
        }
    </script>
</body>
</html>