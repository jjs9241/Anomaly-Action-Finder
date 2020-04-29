<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	 <div id="header">
	    <a href="/manageCCTV"><img src="/resources/img/logo_w.png" alt="로고"></a>
	    <ul class="navbar">
	    	<li class="user_icon"><a href="#">장</a></li>
	        <li class="notice"><i class="far fa-bell"></i></li>    
	    </ul>
	    <div class="user_ele hide">
	        <div class="user_name">
	            <div class="user_icon2"></div>
	            <h2><sec:authentication property="principal.member.email"/></h2>
	            <p><sec:authentication property="principal.username"/></p>
	        </div>
	        <!-- 알림 허용 -->
            <label class="form-switch">
                <input type="checkbox" onclick="test();">
                <i></i>
                Alarm
                <span id="alarm"> 비허용</span>
            </label>                
            <!--// 알림 허용 -->
	        <a href="#"><i class="fas fa-cog"></i>Account</a>
	        <a id="logout" href="#"><i class="fas fa-sign-out-alt"></i>Logout</a>
	        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    </div>
	    <script>
            function test(e){
                let alarm = document.querySelector("#alarm")
                if (alarm.innerHTML === "허용"){
                    alarm.innerHTML = "비허용"
                } else {
                    alarm.innerHTML = "허용"
                }              
            }
        </script>
	</div>    