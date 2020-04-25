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
    <link href="<c:url value="/resources/css/createCCTV.css" />" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
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
	    <div id="content">
	        <h2>CCTV 등록</h2>
	        <div class="formwrap">
	            <form action="/registerCCTV" method="post" encType="multiplart/form-data">
	                <div class="row">
	                    <span>No :</span><input type="text" name="number" value="${no}" readonly/>
	                </div>
	                <div class="row">
	                    <span>CCTVID :</span><input id="name" type="text" value="${cctvId}" name="pid" readonly>
	                </div>
	                <div class="row">
	                    <span>Hostname :</span><input type="text" placeholder="서버 IP를 입력하세요" name="hostName" />
	                </div>
	                <div class="row">
	                    <span>Description :</span>
	                    <!--  <textarea id="story" name="story"rows="4" cols="59">
		cctv에 대한 설명을 입력하세요
	</textarea>-->
	                    <input type="text" placeholder="cctv에 대한 설명을 입력하세요" name="description"/>
	                </div>
	                <div class="btn_container">
	                    <input type="submit" value="등록" class="btn1"/>
	                    <input type="reset" value="reset" class="btn2"/>
	                    <input id = "gotocctvlist" type="button" value="글 목록으로" class="btn3"/>
	                </div>
	                <input type="hidden" name="storeId" value="${storeId}" />
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	            </form>
	        </div>
	    <!--//content-->
    </div>  
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript"src="<c:url value="/resources/js/registerCCTV.js" />"></script>
</body>
</html>