<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
    <title>Document</title>
    <style type="text/css">
		#error{
			color:red;
			font-size:10pt;
		}
	</style>
    <%
		// request 스코프에 담긴 오류 메시지 얻어오기.
		String errMsg = (String)request.getAttribute("errMsg");
		if(errMsg==null){
			errMsg="";
		}
	%>
</head>
<body>
    <section class="login-form">
        <h1><a href="">LOGO DESIGN</a></h1>
        <form method="post" action="/join/user">
            <div class="int-area">
                <input type="email" name="email" id="email" autocomplete="off" required >
                <label for="email">E-MAIL</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw" autocomplete="off" required >
                <label for="pw">PASSWORD</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw" autocomplete="off" required >
                <label for="pw">PASSWORD CHECK</label>
            </div>
            <div class="int-area">
                <input type="text" name="number" id="number" autocomplete="off" required >
                <label for="number">PHONE NUMBER</label>
            </div>
            <div class="btn-area">
                <button type="submit">JOIN</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
        <div class="caption">
            <a href="">HELP?</a>
        </div>
    </section>
</body>
</html>