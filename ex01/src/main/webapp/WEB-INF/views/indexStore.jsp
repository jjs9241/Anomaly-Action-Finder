<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<% List storeList = (List)request.getAttribute("storeList"); %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    	<link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/cctvlist.css"/>" rel="stylesheet">
		<link href="<c:url value="/resources/css/shoplist.css"/>" rel="stylesheet">
		<link href="<c:url value="/resources/css/alarm.css"/>" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=PT+Sans:700&display=swap" rel="stylesheet">
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
            <div class="title_con">
                <h2>매장 관리</h2>
            </div>
            <div class="table">
                <table>
                    <thead>
                        <tr>
                            <th class="number">No.</th>
                            <th class="name">name</th>
                            <th class="stored_ip">IP</th>
                            <th class="stored_id">Store ID</th>
                            <th class="address">Address</th>
                            <th class="rate">Rate</th>
                            <th class="edit">Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<sec:authorize access="isAuthenticated()">
                    	<c:forEach items="${storeList}" var="store" varStatus="status">
                    	<tr class="store">
            				<td class="number"><c:out value="${status.count}"/></td>
                            <td class="name"><a href="/stores/${store.pid}/cctvs"> <c:out value="${store.storeName}"/></a> </td>
                            <td class="stored_ip"><c:out value="${store.ip}"/></td>
                            <td class="stored_id"><c:out value="${store.pid}"/></td>                                    
                            <td class="address"><c:out value="${store.address}"/></td>
                            <td class="rate"><c:out value="${store.ip}"/></td>
                            <td class="edit">                                                       
                                <a href="/modifyStore" class="mr-2"><i class="fas fa-edit text-info"></i></a>
                                <a href="#"><i class="fas fa-trash-alt text-danger"></i></a>
                            </td>
        				</tr>
        				</c:forEach>
        				</sec:authorize>
<!--                         <tr> -->
<!--                             <td>3</td> -->
<!--                             <td class="name"><a href="/indexCCTV">shop</a></td> -->
<!--                             <td class="stored_ip">IP</td> -->
<!--                             <td class="stored_id">Store ID</td> -->
<!--                             <td class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa</td> -->
<!--                             <td class="rate">0.1%</td> -->
<!--                             <td class="edit">                                                        -->
<!--                                 <a href="/modifyStore" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a> -->
<!--                                 <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a> -->
<!--                             </td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td>4</td> -->
<!--                             <td class="name"><a href="/indexCCTV">shop</a></td> -->
<!--                             <td class="stored_ip">IP</td> -->
<!--                             <td class="stored_id">Store ID</td> -->
<!--                             <td class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa</td> -->
<!--                             <td class="rate">0.1%</td> -->
<!--                             <td class="edit">                                                        -->
<!--                                 <a href="/modifyStore" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a> -->
<!--                                 <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a> -->
<!--                             </td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<!--                             <td>5</td> -->
<!--                             <td class="name"><a href="/indexCCTV">shop</a></td> -->
<!--                             <td class="stored_ip">IP</td> -->
<!--                             <td class="stored_id">Store ID</td> -->
<!--                             <td class="address">인천광영시 부평구 adsfaldsfjlasdjflajdsflajdslfa</td> -->
<!--                             <td class="rate">0.1%</td> -->
<!--                             <td class="edit">                                                        -->
<!--                                 <a href="/modifyStore" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a> -->
<!--                                 <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a> -->
<!--                             </td> -->
<!--                         </tr> -->
                    </tbody>                           
                </table>
                <div class="table_footer">
                    <ul >
                        <li class="pre"><a href="#">Previous</a></li>
                        <li class="num first"><a href="#">1</a></li>
                        <li class="num"><a href="#">2</a></li>
                        <li class="next"><a href="#">Next</a></li>
                    </ul>
                    <button type="button"><a href="/registerStore?no=${storeList.size()+1}"><i class="fas fa-plus-circle"></i>Add New Store</a></button>
                </div>
            </div>
        <!--//content-->
    </div>  
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript">
    
        document.addEventListener("DOMContentLoaded", function(event) { 
<!--             docuemnt.getEl -->
        });
    </script>
</body>
</html>