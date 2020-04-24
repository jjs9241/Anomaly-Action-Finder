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
        <div id="content" >
            <h2>Store 등록</h2>
            <div class="formwrap" style="height: 400px;margin-top: 0px;">
                <form action="/registerStore" method="post" >
                    <div class="row">
                        <span>No :</span><input type="text" name="number" value="${no}" readonly/>
                    </div>
                    <div class="row">
                        <span>Store Name :</span><input id="storeName" type="text" placeholder="이름을 입력하세요. " name="storeName">
                    </div>
                    <div class="row">
                        <span>Store IP :</span><input type="text" placeholder="매장 서버 IP를 입력하세요" name="ip" />
                    </div>
<!--                     <div class="row"> -->
<!--                         <span>Store ID :</span><input type="text" value="1234" name="store_id"  readonly/> -->
<!--                     </div> -->
                    <div class="row">
                        <span>Address :</span><input id="address" type="text" placeholder="주소를 입력하세요" name="address"/>
                    </div>
<!--                     <div class="row"> -->
<!--                         <span>Rate :</span><input type="text" value="0%" name="rate"  readonly/> -->
<!--                     </div> -->
                    <div class="btn_container">
                        <input type="submit" value="등록" class="btn1"/>
                        <input type="reset" value="reset" class="btn2"/>
                        <input id = "gotostorelist" type="button" value="글 목록으로" class="btn3"/>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
            </div>
        <!--//content-->
    </div>  
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript"src="<c:url value="/resources/js/register.js" />"></script>
</body>
</html>