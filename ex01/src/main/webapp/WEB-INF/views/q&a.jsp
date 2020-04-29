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
	    <link href="<c:url value="/resources/css/Q&A.css" />" rel="stylesheet">	 
	    <link href="<c:url value="/resources/css/alarm.css"/>" rel="stylesheet">   
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
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
	    <!--content-->
	    <div id="content">
	        <h2 class="content-head is-center">Contact Us!</h2>
	        <aside>
	             <p>
	                 궁금하시거나 <em>불편하신점을</em> 말씀해주세요! </p>
	                 <p>성함과 제안내용을 적어주시고 <b><em>이메일 주소를 적으신 뒤</em></b>
	                 메시지를 전송해주세요
	             </p>
	         </aside>
	      
	      <!-- START HERE -->
	    
	        <form class="gform pure-form pure-form-stacked" method="POST" data-email="mctheian@gmail.com"
	        action="https://script.google.com/macros/s/AKfycbwMxYDrufp73bKdU8gMvxFDdHRuzcR4IKQUB33B7GqwyfyZS04/exec">
	          <!-- change the form action to your script url -->
	      
	          <div class="form-elements">
	            <fieldset class="pure-group">
	              <label for="name">이름: </label>
	              <input id="name" name="name" placeholder="성함을 기입해 주세요" />
	            </fieldset>
	      
	            <fieldset class="pure-group">
	              <label for="message">내용: </label>
	              <textarea id="message" name="message" rows="10"
	              placeholder="문의와 제안사항을 말씀해 주세요"></textarea>
	            </fieldset>
	      
	            <fieldset class="pure-group">
	              <label for="email"><em>고객님의</em> 이메일주소:</label>
	              <input id="email" name="email" type="email" value=""
	              required placeholder="your.name@email.com"/>
	            </fieldset>
	               
	            <fieldset class="pure-group honeypot-field">
	              <label for="honeypot">To help avoid spam, utilize a Honeypot technique with a hidden text field; must be empty to submit the form! Otherwise, we assume the user is a spam bot.</label>
	              <input id="honeypot" type="text" name="honeypot" value="" />
	            </fieldset>
	      
	            <button><i class="fa fa-paper-plane"></i>&nbsp;Send</button>
	          </div>
	      
	          <!-- Customise the Thankyou Message People See when they submit the form: -->
	          <div class="thankyou_message" style="display:none;">
	            <h2><em>감사합니다!</em> 빠른 시간내에 확인 후  답변드리겠습니다</h2>
	          </div>
	      
	        </form>
	       
	    <!--//content-->
	</div>  

	<script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
</body>
</html>