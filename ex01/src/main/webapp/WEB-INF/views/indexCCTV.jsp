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
	    <div id="header">
	        <a href="#"><img src="resources/img/logo_b.png"  alt="로고"></a>
	        <ul class="navbar">
	            <li class="user_icon"><a href="#"></a></li>
	            <li class="notice"><i class="far fa-bell"></i></li>
	        </ul>
	        <div class="user_ele hide">
	            <div class="user_name">
	                <div class="user_icon2"></div>
	                <h2>Valerie Luna</h2>
	                <p>vluna@aol.com<p>
	            </div>
	            <a href=""><i class="fas fa-cog"></i>Account</a>
	            <a href=""><i class="fas fa-sign-out-alt"></i>Logout</a>
	        </div>
	    </div>
	    <!--//header-->
        <div id="wrap">
                <div id="side">
                    <!--sidebar-->
                    <div id="sidebar">
                        <div class="video_title">
                            <!--<span>VIDEO</span>-->
                            <ul>
                                <li>VIDEO</li>
                                <li><a href="/manage">CCTV 관제</a></li>
                                <li><a href="/map">지도</a></li>
                                <li><a href="/strange">이상행동</a></li>
                            </ul>
                        </div>
                        <div class="cctv">
                            <!--<span>CCTV</span>-->
                            <ul>
                                <li>CCTV</li>
                                <li><a href="/indexStore">CCTV 관리</a></li>
                            </ul>
                        </div>
                        <div class="qa">
                            <!--<span>Q&A</span>-->
                            <ul>
                                <li>Q&A</li>
                                <li><a href="/qa">문의하기</a></li>
                            </ul>
                        </div>
                    </div>
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
                                            <td>super</td>
                                        </tr>
                                        <tr>
                                            <td class="store_info">Store IP :</td>
                                            <td>1234adsfadfas</td>
                                        </tr>
                                        <tr>
                                            <td class="store_info">Store ID :</td>
                                            <td>1234</td>
                                        </tr>
                                        <tr>
                                            <td class="store_info">address :</td>
                                            <td>경기도 부천시 dlkfjaldsjfalksdjflkajsdfl;jadsl</td>
                                        </tr>
                                        <tr>
                                            <td class="store_info">total cctv :</td>
                                            <td>8</td>
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
		                               <c:forEach items="${cctvList}" var="store">
		                               <div class="cctv">
		                                <td class="number"><c:out value="${cctv.ip}"/></td>
		                                    <td class="name"><c:out value="${cctv.pid}"/></td>
		                                    <td class="cctvid"><c:out value="${cctv.pid}"/></td>
		                                    <td class="address"><c:out value="${cctv.address}"/></td>
		                                    <td class="rate"><c:out value="${cctv.ip}"/></td>
		                                    <td class="edit">                                                       
		                                        <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info"></i></a>
		                                        <a href="#"><i class="fas fa-trash-alt text-danger"></i></a>
		                                    </td>
			                            </div>
			                            </c:forEach>
			                            </sec:authorize>                  
                                        <tr>
                                            <td class="number">1</td>
                                            <td class="cctvid">cam1</td>
                                            <td class="host">Hostname</td>
                                            <td class="des">오른쪽 위1</td>
                                            <td class="edit">                                                       
                                                <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info"></i></a>
                                                <a href="#"><i class="fas fa-trash-alt text-danger"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td class="cctvid">cam2</td>
                                            <td class="host">Hostname</td>
                                            <td class="des">오른쪽 위2</td>
                                            <td class="edit">                                                       
                                                <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                                <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td class="cctvid">cam3</td>
                                            <td class="host">Hostname</td>
                                            <td class="des">왼쪽 위1</td>
                                            <td class="edit">                                                       
                                                <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                                <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td class="cctvid">cam4</td>
                                            <td class="host">Hostname</td>
                                            <td class="des">왼쪽 위2</td>
                                            <td class="edit">                                                       
                                                <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                                <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td class="cctvid">cam5</td>
                                            <td class="host">Hostname</td>
                                            <td class="des">Description</td>
                                            <td class="edit">                                                       
                                                <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                                <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td class="cctvid">cam6</td>
                                            <td class="host">Hostname</td>
                                            <td class="des">Description</td>
                                            <td class="edit">                                                       
                                                <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                                <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td class="cctvid">cam7</td>
                                            <td class="host">Hostname</td>
                                            <td class="des">Description</td>
                                            <td class="edit">                                                       
                                                <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                                <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td class="cctvid">cam8</td>
                                            <td class="host">Hostname</td>
                                            <td class="des">Description</td>
                                            <td class="edit">                                                       
                                                <a href="/modifyCCTV" class="mr-2"><i class="fas fa-edit text-info font-16"></i></a>
                                                <a href="#"><i class="fas fa-trash-alt text-danger font-16"></i></a>
                                            </td>
                                        </tr>               
                                    </tbody>                                                     
                                </table>
                                <div class="table_footer">
                                    <ul >
                                        <li class="pre2"><a href="#"><i class="fas fa-chevron-left"></i></a></li>
                                        <li class="num2"><a href="#">1</a></li>
                                        <li class="num2"><a href="#">2</a></li>
                                        <li class="next2"><a href="#"><i class="fas fa-chevron-right"></i></a></li>
                                    </ul>
                                    <button class="addcctv" type="button"><a href="/registerCCTV"><i class="fas fa-plus-circle"></i>Add New CCTV</a></button>
                                </div>
                            </div>
                        </div>
                    </div>
                <!--//content-->
            </div>  
            <script type="text/javascript"src="<c:url value="/resources/js/common.js" />"></script>
    </body>
    </html>