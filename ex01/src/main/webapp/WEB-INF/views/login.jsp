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
    <script 
       src="https://code.jquery.com/jquery-3.4.1.min.js"
       integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
       crossorigin="anonymous">
    </script>
</head>
<body>
    <section class="login-form">
        <h1><a href="">LOGO DESIGN</a></h1>
        <form method="post" action="/login/process">
            <div class="int-area">
                <input type="text" id="username" name="username" autocomplete="off" required >
                <label for="pid">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" id="password"  name="password" autocomplete="off" required >
                <label for="passwd">PASSWORD</label>
            </div>
            <div id="error"></div>
            <div class="btn-area">
<!--                 <button type="submit">LOGIN</button> -->
                <button id="login-btn" type="button">LOGIN</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
        <div class="caption">
            <a href="">Forgot Password?</a>
        </div>
    </section>
    <script>
    $(function(){
        $('#login-btn').on("click",function(event){
            event.preventDefault();
//             $.ajaxSetup({
//                 beforeSend: function(xhr) {
//                     xhr.setRequestHeader(csrfHeader, csrfToken);
//                 }  
//             })
			var params = $("form").serializeArray();
            
            $.ajax({
//              url : "${pageContext.request.contextPath}/user/process",
                url : "/login/process",
                type : "post",
                dataType : "json",
                data : params,
                success : function(response) {
                    if(response.result == "success"){
                    	location.href = response.data.moveURI;
                    }else if(response.result == "fail"){
                    	document.getElementById("error").innerText = response.message;
                    }
                }, error : function(jqXHR, status, e) {
                    console.error(status + " : " + e);
                }
            });	 
        });
    });
    </script>
</body>
</html>