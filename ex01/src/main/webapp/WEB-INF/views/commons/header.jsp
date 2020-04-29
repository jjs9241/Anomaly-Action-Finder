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
	        <a href="#"><i class="fas fa-cog"></i>Account</a>
	        <a id="logout" href="#"><i class="fas fa-sign-out-alt"></i>Logout</a>
	        <input id="csrf" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    </div>
	</div>    
<script src="//code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.2.0/socket.io.js" integrity="sha256-yr4fRk/GU1ehYJPAs8P4JlTgu0Hdsp4ZKrx8bDEDC3I=" crossorigin="anonymous"></script>	
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/pushNotification.js" ></script>
<!-- <script type="text/javascript" src="/resources/js/webSocket_finder.js" ></script> -->