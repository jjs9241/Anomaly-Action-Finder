<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>temp home</title>
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
<form method="post" action="/login/login">
아이디<input type="text" name="pid" id="pid"/><br/>
비밀번호<input type="password" name="passwd" id="passwd"/><br/>
<div id="error"><%=errMsg %></div>
<input type="submit" value="로그인"/>
</form>
</body>
</html>
