<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<% List cctvList = (List)request.getAttribute("cctvList"); %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
        <link href="<c:url value="/resources/css/cctvlist.css" />" rel="stylesheet">
    	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    	<link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet">
    	<link href="<c:url value="/resources/css/shoplist.css"/>" rel="stylesheet">
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
            <div class="wrap">
                <div class="title_con">
                    <h2>CCTV List</h2>
                </div>
                <div class="shop_table">
                    <div class="shop">
                        <table>
                            <thead>
                                <tr>
                                    <td colspan="2" class="store_title">매장 정보</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="store_info">Store Name :</td>
                                    <td>${store.storeName}</td>
                                </tr>
                                <tr>
                                    <td class="store_info">Store IP :</td>
                                    <td>${store.ip}</td>
                                </tr>
                                <tr>
                                    <td class="store_info">Store ID :</td>
                                    <td>${store.pid}</td>
                                </tr>
                                <tr>
                                    <td class="store_info">address :</td>
                                    <td>${store.address}</td>
                                </tr>
                                <tr>
                                    <td class="store_info">total cctv :</td>
                                    <td>${store.cctvUrlList.size()}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="cctvlist_table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="number">No.</th>
                                    <th class="cctvid">CCTVID</th>
                                    <th class="host">Hostname</th>
                                    <th class="des">Description</th>
                                    <th class="edit">Edit</th>                                           
                                </tr>
                            </thead>
                            <tbody>
	                         <sec:authorize access="isAuthenticated()">
	                         <c:forEach items="${cctvList}" var="cctv" varStatus="status">
	                         <tr class="cctv">
		                         <td class="number"><c:out value="${status.count}"/></td>
		                         <td class="name"><c:out value="${cctv.pid}"/></td>
		                         <td class="host"><c:out value="${cctv.hostName}"/></td>
		                         <td class="des"><c:out value="${cctv.description}"/></td>
		                         <td class="edit">                                                       
		                             <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info"></i></a>
		                             <a href="#"><i class="fas fa-trash-alt text-danger"></i></a>
		                         </td>
		                      </tr>
		                      </c:forEach>
		                      </sec:authorize>                  
	                                 
                            </tbody>                                                     
                        </table>
                        <div class="table_footer" style="position: absolute;top: 600px;width: 600px;">
                            <ul >
                                <li class="pre2"><a href="#"><i class="fas fa-chevron-left"></i></a></li>
                                <li class="num2"><a href="#">1</a></li>
                                <li class="num2"><a href="#">2</a></li>
                                <li class="next2"><a href="#"><i class="fas fa-chevron-right"></i></a></li>
                            </ul>
                            <button class="addcctv" type="button"><a href="/registerCCTV?no=${cctvList.size()+1}&storeId=${store.pid}"><i class="fas fa-plus-circle"></i>Add New CCTV</a></button>
                        </div>
                    </div>
                </div>
            </div>
        <!--//content-->
    </div>  
    <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
</body>
</html>