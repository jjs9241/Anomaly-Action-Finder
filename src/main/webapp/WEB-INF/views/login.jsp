<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <section class="login-form">
        <h1><a href="">LOGO DESIGN</a></h1>
        <form action="/login">
            <div class="int-area">
                <input type="text" name="id" id="id" autocomplete="off" required >
                <label for="id">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw" autocomplete="off" required >
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                <button type="submit">LOGIN</button>
            </div>
        </form>
        <div class="caption">
            <a href="">Forgot Password?</a>
        </div>
    </section>
</body>
</html>