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
        <form method="post" action="/login/process">
            <div class="int-area">
                <input type="text" name="username" autocomplete="off" required >
                <label for="pid">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="password" autocomplete="off" required >
                <label for="passwd">PASSWORD</label>
            </div>
            <div id="error"><%=errMsg %></div>
            <div class="btn-area">
                <button type="submit">LOGIN</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
        <div class="caption">
            <a href="">Forgot Password?</a>
        </div>
    </section>
</body>
</html>